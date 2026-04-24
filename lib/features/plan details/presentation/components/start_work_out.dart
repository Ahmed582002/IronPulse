import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';

class StrartWorkOut extends StatelessWidget {
  const StrartWorkOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () {
       //todo
     },
      child: Container(
       padding: EdgeInsets.all( 16),
       width: double.infinity,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),
         color: AppColors.primary
       ),
       child: Center(
         child: Text("START WORKOUT" , style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 16 , color: Colors.white),),
       ),
      ),
    );
  }
}