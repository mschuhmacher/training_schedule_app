import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/models/workout.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';

/// TODO: add functions to save the item

class AddItemScreen extends StatefulWidget {
  String itemName;

  AddItemScreen({super.key, required this.itemName});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  Set<String> _selectedItemIds = {};

  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _labelController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool _isSearching = false;
  final _searchController = TextEditingController();

  String _query = '';
  late final String listItemName;

  @override
  void initState() {
    super.initState();
    listItemName = widget.itemName == 'session' ? 'workouts' : 'exercises';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _labelController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submitItemForm() {
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

  void _onPressedAddButton() {
    if (widget.itemName == 'session') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddItemScreen(itemName: 'workout'),
        ),
      );
    } else if (widget.itemName == 'workout') {
      addExerciseModalSheet();
    }
  }

  Future<dynamic> addExerciseModalSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext builder) {
        return Center(child: Text('add exercise sheet'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PresetProvider>(
      builder: (BuildContext context, presetData, Widget? child) {
        final List<dynamic> allPresetItems =
            widget.itemName == 'session'
                ? presetData.presetWorkouts
                : presetData.presetExercises;

        final List<dynamic> filteredPresetItems =
            allPresetItems
                .where(
                  (item) => item.title.toLowerCase().contains(
                    _query.toLowerCase().trim(),
                  ),
                )
                .toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Add new ${widget.itemName}'),
          ), //TODO: add close button?
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextFormFields(),
                  SizedBox(height: 16),
                  _buildSearchAndAddRow(context),
                  Expanded(
                    flex: 3,
                    child: ListView.builder(
                      itemCount: filteredPresetItems.length,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Checkbox(
                            value: _selectedItemIds.contains(
                              filteredPresetItems[index].id,
                            ),
                            onChanged: (bool? value) {
                              setState(() {
                                final id = filteredPresetItems[index].id;
                                value!
                                    ? _selectedItemIds.add(id)
                                    : _selectedItemIds.remove(id);
                                ;
                              });
                            },
                          ),
                          title: Text(filteredPresetItems[index].title),
                          subtitle:
                              filteredPresetItems[index].description != null
                                  ? Text(
                                    filteredPresetItems[index].description!,
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
                        child: Text('Save ${widget.itemName}'),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded _buildTextFormFields() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          SizedBox(height: 16),
          Row(
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
          SizedBox(height: 16),
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
        ],
      ),
    );
  }

  Row _buildSearchAndAddRow(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          child: Text('All $listItemName'),
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
              onPressed: _onPressedAddButton,
              child: Icon(Icons.add),
            )
            : SizedBox.shrink(),
      ],
    );
  }
}
