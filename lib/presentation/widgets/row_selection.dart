import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';
import 'package:training_schedule_app/presentation/widgets/my_arrow_button.dart';

// TODO: generalize. Needs to support week and session scrolling
// maybe through passing a week or session parameter, and then adding switch statements?
// Does complicate the logic in this file instead of a logic file.

Color? cardColor = Colors.white;

class RowSelection extends StatelessWidget {
  const RowSelection({required this.caseStatement, super.key});

  final String caseStatement;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {
        int index = 0;
        int itemLength = 0;
        void Function() decrement = () {};
        void Function() increment = () {};

        switch (caseStatement) {
          case 'Week':
            {
              index = trainingData.weekIndex;
              itemLength = trainingData.weekLength;
              decrement = trainingData.decrementWeekIndex;
              increment = trainingData.incrementWeekIndex;
            }
          case 'Session':
            {
              index = trainingData.sessionIndex;
              itemLength = trainingData.weekLength;
              decrement = trainingData.decrementSessionIndex;
              increment = trainingData.incrementSessionIndex;
            }
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // TODO: replace sizedbox with expanded/flexbile widgets?
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                if (index > 0) {
                  decrement();
                }
              },
              child: MyArrowButton(icon: Icons.arrow_back),
            ),
            GestureDetector(
              onTap: () {
                if (index > 0) {
                  decrement();
                }
              },
              child: SizedBox(
                width: 75,
                height: 100,
                child: () {
                  if (index > 0) {
                    return MyRowCard(title: index.toString());
                  }
                }(),
              ),
            ),

            // Only widget in the row that doesn't need to be tapped
            SizedBox(
              width: 90,
              height: 120,
              child: MyRowCard(title: (index + 1).toString()),
            ),
            GestureDetector(
              onTap: () {
                increment();
              },
              child: SizedBox(
                width: 75,
                height: 100,
                child: () {
                  if (index < itemLength - 1) {
                    return MyRowCard(title: (index + 2).toString());
                  }
                }(),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (index < itemLength - 1) {
                  increment();
                }
              },
              child: MyArrowButton(icon: Icons.arrow_forward),
            ),
            SizedBox(width: 10),
          ],
        );
      },
    );
  }
}

class MyRowCard extends StatelessWidget {
  const MyRowCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Opacity(
        opacity: 0.75,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: cardColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: .5,
                blurRadius: 5,
                offset: Offset.fromDirection(1, 5),
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
