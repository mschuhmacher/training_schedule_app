import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/presentation/widgets/my_arrow_button.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/providers/session_log_provider.dart';
import 'package:training_schedule_app/providers/session_state_provider.dart';
import 'package:training_schedule_app/services/session_logger.dart';

class ActiveSessionBottomBar extends StatelessWidget {
  const ActiveSessionBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<PresetProvider, SessionLogProvider, SessionStateProvider>(
      builder: (context, presetData, sessionLogData, sessionStateData, child) {
        final Session activeSession =
            presetData.presetSessions[sessionStateData.sessionIndex];

        return SizedBox(
          height: 100,
          child: BottomAppBar(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sessionStateData.workoutIndex > 0
                      ? GestureDetector(
                        onTap: sessionStateData.decrementWorkoutIndex,
                        child: MyArrowButton(icon: Icons.arrow_back, size: 40),
                      )
                      : SizedBox.shrink(),

                  (sessionStateData.workoutIndex >= 0 &&
                          sessionStateData.workoutIndex <
                              activeSession.list.length - 1)
                      ? GestureDetector(
                        onTap: sessionStateData.incrementWorkoutIndex,
                        child: MyArrowButton(
                          icon: Icons.arrow_forward,
                          size: 40,
                        ),
                      )
                      : GestureDetector(
                        onTap: () async {
                          await SessionLogger.logSession(activeSession);
                          sessionLogData.refreshSelectedSessions(activeSession);
                          // TODO: build in a pause so that the selectedSessions can be refreshed before the screens are popped.

                          // Only use the buildContext is it still mounted. Meaning, the widget is still in the Widgettree.
                          // If user leaves screen before await is done, mounted would be false
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Session saved to log!'),
                              ),
                            );
                            // Keeps popping routes until the current route is the first route. Not named,so no errors.

                            Navigator.popUntil(
                              context,
                              (route) => route.isFirst,
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
