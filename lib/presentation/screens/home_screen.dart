import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/presentation/screens/cheat_sheet_screen.dart';
import 'package:training_schedule_app/presentation/screens/colorscheme_demo_screen.dart';
import 'package:training_schedule_app/presentation/widgets/my_calendar.dart';
import 'package:training_schedule_app/presentation/widgets/start_session_button.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/providers/session_log_provider.dart';
import 'package:training_schedule_app/services/session_logger.dart';
import 'package:training_schedule_app/themes/app_text_styles.dart';

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
      await Provider.of<SessionLogProvider>(context, listen: false).init();

      if (!mounted) return;
      await Provider.of<PresetProvider>(context, listen: false).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionLogProvider>(
      builder: (BuildContext context, sessionLogData, Widget? child) {
        if (sessionLogData.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        List<Session> selectedSessions = sessionLogData.selectedSessions;

        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ColorSchemeDemoScreen(),
                      ),
                    );
                  },
                  child: Text(' test screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Material3ColorCheatSheet(),
                      ),
                    );
                  },
                  child: Text(' cheat sheet'),
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text('Hey, ready to climb?', style: context.h1),
                ),

                SizedBox(height: 40),
                StartSessionButton(routeName: 'session_select_screen'),
                SizedBox(height: 40),
                MyCalendar(),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Logged sessions',
                        style: context.h3,
                        textAlign: TextAlign.start,
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                        ),
                        onPressed: () {
                          sessionLogData.clearAllLoggedSessions();
                        },
                        child: Text('Clear logs', style: context.bodyMedium),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child:
                      selectedSessions.isEmpty
                          ? Center(
                            child: Text(
                              'No climbing sessions logged yet.',
                              style: context.bodyLarge,
                            ),
                          )
                          // TODO: move listView to separate widget file
                          : ListView.builder(
                            itemCount: selectedSessions.length,
                            itemBuilder: (context, index) {
                              final session = selectedSessions[index];
                              final date = session.date;

                              final formattedDate =
                                  date != null
                                      ? DateFormat('dd MMM yyyy').format(date)
                                      : '';
                              final formattedTime =
                                  date != null
                                      ? DateFormat('HH:mm').format(date)
                                      : '';

                              return ListTile(
                                title: Text(
                                  session.title,
                                  style: context.title,
                                ),
                                subtitle: Text(
                                  '$formattedDate at $formattedTime • ${session.list.length} workouts',
                                  style: context.bodyMedium,
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
