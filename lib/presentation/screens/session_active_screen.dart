import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/workout.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/presentation/widgets/session_active_bottom_bar.dart';
import 'package:training_schedule_app/providers/session_state_provider.dart';
import 'package:training_schedule_app/themes/app_text_styles.dart';

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
        final activeSession =
            presetData.presetSessions[sessionStateData.sessionIndex];

        Workout activeWorkout =
            activeSession.list[sessionStateData.workoutIndex];
        List<Widget> exerciseWidgets =
            activeWorkout.list
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
            activeSession.list.map((name) => Text(name.title)).toList();
        // Highlight the title of the current block in a list of block titles
        for (int i = 0; i < workoutNames.length; i++) {
          if (i == sessionStateData.workoutIndex) {
            workoutNames[i] = Text(
              activeSession.list[i].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            );
          }
        }

        return Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Spacer(flex: 1),
                Text(activeSession.title, style: context.h4),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        _showCloseConfirmationDialog(context);
                      },
                      icon: Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
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
                              '\n ${activeWorkout.description}',
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
          bottomNavigationBar: ActiveSessionBottomBar(),
        );
      },
    );
  }

  void _showCloseConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Close session?', style: context.h3),
          content: Text(
            'Are you sure you want to close this session? Your progress will not be saved.',
            style: context.bodyMedium,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                    Navigator.of(context).pop(); // Close the session screen
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
