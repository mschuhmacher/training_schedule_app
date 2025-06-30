import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/presentation/screens/session_screen.dart';
import 'package:training_schedule_app/presentation/widgets/app_bar.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';

class WeekScreen extends StatefulWidget {
  const WeekScreen({super.key});

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  int _index = 0;
  void refresh(int val) {
    setState(() => _index = val);
  }
int listIndex = 0;
  void updateListIndex(int val){
    listIndex = val;
  }

  // grabs the sessionList from dummy_data.dart.
  final currentSessionList = sessionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Week $_index'),
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
            item: currentSessionList,
            route: SessionScreen(),
          
          
          ),
        ],
      ),
    );
  }

}
