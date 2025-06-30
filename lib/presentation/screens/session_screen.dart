import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/presentation/screens/workout_screen.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';

class SessionScreen extends StatefulWidget {
  final dynamic index;

  const SessionScreen({super.key, this.index});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {



  // TODO: figure out how to pass the index from customList to sessionScreen, so that the correct session is displayed
     int index = 0;
    // if (widget.index != null) {
    //    index = widget.index;
    // } else {index = 0;}
  //  late int index = widget.index;
  void refresh(int val) {
    setState(() => index = val);
  }

  // grabs the sessionList from dummy_data.dart.
  final currentSessionList = sessionList;

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: MyAppBar(title: '${currentSessionList[index].title}\'s session'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          RowSelection(
            notifyParent: refresh,
            listLength: currentSessionList.length,
          ),
          SizedBox(height: 50),
          CustomListView(
            item: currentSessionList[index].list,
            route: WorkoutScreen(),
          ),
        ],
      ),
    );
  }

  
}
