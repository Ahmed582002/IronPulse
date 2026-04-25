import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/features/home/cubit/main_cubit.dart';
import 'package:iron_pulse/features/home/cubit/main_state.dart';
import 'package:iron_pulse/features/home/presentation/HomePlan_View.dart';
import 'package:iron_pulse/features/home/presentation/favorites_page.dart';
import 'package:iron_pulse/features/home/presentation/trainsPage.dart';
import 'package:iron_pulse/features/profile/presentation/profile_screen.dart';
import 'package:iron_pulse/shared/widgets/home/navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          final cubit = context.read<MainCubit>();

          final screens = [
            PlanHome(),
            TrainersPage(),
            FavoritesScreen(),
            const ProfileScreen(),
          ];

          return Scaffold(
            appBar: AppBar(
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.notifications),
                ),
              ],
              title: Text(
                "Iron pluse",
                style: Theme.of(
                  context,
                ).textTheme.displayLarge!.copyWith(fontSize: 20),
              ),
              leading: Icon(Icons.bolt_outlined, color: Colors.blue),
            ),
            body: screens[cubit.currentIndex],

            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
