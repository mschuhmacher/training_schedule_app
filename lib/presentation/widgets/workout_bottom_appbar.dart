import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/presentation/widgets/my_arrow_button.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';

class WorkoutBottomAppbar extends StatelessWidget {
  final List sessionList;

  const WorkoutBottomAppbar({super.key, required this.sessionList});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {
        return SizedBox(
          height: 100,
          child: BottomAppBar(
            color: Colors.blueGrey[700],
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
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
                              sessionList[trainingData.sessionIndex]
                                      .list
                                      .length -
                                  1) {
                        trainingData.incrementBlockIndex();
                      } else if (trainingData.blockIndex ==
                          sessionList[trainingData.sessionIndex].list.length -
                              1) {
                        //TODO: implement logbook function here
                      }
                    },
                    child: () {
                      if (trainingData.blockIndex <
                          sessionList[trainingData.sessionIndex].list.length -
                              1) {
                        return MyArrowButton(
                          icon: Icons.arrow_forward,
                          size: 40,
                        );
                      }
                      return MyArrowButton(icon: Icons.check_box, size: 40);
                    }(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
