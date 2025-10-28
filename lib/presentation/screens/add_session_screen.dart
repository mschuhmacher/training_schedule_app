import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/presentation/screens/add_workout_screen.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/providers/session_provider.dart';

/// TODO: add_session_screen here.
/// input title, label, subtitle, description, no date
/// list of workouts, if added
/// addworkout button, save session button

class AddSessionScreen extends StatefulWidget {
  const AddSessionScreen({super.key});

  @override
  State<AddSessionScreen> createState() => _AddSessionScreenState();
}

class _AddSessionScreenState extends State<AddSessionScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<PresetProvider>(
      builder: (BuildContext context, presetData, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add new session'),
          ), //TODO: add close button?
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(children: [Text('title here'), Text('label here')]),
              ),
              Expanded(child: Text('description here')),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('All workouts'),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddWorkoutScreen(),
                          ),
                        );
                      },
                      child: Text('Add workout'),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: presetData.presetWorkouts.length,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Checkbox(
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value ?? false;
                          });
                        },
                      ),
                      title: Text(presetData.presetWorkouts[index].title),
                      subtitle:
                          presetData.presetWorkouts[index].description != null
                              ? Text(
                                presetData.presetWorkouts[index].description!,
                              )
                              : SizedBox.shrink(),
                      trailing: Icon(Icons.edit), //TODO: make editable
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Save session'),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        );
      },
    );
  }
}
