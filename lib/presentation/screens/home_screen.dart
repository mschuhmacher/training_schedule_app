import 'package:flutter/material.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/presentation/widgets/start_session_button.dart';
import 'package:training_schedule_app/presentation/widgets/table_calendar.dart';
import 'package:training_schedule_app/services/session_logger.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Session> loggedSessions = [];

  @override
  void initState() {
    super.initState();
    _loadLoggedSessions();
  }

  Future<void> _loadLoggedSessions() async {
    final sessions = await SessionLogger.readLogs();
    setState(() {
      loggedSessions = sessions;
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
                  loggedSessions.isEmpty
                      ? const Center(
                        child: Text('No climbing sessions logged yet.'),
                      )
                      : ListView.builder(
                        itemCount: loggedSessions.length,
                        itemBuilder: (context, index) {
                          final session = loggedSessions[index];
                          return ListTile(
                            title: Text(session.title),
                            subtitle: Text(
                              'Date: ${session.date.toLocal().toString().split(" ")[0]} • ${session.list.length} blocks',
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
