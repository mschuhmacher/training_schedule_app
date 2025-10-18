import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/presentation/widgets/my_calendar.dart';
import 'package:training_schedule_app/presentation/widgets/start_session_button.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/providers/session_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (!mounted) return;
      await Provider.of<SessionProvider>(context, listen: false).init();

      if (!mounted) return;
      await Provider.of<PresetProvider>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (BuildContext context, sessionData, Widget? child) {
        if (sessionData.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        List<Session> selectedSessions = sessionData.selectedSessions;

        return Scaffold(
          appBar: AppBar(title: SizedBox(), centerTitle: true),
          body: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey, ready to climb?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Select a week to view your sessions',
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 60),
                StartSessionButton(routeName: 'session_select_screen'),
                SizedBox(height: 30),
                MyCalendar(),
                Spacer(),

                Expanded(
                  flex: 6,
                  child:
                      selectedSessions.isEmpty
                          ? const Center(
                            child: Text('No climbing sessions logged yet.'),
                          )
                          // TODO: move listView to separate widget file
                          : ListView.builder(
                            itemCount: selectedSessions.length,
                            itemBuilder: (context, index) {
                              final session = selectedSessions[index];
                              return ListTile(
                                title: Text(session.title),
                                subtitle: Text(
                                  'Date: ${session.date?.toLocal().toString().split(" ")[0]} • ${session.list.length} workouts',
                                ),
                              );
                            },
                          ),
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        );
      },
    );
  }
}
