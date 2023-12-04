import 'package:flutter/material.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 3, 24),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 89, 204, 141),
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 23, 20, 44),
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60.0,
          child: Row(
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
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
                  padding: EdgeInsets.all(0.0),
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
