import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/block.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/data/MVP_dummy_data.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/widgets/workout_bottom_row.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final currentSessionList = sessionList;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {
        // Retrieving the needed data for the workout screen
        Block currentBlock =
            currentSessionList[trainingData.sessionIndex].list[trainingData
                .blockIndex];
        List<Widget> exerciseWidgets =
            currentBlock.list
                .map(
                  (name) => Text(
                    '${name.title} \n${name.description}',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
                .toList();
        List<Widget> blockNames =
            currentSessionList[trainingData.sessionIndex].list
                .map((name) => Text(name.title))
                .toList();
        // Highlight the title of the current block in a list of block titles
        for (int i = 0; i < blockNames.length; i++) {
          if (i == trainingData.blockIndex) {
            blockNames[i] = Text(
              currentSessionList[trainingData.sessionIndex].list[i].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          }
        }
        return Scaffold(
          appBar: MyAppBar(
            title: currentSessionList[trainingData.sessionIndex].title,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 36.0, 12.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.from(blockNames)
                          ..addAll([Text('\n ${currentBlock.description}')]),
                        // Create new list from block names and add the block description to it with a whiteline in between
                      ),
                    ),
                  ),
                ),
                // Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 12,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[700],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200), // large curve
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            <Widget>[SizedBox(height: 100)] + exerciseWidgets,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 36.0,
                      right: 36.0,
                      bottom: 24.0,
                    ),
                    child: WorkoutBottomRow(sessionList: currentSessionList),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
