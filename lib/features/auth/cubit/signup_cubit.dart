import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:iron_pulse/core/services/firebase_service.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final FirebaseService firebaseService = FirebaseService();

  SignupCubit(firebaseService) : super(SignupInitial());

  // =========================
  // SIGN UP EMAIL & PASSWORD
  // =========================
  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(Signuploading());

    try {
      /// 1. create account
      var userCredential = await firebaseService.register(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      /// 2. save user in Firestore
      await firebaseService.createUserWithId(
        collection: "users",
        id: uid,
        data: {"name": name, "email": email, "uid": uid},
      );

      emit(Signupsuccess(message: "Account Created ✅"));
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = 'البريد ده مستخدم بالفعل';
          break;
        case 'invalid-email':
          message = 'صيغة البريد غلط';
          break;
        case 'weak-password':
          message = 'الباسورد ضعيف جدًا';
          break;
        default:
          message = e.message ?? 'حدث خطأ';
      }

      emit(Signuperror(error: message));
    } catch (e) {
      emit(Signuperror(error: "Something went wrong"));
    }
  }

  // =========================
  // SIGN UP WITH GOOGLE
  // =========================
  Future<void> signUpWithGoogle() async {
    // emit(Signuploading());

    // try {
    //   final result = await firebaseService.signInWithGoogle();
    //   final user = result.user;

    //   if (user != null) {
    //     await firebaseService.createUserWithId(
    //       collection: "users",
    //       id: user.uid,
    //       data: {
    //         "name": user.displayName ?? "",
    //         "email": user.email ?? "",
    //         "uid": user.uid,
    //       },
    //     );
    //   }

    //   emit(Signupsuccess(message: "تم التسجيل بنجاح عبر Google ✅"));
    // } on FirebaseAuthException catch (e) {
    //   emit(Signuperror(error: e.message ?? 'حدث خطأ'));
    // } catch (e) {
    //   emit(Signuperror(error: "حدث خطأ"));
    // }
  }
}
