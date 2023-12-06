import 'package:flutter/material.dart';
import 'package:gml_app/providers/goals_provider.dart';
import 'package:gml_app/providers/tasks_provider.dart';
import 'package:gml_app/providers/user_provider.dart';
import 'package:gml_app/screen/mobile/goals_screen_mobile.dart';
import 'package:gml_app/screen/mobile/home_screen_mobile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TasksProvider()),
        ChangeNotifierProvider(create: (_) => GoalsProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GML',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const HomeMobile(),
        '/goals': (context) => const GoalsMobile(),
      }
    );
  }
}
