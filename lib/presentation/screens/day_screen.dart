import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/presentation/widgets/row_selection.dart';
import 'package:training_schedule_app/presentation/widgets/custom_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        'Today\'s session',
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
