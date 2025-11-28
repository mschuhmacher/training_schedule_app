import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/_obsolete/obsolete_workout.dart';
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
                  (name) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name.title,
                        style: context.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${name.description} \n',
                        style: context.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
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
              style: context.h3,
            );
          }
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                _showCloseConfirmationDialog(context);
              },
              icon: Icon(Icons.close),
            ),
            title: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(activeSession.title, style: context.h4),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Expanded(
                  flex: 5,
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
                SizedBox(height: 1),
                Expanded(
                  flex: 12,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(150), // large curve
                          ),
                        ),
                        child: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          60.0,
                          72.0,
                          24.0,
                          12.0,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: exerciseWidgets,
                          ),
                        ),
                      ),
                    ],
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
