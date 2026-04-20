import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/features/profile/data/user_repo.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UserRepo userRepo;

  ProfileCubit(this.userRepo) : super(ProfileInitial());

  final ImagePicker picker = ImagePicker();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  Future<void> getUserProfile() async {
    emit(ProfileLoading());

    final result = await userRepo.loadUserData();

    result.fold(
      (failure) {
        emit(ProfileError(failure.message));
      },
      (data) {
        final (user, image) = data;

        emit(ProfileSuccess(user: user, profileImage: image));
      },
    );
  }

  Future<void> pickAndEncodeImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile == null) return;

    final bytes = await File(pickedFile.path).readAsBytes();
    final base64Photo = base64Encode(bytes);

    if (state is ProfileSuccess) {
      final currentState = state as ProfileSuccess;

      emit(
        currentState.copyWith(base64Photo: base64Photo, profileImage: bytes),
      );
    }
  }

  Future<void> logout(context) async {
    emit(ProfileLoading());

    final result = await userRepo.logout();

    result.fold(
      (failure) {
        emit(ProfileError(failure.message));
      },
      (_) {
        Navigator.pushReplacementNamed(context, AppRoute.login);
      },
    );
  }

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
  }) async {
    if (state is! ProfileSuccess) return;

    final currentState = state as ProfileSuccess;

    emit(ProfileLoading());

    final result = await userRepo.updateProfile(
      userId: currentState.user.id ?? "",
      name: name,
      email: email,
      phone: phone,
      base64Photo: currentState.base64Photo.isEmpty
          ? null
          : currentState.base64Photo,
    );

    result.fold(
      (failure) {
        emit(ProfileError(failure.message));
      },
      (message) async {
        emit(UpdateProfileSuccess(message));

        await getUserProfile();
      },
    );
  }
}
