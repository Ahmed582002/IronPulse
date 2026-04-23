import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/features/auth/cubit/signup_cubit.dart';
import 'package:iron_pulse/shared/widgets/auth/coustomtext.dart';
import 'package:iron_pulse/shared/widgets/auth/coustomtextformfield.dart';
import 'package:iron_pulse/shared/widgets/custom_button.dart';

// ignore: must_be_immutable, camel_case_types
class signupScreen extends StatelessWidget {
  GlobalKey<FormState> formsignup = GlobalKey();
  final nameController = TextEditingController();
  final emailsignController = TextEditingController();
  final passwordsignController = TextEditingController();

  signupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is Signupsuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          Navigator.pushReplacementNamed(context, AppRoute.login);
        }
        if (state is Signuperror) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: coustomtext(
              text: "IRONPULSE",
              color: AppColors.headText,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: "Lexend",
            ),
          ),
          body: Form(
            key: formsignup,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Image.asset(AppImages.login, width: double.infinity),

                      Positioned(
                        right: 99,
                        bottom: 70,
                        child: coustomtext(
                          text: 'Join the Forge',
                          color: AppColors.headText,
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Lexend",
                        ),
                      ),

                      Positioned(
                        right: 66,
                        bottom: 30,
                        child: coustomtext(
                          text: 'Start your transformation journey today.',
                          color: AppColors.bodyText,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: coustomtextformfield(
                      lable: "Full Name",
                      controller: nameController,
                      password: false,
                      icon: Icon(Icons.email),
                      hintText: 'enter your name',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: coustomtextformfield(
                      lable: "Email Address",
                      controller: emailsignController,
                      password: false,
                      icon: Icon(Icons.email),
                      hintText: 'enter your Email',
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: coustomtextformfield(
                      lable: "Your password",
                      hintText: "password",
                      controller: passwordsignController,
                      password: true,
                      icon: Icon(Icons.lock_outline, color: Colors.black),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: state is Signuploading
                          ? "Loading..."
                          : "Create Account",

                      onPressed: state is Signuploading
                          ? null
                          : () {
                              if (formsignup.currentState!.validate()) {
                                context.read<SignupCubit>().signup(
                                  name: nameController.text,
                                  email: emailsignController.text,
                                  password: passwordsignController.text,
                                );
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
                          text: "Or",
                          color: AppColors.secondary,
                          fontSize: 17,
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: AppColors.bodyText),
                            color: AppColors.background,
                          ),
                          height: 50,
                          width: 366,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.google, height: 35),
                              SizedBox(width: 10),
                              coustomtext(
                                text: "Sign up with Google",
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      coustomtext(
                        text: "Already have an account?",
                        color: AppColors.bodyText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: coustomtext(
                          text: "Log in",
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
        );
      },
    );
  }
}
