import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/block.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/data/MVP_dummy_data.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/workout_bottom_row';

class WorkoutScreen extends StatefulWidget {
  WorkoutScreen({super.key});

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
                .map((name) => Text('${name.title} \n${name.description}'))
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
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: List.from(blockNames)
                        ..addAll([Text('\n ${currentBlock.description}')]),
                      // Create new list from block names and add the block description to it with a whiteline in between
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: exerciseWidgets,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 36.0,
                      right: 36.0,
                      bottom: 24.0,
                    ),
                    child: WorkoutBottomRow(
                      sessionIndex: trainingData.sessionIndex,
                      blockIndex: trainingData.blockIndex,
                      sessionList: currentSessionList,
                      decrement: trainingData.decrementBlockIndex,
                      increment: trainingData.incrementBlockIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // TODO: extract to widget in separate file.
}
