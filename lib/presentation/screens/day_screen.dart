import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
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
        '${currentSessionList[_index].title}\'s session',
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
