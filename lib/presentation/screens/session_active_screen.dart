import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/workout.dart';
import 'package:training_schedule_app/presentation/widgets/my_app_bar.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/presentation/widgets/session_active_bottom_bar.dart';
import 'package:training_schedule_app/providers/session_state_provider.dart';

class ActiveSessionScreen extends StatefulWidget {
  const ActiveSessionScreen({super.key});

  @override
  State<ActiveSessionScreen> createState() => _ActiveSessionScreenState();
}

class _ActiveSessionScreenState extends State<ActiveSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<PresetProvider, SessionStateProvider>(
      builder: (context, presetData, sessionStateData, child) {
        // Retrieving the needed data for the workout screen
        final currentSessionList = presetData.presetSessions;

        Workout currentWorkout =
            currentSessionList[sessionStateData.sessionIndex]
                .list[sessionStateData.workoutIndex];
        List<Widget> exerciseWidgets =
            currentWorkout.list
                .map(
                  (name) => Text(
                    // TODO: change to two Text widgets for different styling between title and description
                    '${name.title} \n${name.description} \n',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )
                .toList();
        List<Widget> workoutNames =
            currentSessionList[sessionStateData.sessionIndex].list
                .map((name) => Text(name.title))
                .toList();
        // Highlight the title of the current block in a list of block titles
        for (int i = 0; i < workoutNames.length; i++) {
          if (i == sessionStateData.workoutIndex) {
            workoutNames[i] = Text(
              currentSessionList[sessionStateData.sessionIndex].list[i].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          }
        }

        return Scaffold(
          appBar: MyAppBar(
            title: currentSessionList[sessionStateData.sessionIndex].title,
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
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: List.from(workoutNames)..addAll([
                            Text(
                              '\n ${currentWorkout.description}',
                              textAlign: TextAlign.end,
                            ),
                          ]),
                          // Create new list from block names and add the block description to it with a whiteline in between
                        ),
                      ),
                    ),
                  ),
                ),

                Expanded(
                  flex: 12,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
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
              ],
            ),
          ),
          bottomNavigationBar: ActiveSessionBottomBar(
            sessionList: currentSessionList,
          ),
        );
      },
    );
  }
}
