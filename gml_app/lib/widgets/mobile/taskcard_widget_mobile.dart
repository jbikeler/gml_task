import 'package:flutter/material.dart';
import 'package:gml_app/providers/tasks_provider.dart';
import 'package:gml_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatelessWidget {
  

  int taskId = 0;
  String title = "";
  int points = 0;
  
  TaskCard({super.key, required this.taskId, required this.title, required this.points});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd){
            context.read<UserProvider>().addPoints(points);
            context.read<TasksProvider>().deleteTask(taskId);
          }
          else {
            context.read<TasksProvider>().deleteTask(taskId);
          }

        },
        key: UniqueKey(),
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
              Icon(Icons.add,
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
// START Dismissable Main Widget
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
                          title,
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
                      child: Text(points.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 89, 204, 141),
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
// END Dismissable Main Widget
      );
  }
}
