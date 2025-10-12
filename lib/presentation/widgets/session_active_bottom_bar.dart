import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/presentation/widgets/my_arrow_button.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/services/session_logger.dart';

class ActiveSessionBottomBar extends StatelessWidget {
  final List sessionList;

  const ActiveSessionBottomBar({super.key, required this.sessionList});

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
                    onTap: () async {
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
                        await SessionLogger.logSession(
                          sessionList[trainingData.sessionIndex],
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Workout saved to log!'),
                          ),
                        );

                        Navigator.pop(context);
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
