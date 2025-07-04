import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/screens/session_screen.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';

class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  // grabs the sessionList from dummy_data.dart.
  final currentSessionList = sessionList;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {
        return Scaffold(
          // Stful because of AppBar title
          appBar: MyAppBar(title: 'Week ${trainingData.weekIndex + 1}'),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              RowSelection(
                index: trainingData.weekIndex,
                itemLength: trainingData.weekLength,
                decrement: trainingData.decrementWeekIndex,
                increment: trainingData.incrementWeekIndex,
              ),
              SizedBox(height: 50),
              CustomListView(
                item: currentSessionList,
                setIndex: trainingData.setSessionIndex,
                route: SessionScreen(),
              ),
            ],
          ),
        );
      },
    );
  }
}
