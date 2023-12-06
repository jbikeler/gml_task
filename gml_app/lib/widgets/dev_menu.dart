import 'package:flutter/material.dart';
import 'package:gml_app/providers/goals_provider.dart';
import 'package:gml_app/providers/tasks_provider.dart';
import 'package:gml_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

class DevMenu extends StatelessWidget {
  DevMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text('New Task'),
      content: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Consumer<UserProvider>(
                builder: (context, value, child) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: (){print(value.points);},
                  child: const Text('Get Points',
                    style: TextStyle(color: Colors.white),
                  )
                ),
              ),
              Consumer<TasksProvider>(
                builder: (context, value, child) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: (){print(value.tasklist.length);},
                  child: const Text('Get Task Amount',
                    style: TextStyle(color: Colors.white),
                  )
                ),
              ),
              Consumer<GoalsProvider>(
                builder: (context, value, child) => TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: (){print(value.goallist.length);},
                  child: const Text('Get Goal Amount',
                    style: TextStyle(color: Colors.white),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 222, 112, 148),
            ),
            child: const Text("Cancel",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
        ),
      ],
    );
  }
}