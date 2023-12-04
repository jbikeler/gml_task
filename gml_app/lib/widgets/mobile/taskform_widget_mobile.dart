import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gml_app/providers/tasks_provider.dart';
import 'package:provider/provider.dart';

class TaskForm extends StatelessWidget {
  TaskForm({super.key});

  final nameController = TextEditingController();
  final pointsController = TextEditingController();

  void createTask(BuildContext context){
    context.read<TasksProvider>().addTask(nameController.text, int.parse(pointsController.text));
    Navigator.of(context).pop();
    nameController.clear();
    pointsController.clear();
  }
 
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
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Task Name",
                  icon: Icon(Icons.task),
                ),
              ),
              TextFormField(
                controller: pointsController,
                decoration: const InputDecoration(
                  labelText: "Points",
                  icon: Icon(Icons.star),
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Consumer(
          builder: (context, value, child) => ElevatedButton(
            child: const Text("Create Task"),
            onPressed: () {
              createTask(context);
            },
          ),
        ),
      ],
    );
  }
}