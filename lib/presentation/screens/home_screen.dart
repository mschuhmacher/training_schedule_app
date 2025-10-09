import 'package:flutter/material.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/presentation/widgets/start_session_button.dart';
import 'package:training_schedule_app/presentation/widgets/table_calendar.dart';
import 'package:training_schedule_app/services/workout_logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Session> loggedWorkouts = [];

  @override
  void initState() {
    super.initState();
    _loadLoggedWorkouts();
  }

  Future<void> _loadLoggedWorkouts() async {
    final workouts = await WorkoutLogger.readLogs();
    setState(() {
      loggedWorkouts = workouts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            MyTableCalendar(),
            // Spacer(),
            Expanded(
              flex: 6,
              child:
                  loggedWorkouts.isEmpty
                      ? const Center(child: Text('No workouts logged yet.'))
                      : ListView.builder(
                        itemCount: loggedWorkouts.length,
                        itemBuilder: (context, index) {
                          final workout = loggedWorkouts[index];
                          return ListTile(
                            title: Text(workout.title),
                            subtitle: Text(
                              'Date: ${workout.date.toLocal().toString().split(" ")[0]} • ${workout.list.length} blocks',
                            ),
                            trailing: const Icon(Icons.fitness_center),
                          );
                        },
                      ),
            ),
            Spacer(flex: 2),
            StartSessionButton(routeName: 'session_detailed_screen'),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
