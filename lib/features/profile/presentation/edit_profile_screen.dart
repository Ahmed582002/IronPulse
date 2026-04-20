import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/core/themes/responsive.dart';
import 'package:iron_pulse/features/profile/cubit/profile_cubit.dart';
import 'package:iron_pulse/features/profile/cubit/profile_state.dart';
import 'package:iron_pulse/shared/widgets/custom_button.dart';
import 'package:iron_pulse/shared/widgets/profile/custom_profile_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: Theme.of(
            context,
          ).textTheme.displayLarge!.copyWith(fontSize: 20),
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();

          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }

          if (state is ProfileSuccess) {
            cubit.nameController.text = state.user.name;
            cubit.emailController.text = state.user.email;
            cubit.phoneController.text = state.user.phone;
            return ListView(
              children: [
                SizedBox(height: context.hp(0.03)),
                GestureDetector(
                  onTap: () {
                    cubit.pickAndEncodeImage();
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2632),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: state.profileImage != null
                          ? DecorationImage(
                              image: MemoryImage(state.profileImage!),
                              fit: BoxFit.values.last,
                            )
                          : null,
                    ),
                    child: state.profileImage == null
                        ? const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 35,
                          )
                        : null,
                  ),
                ),
                SizedBox(height: context.hp(0.02)),
                Text(
                  "Change Profile Picture",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontSize: 16,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: context.hp(0.05)),
                CustomProfileTextField(
                  label: "Full Name",
                  controller: cubit.nameController,
                  hintText: "Enter your Name",
                ),
                CustomProfileTextField(
                  label: "Email Address",
                  controller: cubit.emailController,
                  hintText: "Enter your Email",
                  icon: Icons.email_outlined,
                ),
                CustomProfileTextField(
                  label: "Phone Nymber",
                  controller: cubit.phoneController,
                  hintText: "Enter your Phone Number",
                  icon: Icons.phone_outlined,
                ),
                SizedBox(height: context.hp(0.05)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomButton(
                    text: "Save Changes",
                    onPressed: () async {
                      await cubit.updateProfile(
                        name: cubit.nameController.text,
                        email: cubit.emailController.text,
                        phone: cubit.phoneController.text,
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoute.profile,
                        (route) => false,
                      );
                    },
                  ),
                ),
                SizedBox(height: context.hp(0.01)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: CustomButton(
                    text: "Cancel Changes",
                    color: AppColors.background,
                    textColor: AppColors.bodyText,
                    fontSize: 16,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
