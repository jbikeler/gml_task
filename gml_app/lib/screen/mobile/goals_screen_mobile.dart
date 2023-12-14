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

    Color themeColor = Color.fromARGB(255, 89, 204, 141);

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
            const Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: GoalList(),
              )
            ),
          ]
        ),
      ),
//START Action Button
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 50,
              width: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: themeColor,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                child: const Icon(Icons.done_all,
                  color: Color.fromARGB(255, 17, 3, 24),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: SizedBox(
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
                  backgroundColor: themeColor,
                  child: const Icon(
                    Icons.add,
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
//END Action Button
//START Bottom Nav
      // bottomNavigationBar: BottomAppBar(
      //   color: const Color.fromARGB(255, 23, 20, 44),
      //   shape: const CircularNotchedRectangle(),
      //   child: SizedBox(
      //     height: 60.0,
      //     child: Row(
      //       children: [
      //         const SizedBox(
      //           width: 10,
      //         ),
      //         SizedBox(
      //           height: 30,
      //           width: 30,
      //           child: IconButton(
      //             padding: const EdgeInsets.all(0.0),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             icon: const Icon(
      //               Icons.done_all,
      //               color: Colors.white,
      //               size: 30,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(
      //           width: 20,
      //         ),
      //         SizedBox(
      //           height: 30,
      //           width: 30,
      //           child: IconButton(
      //             padding: const EdgeInsets.all(0.0),
      //             onPressed: () {},
      //             icon: const Icon(
      //               Icons.stars,
      //               color: Color.fromARGB(255, 89, 204, 141),
      //               size: 30,
      //             ),
      //           ),
      //         ),
      //       ],
      //     )
      //   )
      // )
    );
  }
}


class GoalList extends StatelessWidget {
  const GoalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GoalsProvider>(builder: (context, value, child) => ListView.separated(
      itemCount: value.goalListStream.length,
      itemBuilder: (context, index) => GoalCard(goalData: value.goalListStream[index], goalWidgetId: index),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 8.0,
      ),
    ));
  }
}
