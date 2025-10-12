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
                  trainingData.blockIndex > 0
                      ? GestureDetector(
                        onTap: trainingData.decrementBlockIndex,
                        child: MyArrowButton(icon: Icons.arrow_back, size: 40),
                      )
                      : SizedBox.shrink(),

                  (trainingData.blockIndex >= 0 &&
                          trainingData.blockIndex <
                              sessionList[trainingData.sessionIndex]
                                      .list
                                      .length -
                                  1)
                      ? GestureDetector(
                        onTap: trainingData.incrementBlockIndex,
                        child: MyArrowButton(
                          icon: Icons.arrow_forward,
                          size: 40,
                        ),
                      )
                      : GestureDetector(
                        onTap: () async {
                          await SessionLogger.logSession(
                            sessionList[trainingData.sessionIndex],
                          );
                          // Only use the buildContext is it still mounted. Meaning, the widget is still in the Widgettree.
                          // If user leaves screen before await is done, mounted would be false
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Workout saved to log!'),
                              ),
                            );
                            // Keeps popping routes until the current route is the first route. Not named,so no errors.

                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
                              // TODO: insert reloading logged sessions when returning to home screen
                            );
                          }
                        },
                        child: MyArrowButton(icon: Icons.check_box, size: 40),
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
