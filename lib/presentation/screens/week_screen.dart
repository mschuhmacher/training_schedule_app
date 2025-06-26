import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
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

  // grabs the sessionList from dummy_data.dart.
  final currentSessionList = sessionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          RowSelection(
            notifyParent: refresh,
            listLength: currentSessionList.length,
          ),
          SizedBox(height: 50),
          CustomListView(session: currentSessionList[_index]),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'This week',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
