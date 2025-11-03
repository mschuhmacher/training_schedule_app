import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_schedule_app/presentation/widgets/my_arrow_button.dart';

class AddExerciseModalSheet extends StatefulWidget {
  const AddExerciseModalSheet({super.key});

  @override
  State<AddExerciseModalSheet> createState() => _AddExerciseModalSheetState();
}

class _AddExerciseModalSheetState extends State<AddExerciseModalSheet> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _loadController = TextEditingController();
  final _timeBetweenSetsController = TextEditingController();
  final _timeForRepsController = TextEditingController();

  int _numberOfSets = 1;
  int _numberOfReps = 1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, //not sure if this key is okay to use
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ), //Remove close button since it's a bottom modal sheet?
                TextFormField(
                  controller: _titleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _subtitleController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Subtitle',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _labelController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Label',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('Sets'),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        if (_numberOfSets >= 1) {
                          setState(() {
                            _numberOfSets--;
                          });
                        }
                      },
                      child: MyArrowButton(icon: Icons.remove),
                    ),
                    SizedBox(width: 8),
                    Text('$_numberOfSets'),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _numberOfSets++;
                        });
                      },
                      child: MyArrowButton(icon: Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('Reps'),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        if (_numberOfReps >= 1) {
                          setState(() {
                            _numberOfReps--;
                          });
                        }
                      },
                      child: MyArrowButton(icon: Icons.remove),
                    ),
                    SizedBox(width: 8),
                    Text('$_numberOfReps'),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _numberOfReps++;
                        });
                      },
                      child: MyArrowButton(icon: Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _timeBetweenSetsController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Time between sets',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _timeForRepsController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Time for reps',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _loadController,
                  keyboardType: TextInputType.numberWithOptions(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  autofocus: true,
                  decoration: const InputDecoration(
                    labelText: 'Load',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(onPressed: () {}, child: Text('Save')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
