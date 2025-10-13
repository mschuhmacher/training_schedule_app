import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/data/MVP_dummy_data.dart';
import 'package:training_schedule_app/providers/session_provider.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';
import 'package:training_schedule_app/presentation/widgets/start_session_button.dart';

class SessionDetailedScreen extends StatefulWidget {
  final dynamic index;

  const SessionDetailedScreen({super.key, this.index});

  @override
  State<SessionDetailedScreen> createState() => _SessionDetailedScreenState();
}

class _SessionDetailedScreenState extends State<SessionDetailedScreen> {
  int index = 0;

  // grabs the sessionList from MVP_dummy_data.dart.
  final currentSessionList = sessionList;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (context, trainingData, child) {
        return Scaffold(
          appBar: MyAppBar(
            title: currentSessionList[trainingData.sessionIndex].title,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                RowSelection(caseStatement: 'Session'),
                SizedBox(height: 50),
                StartSessionButton(routeName: 'workout_screen'),
                SizedBox(height: 20),
                CustomListView(
                  item: currentSessionList[trainingData.sessionIndex].list,
                  // route: WorkoutScreen(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
