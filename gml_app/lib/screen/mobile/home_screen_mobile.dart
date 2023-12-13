import 'package:flutter/material.dart';
import 'package:gml_app/data/database.dart';
import 'package:gml_app/providers/tasks_provider.dart';
import 'package:gml_app/providers/user_provider.dart';
import 'package:gml_app/widgets/dev_menu.dart';
import 'package:gml_app/widgets/mobile/taskcard_widget_mobile.dart';
import 'package:gml_app/widgets/mobile/taskform_widget_mobile.dart';
import 'package:provider/provider.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('T A S K S',
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 17, 3, 24),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 3, 24),
//START Body
      body: SafeArea(
        child: Column(
          children: [
//START Points Section
            SizedBox(
              height: 120,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.stars,
                    color: Colors.amber,
                    size: 40,
                    ),
                    //Spacer
                    const SizedBox(
                      width: 10,
                    ),
                    //'POINTS' Text
                    const Text("POINTS:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    //Spacer
                    const SizedBox(
                      width: 10,
                    ),
                    //Points amount
                    Consumer<UserProvider>(
                      builder: (context, value, child) => Text(value.userPoints.toString(),
                        style: const TextStyle(
                          color: Colors.amber,
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
//END Points Section
//START Tasks Section
            const Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: TaskList(),
              )
            ),
//END Tasks Section
          ]
        ),
      ),
//END Body
//START Action Button
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
//END Action Button
//START Bottom Nav
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 23, 20, 44),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0,
          child: Row(
//START Task Page Button
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.done_all,
                    color: Color.fromARGB(255, 89, 204, 141),
                    size: 40,
                  ),
                ),
              ),
//END Task Page Button
              const SizedBox(
                width: 20,
              ),
//START Goal Page Button
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {
                    Navigator.pushNamed(context, "/goals");
                  },
                  icon: const Icon(
                    Icons.stars,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
//END Goal Page Button
              const SizedBox(
                width: 60,
              ),
//START Dev Menu
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return DevMenu();
                      }
                    );
                  },
                  icon: const Icon(
                    Icons.developer_mode,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
//END Dev Menu
            ],
          )
        )
      )
    );
  }
}
//END Bottom Nav


class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, value, child) => ListView.separated(
      itemCount: value.taskListStream.length,
      itemBuilder: (context, index) => TaskCard(taskWidgetId: index, taskData: value.taskListStream[index],),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 8.0,
      ),
    ));
  }
}
