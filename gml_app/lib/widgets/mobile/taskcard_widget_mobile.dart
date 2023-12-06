import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {

  int taskId = 0;
  String title = "";
  int points = 0;
  
  TaskCard({super.key, required this.taskId, required this.title, required this.points});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 23, 20, 44)
        ),
        height: 60.0,
        child: Row(
          children: [
            Expanded( //Complete task button
              flex: 1,
              child: SizedBox(
                height: double.infinity,
                child: TextButton(
                  onPressed:  () => {
                    print('complete button')
                  },
                  child: const Icon(
                    Icons.radio_button_unchecked,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
                  child: Text(points.toString(), //TODO: the text needs to be right aligned or i could limit characters in the taskform input or make enum presets only
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
    );
  }
}
