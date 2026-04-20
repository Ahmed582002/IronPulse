import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iron_pulse/features/home/data/cubit/p_lan_cubit.dart';
import 'package:iron_pulse/features/home/presentation/view/cardPlan.dart';

class PlanHome extends StatelessWidget {
  PlanHome({super.key});
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.bolt_outlined, color: Colors.blue)],
        title: Text("Iron pluse"),
        leading: Icon(Icons.notifications),
      ),
      body: BlocBuilder<PLanCubit, PLanState>(
        builder: (context, state) {
          if (state is PLanLoading) {
            return Center(child: CircularProgressIndicator());
          }
          else if (state is PLanSuccess) {
            return ListView.builder(
              itemBuilder: (context, ind) {
                return PlanCard(planModel: state.plan[ind]);
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
