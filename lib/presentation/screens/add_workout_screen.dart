import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  Set<String> _selectedExerciseIds = {};

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isSearching = false;
  final _searchController = TextEditingController();

  String _query = '';

  @override
  void dispose() {
    _titleController.dispose();
    _labelController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitWorkoutForm() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text.trim();
      final label = _labelController.text.trim();
      final description = _descriptionController.text.trim();

      // TODO: save workout

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PresetProvider>(
      builder: (BuildContext context, presetData, Widget? child) {
        final filteredPresetExercises =
            presetData.presetExercises
                .where(
                  (item) => item.title.toLowerCase().contains(
                    _query.toLowerCase().trim(),
                  ),
                )
                .toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Add new workout'),
          ), //TODO: add close button?
          //TODO: make text field static sizes?
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _titleController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              labelText: 'Title',
                              border: OutlineInputBorder(),
                            ),
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? 'Please enter a title'
                                        : null,
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: TextFormField(
                            controller: _labelController,
                            autofocus: true,
                            decoration: const InputDecoration(
                              labelText: 'Label',
                              border: OutlineInputBorder(),
                            ),
                            validator:
                                (value) =>
                                    value == null || value.isEmpty
                                        ? 'Please enter a label'
                                        : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _descriptionController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 10,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: Text('All exercises'),
                      ),
                      _isSearching ? SizedBox.shrink() : Spacer(),
                      // Spacer(),
                      _isSearching
                          ? SizedBox(
                            key: const ValueKey('searchField'),
                            width: MediaQuery.of(context).size.width * 0.60,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _searchController,
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Search...',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                    ),
                                    onChanged: (value) {
                                      setState(() => _query = value);
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      _isSearching = false;
                                      _searchController.clear();
                                      _query = '';
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                          : ElevatedButton(
                            key: const ValueKey('searchButton'),
                            child: const Icon(Icons.search),
                            onPressed: () {
                              setState(() => _isSearching = true);
                            },
                          ),

                      !_isSearching ? SizedBox(width: 8) : SizedBox.shrink(),
                      !_isSearching
                          ? ElevatedButton(
                            onPressed: () {
                              addExerciseModalBottomSheet(context);
                            },
                            child: Icon(Icons.add),
                          )
                          : SizedBox.shrink(),
                    ],
                  ),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: filteredPresetExercises.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Checkbox(
                            value: _selectedExerciseIds.contains(
                              filteredPresetExercises[index].id,
                            ),
                            onChanged: (bool? value) {
                              setState(() {
                                final id = filteredPresetExercises[index].id;
                                value!
                                    ? _selectedExerciseIds.add(id)
                                    : _selectedExerciseIds.remove(id);
                                ;
                              });
                            },
                          ),

                          title: Text(filteredPresetExercises[index].title),
                          subtitle:
                              filteredPresetExercises[index].description != null
                                  ? Text(
                                    filteredPresetExercises[index].description!,
                                  )
                                  : SizedBox.shrink(),
                          trailing: Icon(Icons.edit), //TODO: make editable
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: Center(
                      child: ElevatedButton(
                        onPressed: _submitWorkoutForm,
                        child: Text('Save workout'),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> addExerciseModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext builder) {
        return Center(child: Text('sheet'));
      },
    );
  }
}
