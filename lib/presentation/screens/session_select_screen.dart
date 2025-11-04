import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/data/default_data.dart';
import 'package:training_schedule_app/presentation/screens/add_item_screen.dart';
import 'package:training_schedule_app/providers/session_provider.dart';
import 'package:training_schedule_app/presentation/widgets/my_app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/my_listview.dart';
import 'package:training_schedule_app/presentation/widgets/start_session_button.dart';

class SessionSelectScreen extends StatefulWidget {
  final dynamic index;

  const SessionSelectScreen({super.key, this.index});

  @override
  State<SessionSelectScreen> createState() => _SessionSelectScreenState();
}

class _SessionSelectScreenState extends State<SessionSelectScreen> {
  int index = 0;

  // grabs the sessionList from MVP_dummy_data.dart.
  final currentSessionList = defaultSessions;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (context, sessionData, child) {
        return Scaffold(
          appBar: MyAppBar(title: 'Today\'s session'),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              RowSelection(caseStatement: 'Session'),
              SizedBox(height: 20),
              Expanded(
                child: CustomListView(
                  item: currentSessionList[sessionData.sessionIndex].list,
                ),
              ),
              SizedBox(height: 70), // change so it doesn't disappear behind FAB
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: StartSessionButton(routeName: 'workout_screen'),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => AddItemScreen(itemName: 'session'),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
