import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/services/firebase_service.dart';
import 'package:iron_pulse/features/home/cubit/p_lan_cubit.dart';
import 'package:iron_pulse/shared/widgets/home/cardPlan.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final favService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PLanCubit>();

    return StreamBuilder<Map<String, dynamic>>(
      stream: favService.getFavoritesStream(),
      builder: (context, favSnapshot) {
        final favorites = favSnapshot.data ?? {};

        return BlocBuilder<PLanCubit, PLanState>(
          builder: (context, state) {
            if (state is PLanLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PLanSuccess) {
              final favPlans = state.plan.where((plan) {
                return favorites.containsKey(plan.id.toString());
              }).toList();

              if (favPlans.isEmpty) {
                return const Center(child: Text("No favorites yet 💔"));
              }

              return ListView.builder(
                itemCount: favPlans.length,
                itemBuilder: (context, index) {
                  final plan = favPlans[index];

                  return PlanCard(
                    planModel: plan,
                    isFav: true,
                    onFavTap: () {
                      favService.toggleFavorite(plan.id.toString());
                    },
                    onCardTap: () {
                      cubit.navigateToDetailes(context, plan.id);
                    },
                  );
                },
              );
            }

            return const SizedBox();
          },
        );
      },
    );
  }
}
