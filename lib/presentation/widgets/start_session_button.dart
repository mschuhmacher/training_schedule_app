import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/screens/session_detailed_screen.dart';
import 'package:training_schedule_app/presentation/screens/workout_screen.dart';

class StartSessionButton extends StatelessWidget {
  final String routeName;

  const StartSessionButton({super.key, required this.routeName});

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

                  switch (routeName) {
                    case 'session_detailed_screen':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SessionDetailedScreen(),
                        ),
                      );
                      break;
                    case 'workout_screen':
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutScreen(),
                        ),
                      );
                      break;
                    default:
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Unknown route')),
                      );
                  }
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
