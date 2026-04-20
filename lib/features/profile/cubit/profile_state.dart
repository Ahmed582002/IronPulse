import 'dart:typed_data';
import 'package:iron_pulse/shared/models/user_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class UpdateProfileSuccess extends ProfileState {
  final String message;

  UpdateProfileSuccess(this.message);
}

class ProfileSuccess extends ProfileState {
  final UserModel user;
  final Uint8List? profileImage;
  final String base64Photo;

  ProfileSuccess({
    required this.user,
    this.profileImage,
    this.base64Photo = "",
  });

  ProfileSuccess copyWith({
    UserModel? user,
    Uint8List? profileImage,
    String? base64Photo,
  }) {
    return ProfileSuccess(
      user: user ?? this.user,
      profileImage: profileImage ?? this.profileImage,
      base64Photo: base64Photo ?? this.base64Photo,
    );
  }
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);
}
