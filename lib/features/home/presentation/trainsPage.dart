import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/core/constants/colors.dart';
import 'package:iron_pulse/features/home/cubit/trainer_cubit.dart';
import 'package:iron_pulse/shared/widgets/home/trainerCard.dart';

class TrainersPage extends StatelessWidget {
  const TrainersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerCubit, TrainerState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  onChanged: (value) {
                    context.read<TrainerCubit>().searchTrainers(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search your trainer...",
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.primary,
                    ),
                    filled: true,
                    fillColor: AppColors.secondary.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: Theme.of(
                      context,
                    ).textTheme.displayMedium!.copyWith(fontSize: 18),
                  ),
                ),
              ),
            ),
            if (state is TrainerLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (state is TrainerFauiler)
              SliverFillRemaining(
                child: Center(child: Text(state.errorMessage)),
              )
            else if (state is TrainerSuccess)
              state.res.isEmpty
                  ? const SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off_rounded,
                              size: 64,
                              color: AppColors.secondary,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "No trainers found",
                              style: TextStyle(
                                color: AppColors.bodyText,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return TrainerCard(trainer: state.res[index]);
                        }, childCount: state.res.length),
                      ),
                    )
            else
              const SliverToBoxAdapter(child: SizedBox()),
          ],
        );
      },
    );
  }
}
