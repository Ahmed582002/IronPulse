import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/core/constants/routes.dart';
import 'package:iron_pulse/core/themes/responsive.dart';
import 'package:iron_pulse/features/profile/cubit/profile_cubit.dart';
import 'package:iron_pulse/features/profile/cubit/profile_state.dart';
import 'package:iron_pulse/shared/widgets/custom_button.dart';
import 'package:iron_pulse/shared/widgets/profile/profile_button.dart';
import 'package:iron_pulse/shared/widgets/profile/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final cubit = context.read<ProfileCubit>();

        if (state is ProfileLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProfileError) {
          return Center(child: Text(state.message));
        }

        if (state is ProfileSuccess) {
          return ListView(
            children: [
              SizedBox(height: context.hp(0.03)),
              Container(
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
              SizedBox(height: context.hp(0.03)),
              Center(
                child: Text(
                  state.user.name,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(fontSize: 25),
                ),
              ),
              SizedBox(height: context.hp(0.01)),
              Center(
                child: Text(
                  state.user.email,
                  style: Theme.of(
                    context,
                  ).textTheme.displayMedium!.copyWith(fontSize: 14),
                ),
              ),
              SizedBox(height: context.hp(0.03)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: CustomButton(
                  text: "Edit Profile",
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.editProfile);
                  },
                ),
              ),
              SizedBox(height: context.hp(0.03)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileCard(
                      hours: 5,
                      label: "Plans \nCompleted",
                      icon: Icons.task_alt,
                    ),
                    ProfileCard(
                      hours: 120,
                      label: "workout \nhours",
                      icon: Icons.timer_outlined,
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.hp(0.03)),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Account Settings",
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge!.copyWith(fontSize: 20),
                ),
              ),
              SizedBox(height: context.hp(0.02)),
              ProfileButton(
                title: "Notifcations",
                leadingIcon: Icons.notifications_outlined,
                iconBackgroundColor: AppColors.primary.withOpacity(0.2),
                iconColor: AppColors.primary,
              ),

              ProfileButton(
                title: "Privacy & Security",
                leadingIcon: Icons.security,
                iconBackgroundColor: AppColors.primary.withOpacity(0.2),
                iconColor: AppColors.primary,
              ),
              ProfileButton(
                title: "Language",
                leadingIcon: Icons.language,
                iconBackgroundColor: AppColors.primary.withOpacity(0.2),
                iconColor: AppColors.primary,
              ),
              ProfileButton(
                title: "Sign Out",
                leadingIcon: Icons.logout,
                iconBackgroundColor: Colors.red.withOpacity(0.2),
                iconColor: Colors.red,
                textColor: Colors.red,
                onTap: () {
                  cubit.logout(context);
                },
              ),
              SizedBox(height: context.hp(0.02)),
            ],
          );
        }

        return const SizedBox();
      },
    );
  }
}
