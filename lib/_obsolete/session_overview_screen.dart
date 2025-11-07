import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/data/default_data.dart';
import 'package:training_schedule_app/providers/session_log_provider.dart';
import 'package:training_schedule_app/presentation/screens/session_select_screen.dart';
import 'package:training_schedule_app/presentation/widgets/my_app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/my_listview.dart';

class SessionOverviewScreen extends StatefulWidget {
  const SessionOverviewScreen({super.key});

  @override
  State<SessionOverviewScreen> createState() => _SessionOverviewScreenState();
}

class _SessionOverviewScreenState extends State<SessionOverviewScreen> {
  // grabs the sessionList from MVP_dummy_data.dart.
  final currentSessionList = defaultSessions;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionLogProvider>(
      builder: (context, sessionData, child) {
        return Scaffold(
          // Stful because of AppBar title
          appBar: MyAppBar(title: 'Session Overview'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                CustomListView(
                  item: currentSessionList,
                  setIndex: sessionData.setSessionIndex,
                  route: SessionSelectScreen(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
