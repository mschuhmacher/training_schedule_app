import 'package:flutter/material.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Workout'),
      body: Center(child: Text('This is the workout screen')),
    );
  }
}
