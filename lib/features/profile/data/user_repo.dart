import 'dart:convert';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iron_pulse/core/errors/failure.dart';
import 'package:iron_pulse/core/services/firebase_service.dart';
import 'package:iron_pulse/shared/models/user_model.dart';

class UserRepo {
  final FirebaseService firebaseService;
  final FirebaseAuth auth;

  UserRepo(this.firebaseService, this.auth);

  Future<Either<Failure, (UserModel, Uint8List?)>> loadUserData() async {
    try {
      String? userId = firebaseService.getUserId();

      final doc = await firebaseService.readOne(
        collection: "users",
        id: userId ?? "",
      );

      if (!doc.exists) {
        return Left(Failure("User not found"));
      }

      final userModel = UserModel.fromMap(
        doc.data() as Map<String, dynamic>,
        doc.id,
      );

      Uint8List? image;

      if (userModel.photoBase64.isNotEmpty) {
        image = base64Decode(userModel.photoBase64);
      }

      return Right((userModel, image));
    } catch (e) {
      return Left(Failure("Failed to load user data"));
    }
  }

  Future<Either<Failure, void>> logout() async {
    try {
      await auth.signOut();

      return const Right(null);
    } catch (e) {
      return Left(Failure("Logout failed"));
    }
  }

  Future<Either<Failure, String>> updateProfile({
    required String userId,
    required String name,
    required String email,
    required String phone,
    String? base64Photo,
  }) async {
    try {
      await firebaseService.update(
        collection: "users",
        id: userId,
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          if (base64Photo != null) "photoBase64": base64Photo,
        },
      );

      return const Right("Profile updated successfully");
    } catch (e) {
      return Left(Failure("Failed to update profile"));
    }
  }
}
