import 'package:flutter/material.dart';
import 'package:training_schedule_app/presentation/widgets/start_session_button.dart';
import 'package:training_schedule_app/presentation/widgets/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            MyTableCalendar(),
            Spacer(),
            StartSessionButton(routeName: 'session_detailed_screen'),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
