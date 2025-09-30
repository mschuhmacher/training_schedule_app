import 'package:flutter/material.dart';
import 'package:training_schedule_app/presentation/widgets/my_arrow_button.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';

class WorkoutBottomRow extends StatelessWidget {
  const WorkoutBottomRow({super.key, required this.sessionList});

  final List sessionList;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (trainingData.blockIndex > 0) {
                  trainingData.decrementBlockIndex();
                }
              },
              child: () {
                if (trainingData.blockIndex > 0) {
                  return MyArrowButton(icon: Icons.arrow_back, size: 40);
                }
                return Text('');
              }(),
            ),
            GestureDetector(
              onTap: () {
                if (trainingData.blockIndex >= 0 &&
                    trainingData.blockIndex <
                        sessionList[trainingData.sessionIndex].list.length -
                            1) {
                  trainingData.incrementBlockIndex();
                }
              },
              child: MyArrowButton(icon: Icons.arrow_forward, size: 40),
              // TODO: add case / switch for forward arrow vs finish button
            ),
          ],
        );
      },
    );
  }
}
