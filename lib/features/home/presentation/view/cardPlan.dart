import 'package:flutter/material.dart';
import 'package:iron_pulse/features/home/data/model/plan_model.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({super.key, required this.planModel});
  final PlanModel planModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(98, 2, 20, 75),
      shape: RoundedRectangleBorder(
        
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        children: [
          Image.network(planModel.image, fit: BoxFit.cover),
          SizedBox(width: 5),
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        planModel.level,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border),
                    ),
                  ],
                ),
                Text(
                  planModel.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Opacity(opacity: 0.5, child: Text(planModel.description)),
                SizedBox(height: 20),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded),
                        Text("60 min"),
                      ],
                    ),
                    Row(children: [Icon(Icons.fitness_center), Text("weight")]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
