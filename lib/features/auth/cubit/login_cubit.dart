import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/core/services/firebase_service.dart';
import 'package:iron_pulse/features/auth/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final service = FirebaseService();
  LoginCubit(service) : super(LoginInitial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoading());
    try {
      final result = await service.login(
        email: emailController.text,
        password: passwordController.text,
      );
      emit(LoginSuccess("Login Success: ${result.user?.email}"));
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'invalid-credential': // ← ده السبب الأساسي للمشكلة
        case 'wrong-password':
          message = 'البريد أو كلمة المرور غلط';
          break;

        case 'user-not-found':
          message = 'مفيش حساب بالبريد ده';
          break;

        case 'invalid-email':
          message = 'صيغة البريد غلط';
          break;

        case 'user-disabled':
          message = 'الحساب ده موقوف';
          break;

        case 'too-many-requests':
          message = 'محاولات كتير، جرب تاني بعد شوية';
          break;

        case 'network-request-failed':
          message = 'تحقق من اتصالك بالإنترنت';
          break;

        default:
          message =
              e.message ?? 'حدث خطأ، حاول مرة أخرى'; // ← e.message بدل نص ثابت
      }

      emit(LoginError(message));
    } catch (e) {
      emit(LoginError('Something went wrong'));
    }
  }

  void goToSignUp(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoute.signup);
  }

  Future<void> signUpWithGoogle() async {
    emit(LoginLoading());
    try {
      await service.signInWithGoogle();
      emit(LoginSuccess("تم التسجيل بنجاح ✅"));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.message ?? 'حدث خطأ'));
    } catch (e) {
      emit(LoginError('حدث خطأ'));
    }
  }

  Future<void> signUpWithFacebook() async {
    emit(LoginLoading());
    try {
      await service.signInWithFacebook();
      emit(LoginSuccess("تم التسجيل بنجاح ✅"));
    } on FirebaseAuthException catch (e) {
      emit(LoginError(e.message ?? 'حدث خطأ'));
    } catch (e) {
      emit(LoginError('حدث خطأ'));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
