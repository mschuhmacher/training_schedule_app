import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/screens/workout_screen.dart';

class StartSessionButton extends StatelessWidget {
  const StartSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Opacity(
          opacity: 0.75,
          child: Consumer<TrainingPlanModel>(
            builder: (context, trainingData, child) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  // reset blockIndex before navigating to workoutscreen
                  trainingData.setBlockIndex(0);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WorkoutScreen()),
                  );
                },
                child: Text(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  'Start session',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
