import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/data/default_data.dart';
import 'package:training_schedule_app/providers/session_log_provider.dart';
import 'package:training_schedule_app/presentation/screens/session_select_screen.dart';
import 'package:training_schedule_app/presentation/widgets/my_app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/my_listview.dart';

class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  // grabs the sessionList from dummy_data.dart.
  final currentSessionList = defaultSessions;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionLogProvider>(
      builder: (context, trainingData, child) {
        return Scaffold(
          // Stful because of AppBar title
          appBar: MyAppBar(title: 'Week ${trainingData.weekIndex + 1}'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                RowSelection(caseStatement: 'Week'),
                SizedBox(height: 50),
                CustomListView(
                  item: currentSessionList,
                  setIndex: trainingData.setSessionIndex,
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
