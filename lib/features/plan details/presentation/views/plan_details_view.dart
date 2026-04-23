import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/imgaes.dart';

class PlanDetailsView extends StatelessWidget {
  const PlanDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plan Details" , style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 18),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:12.0),
            child: Image.asset(AppImages.favAppBar),
          ),
          
        ],
      ),
    );
  }
}
