import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/features/auth/cubit/login_cubit.dart';
import 'package:iron_pulse/features/auth/cubit/login_state.dart';
import 'package:iron_pulse/shared/widgets/auth/coustomtext.dart';
import 'package:iron_pulse/shared/widgets/auth/coustomtextformfield.dart';
import 'package:iron_pulse/shared/widgets/custom_button.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> formlogin = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushReplacementNamed(context, AppRoute.profile);
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "IronPulse",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: Form(
              key: formlogin,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListView(
                  children: [
                    Image.asset(AppImages.login),

                    coustomtext(
                      text: 'Welcome Back',
                      color: AppColors.headText,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),

                    coustomtext(
                      text: 'Fuel your progress. Log in to your pulse.',
                      color: AppColors.bodyText,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: coustomtextformfield(
                        lable: "Email Address",
                        controller: context.read<LoginCubit>().emailController,
                        password: false,
                        icon: Icon(Icons.email),
                        hintText: 'enter your Email',
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: coustomtextformfield(
                        lable: "Password",
                        hintText: "enter your Password",
                        controller: context
                            .read<LoginCubit>()
                            .passwordController,
                        password: true,
                        icon: Icon(Icons.lock_outline, color: Colors.black),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(
                        text: state is LoginLoading ? "Loading..." : "Log In",
                        onPressed: state is LoginLoading
                            ? null
                            : () {
                                if (formlogin.currentState!.validate()) {
                                  context.read<LoginCubit>().login();
                                }
                              },
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width: 90,
                          color: AppColors.bodyText,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: coustomtext(
                            text: "Or continue with",
                            color: AppColors.secondary,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: 1,
                          width: 90,
                          color: AppColors.bodyText,
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(color: AppColors.bodyText),
                                color: AppColors.background,
                              ),
                              height: 70,
                              width: 160,
                              child: Row(
                                children: [
                                  Image.asset(AppImages.google, height: 47),
                                  SizedBox(width: 10),
                                  coustomtext(
                                    text: "Google",
                                    color: AppColors.headText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Lexend",
                                  ),
                                ],
                              ),
                            ),
                          ),

                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(color: AppColors.bodyText),
                                color: AppColors.background,
                              ),
                              height: 70,
                              width: 160,
                              child: Row(
                                children: [
                                  Image.asset(AppImages.facebook, height: 40),
                                  SizedBox(width: 4),
                                  coustomtext(
                                    text: "facebook",
                                    color: AppColors.headText,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Lexend",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        coustomtext(
                          text: "Don't have an account?",
                          color: AppColors.bodyText,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoute.signup);
                          },
                          child: coustomtext(
                            text: "Sign Up",
                            color: AppColors.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
