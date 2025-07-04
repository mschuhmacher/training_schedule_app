import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/training_plan_model.dart';

// TODO: generalize. Needs to support week and session scrolling
// maybe through passing a week or session parameter, and then adding switch statements?
// Does complicate the logic in this file instead of a logic file.

Color? cardColor = Colors.white;

class RowSelection extends StatelessWidget {
  const RowSelection({
    required this.index,
    required this.itemLength,
    required this.decrement,
    required this.increment,
    super.key,
  });

  final int index;
  final int itemLength;
  final void Function() decrement;
  final void Function() increment;

  @override
  Widget build(BuildContext context) {
    return Consumer<TrainingPlanModel>(
      builder: (context, trainingData, child) {
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
              child: MyRowArrow(icon: Icons.arrow_back),
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
              child: MyRowArrow(icon: Icons.arrow_forward),
            ),
            SizedBox(width: 10),
          ],
        );
      },
    );
  }
}

class MyRowArrow extends StatelessWidget {
  const MyRowArrow({required this.icon, super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Opacity(
        opacity: 0.75,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: cardColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: .5,
                blurRadius: 5,
                offset: Offset.fromDirection(1, 5),
              ),
            ],
          ),
          child: SizedBox(width: 30, height: 30, child: Icon(icon, size: 22)),
        ),
      ),
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
