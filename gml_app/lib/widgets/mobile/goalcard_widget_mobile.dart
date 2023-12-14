import 'package:flutter/material.dart';
import 'package:gml_app/data/database.dart';
import 'package:gml_app/providers/goals_provider.dart';
import 'package:gml_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class GoalCard extends StatelessWidget {

  GoalItem goalData;
  int goalWidgetId = 0;
  
  // String title = "";
  // int points = 0;
  
  GoalCard({super.key,required this.goalData, required this.goalWidgetId});

  @override
  Widget build(BuildContext context) {
    //check to see if user has enough points to spend on goal
    bool canDissmiss = (Provider.of<UserProvider>(context).userPoints >= goalData.points) ? true : false;
    return Dismissible(
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd){
            context.read<UserProvider>().removePoints(goalData.points);
            context.read<GoalsProvider>().deleteGoal(goalData.id);
          }
          else {
            context.read<GoalsProvider>().deleteGoal(goalData.id);
          }
        },
        //if the user does not have enough point lock the dissmiss direction so they cant delete goal
        direction: (canDissmiss) ? DismissDirection.horizontal : DismissDirection.endToStart,
// START Dismissable Background Widget
        background: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.amber
          ),
          height: 60.0,
          child: const Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(Icons.remove,
              color: Colors.white,
              ),
              Text("POINTS",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
// END Dismissable Background Widget
// Start Dismissable Secondary Background Widget
        secondaryBackground: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.red
          ),
          height: 60.0,
          child: const Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "DELETE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
// END Dismissable Secondary Background Widget
        key: UniqueKey(),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 23, 20, 44)
          ),
          height: 60.0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              children: [
                Expanded( //Task Name
                  flex: 5,
                  child: TextButton(
                    onPressed: () => {
                      print('task button')
                    },
                    child: Row(
                      children: [
                        Text(
                          goalData.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Expanded(child: Container())
                      ],
                    )
                  ),
                ),
                Expanded( //Points
                  flex: 1,
                  child: SizedBox(
                    height: double.infinity,
                    child: Center(
                      child: Text(goalData.points.toString(),
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
