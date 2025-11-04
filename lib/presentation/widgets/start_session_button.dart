import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/providers/session_provider.dart';
import 'package:training_schedule_app/presentation/screens/session_select_screen.dart';
import 'package:training_schedule_app/presentation/screens/session_active_screen.dart';
import 'package:training_schedule_app/themes/app_colors.dart';
import 'package:training_schedule_app/themes/app_text_styles.dart';

class StartSessionButton extends StatelessWidget {
  final String routeName;

  const StartSessionButton({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Consumer<SessionProvider>(
          builder: (context, sessionData, child) {
            return ElevatedButton(
              onPressed: () {
                // reset blockIndex before navigating to workoutscreen
                sessionData.setWorkoutIndex(0);

                switch (routeName) {
                  case 'session_select_screen':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SessionSelectScreen(),
                      ),
                    );
                    break;
                  case 'workout_screen':
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActiveSessionScreen(),
                      ),
                    );
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Unknown route')),
                    );
                }
              },
              child: Text('Start session', style: context.h3),
            );
          },
        ),
      ),
    );
  }
}
