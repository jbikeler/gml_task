import 'package:flutter/material.dart';
import 'package:gml_app/providers/tasks_provider.dart';
import 'package:gml_app/widgets/mobile/taskcard_widget_mobile.dart';
import 'package:gml_app/widgets/mobile/taskform_widget_mobile.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 3, 24),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 120,
              child: Center(
                child: Text("Tasks:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TaskList(),
              )
            ),
          ]
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return TaskForm();
              });
          },
          backgroundColor: const Color.fromARGB(255, 89, 204, 141),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 23, 20, 44),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.done_all,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.stars,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          )
        )
      )
    );
  }
}


class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, value, child) => ListView.separated(
      itemCount: value.tasklist.length,
      itemBuilder: (context, index) => TaskCard(taskId: index, title: value.tasklist[index].title, points: value.tasklist[index].points,),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 8.0,
      ),
    ));
  }
}
