import 'package:flutter/material.dart';
import 'package:gml_app/providers/goals_provider.dart';
import 'package:gml_app/providers/user_provider.dart';
import 'package:gml_app/widgets/mobile/goalcard_widget_mobile.dart';
import 'package:gml_app/widgets/mobile/goalform_widget_mobile.dart';
import 'package:provider/provider.dart';

class GoalsMobile extends StatelessWidget {
  const GoalsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('G O A L S',
        style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 17, 3, 24),
      ),
      backgroundColor: const Color.fromARGB(255, 17, 3, 24),
      body: SafeArea(
        child: Column(
          children: [
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
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("POINTS:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    //Points amount
                    Consumer<UserProvider>(
                      builder: (context, value, child) => Text(value.points.toString(),
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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GoalList(),
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
                return GoalForm();
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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


class GoalList extends StatelessWidget {
  const GoalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GoalsProvider>(builder: (context, value, child) => ListView.separated(
      itemCount: value.goallist.length,
      itemBuilder: (context, index) => GoalCard(goalId: index, title: value.goallist[index].title, points: value.goallist[index].points,),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 8.0,
      ),
    ));
  }
}
