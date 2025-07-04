import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/screens/workout_screen.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';

class SessionScreen extends StatefulWidget {
  final dynamic index;

  const SessionScreen({super.key, this.index});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {

     int index = 0;

  // grabs the sessionList from dummy_data.dart.
  final currentSessionList = sessionList;

  @override
  Widget build(BuildContext context) {

    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {return Scaffold(
        appBar: MyAppBar(title: '${currentSessionList[trainingData.sessionIndex].title}\'s session'), //TODO: change to week #, session #
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            RowSelection(
              index: trainingData.sessionIndex,
              itemLength: trainingData.weekLength,
              decrement: trainingData.decrementSessionIndex,
              increment: trainingData.incrementSessionIndex,
            ),
            SizedBox(height: 50),
            CustomListView(
              item: currentSessionList[trainingData.sessionIndex].list,
              route: WorkoutScreen(),
            ),
          ],
        ),
      );}
      
    );
  }

  
}
