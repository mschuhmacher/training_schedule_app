import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/data/MVP_dummy_data.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/screens/workout_screen.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';

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
    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {
        return Scaffold(
          appBar: MyAppBar(
            title: '${currentSessionList[trainingData.sessionIndex].title}',
          ), //TODO: change to week #, session #
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                RowSelection(
                  index: trainingData.sessionIndex,
                  itemLength: trainingData.weekLength,
                  decrement: trainingData.decrementSessionIndex,
                  increment: trainingData.incrementSessionIndex,
                ),
                SizedBox(height: 50),
                StartSessionButton(),
                SizedBox(height: 20),
                CustomListView(
                  item: currentSessionList[trainingData.sessionIndex].list,
                  route: WorkoutScreen(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class StartSessionButton extends StatelessWidget {
  const StartSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Opacity(
          opacity: 0.75,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WorkoutScreen()),
              );
            },
            child: Text(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              'Start session',
            ),
          ),
        ),
      ),
    );
  }
}
