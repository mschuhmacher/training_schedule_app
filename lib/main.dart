import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TrainingPlanModel(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily:'Poppins'),
      home: HomeScreen(),
    );
  }
}
