import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/services/firebase_service.dart';
import 'package:iron_pulse/features/home/cubit/p_lan_cubit.dart';
import 'package:iron_pulse/shared/widgets/home/cardPlan.dart';

class PlanHome extends StatelessWidget {
  PlanHome({super.key});
  final dio = Dio();
  final favService = FirebaseService();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PLanCubit>();
    return BlocBuilder<PLanCubit, PLanState>(
      builder: (context, state) {
        if (state is PLanLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PLanSuccess) {
          return StreamBuilder<Map<String, dynamic>>(
            stream: favService.getFavoritesStream(),
            builder: (context, snapshot) {
              final favorites = snapshot.data ?? {};

              return ListView.builder(
                itemCount: state.plan.length,
                itemBuilder: (context, ind) {
                  final plan = state.plan[ind];
                  final isFav = favorites.containsKey(plan.id.toString());

                  return PlanCard(
                    planModel: plan,
                    isFav: isFav,
                    onFavTap: () {
                      favService.toggleFavorite(plan.id.toString());
                    },
                    onCardTap: () {
                      cubit.navigateToDetailes(context, plan.id);
                    },
                  );
                },
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
