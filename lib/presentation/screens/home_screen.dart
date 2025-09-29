import 'package:flutter/material.dart';
import 'package:training_schedule_app/presentation/screens/session_detailed_screen.dart';
import 'package:training_schedule_app/presentation/screens/session_overview_screen.dart';
import 'package:training_schedule_app/presentation/screens/week_screen.dart';
import 'package:training_schedule_app/presentation/widgets/table_calendar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120,),
            MyTableCalendar(),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SessionOverviewScreen()),
                );
              },
              child: Text('Start session'),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
