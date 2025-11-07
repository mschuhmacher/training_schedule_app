import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/models/workout.dart';
import 'package:training_schedule_app/presentation/widgets/add_exercise_modal_sheet.dart';
import 'package:training_schedule_app/providers/preset_provider.dart';
import 'package:training_schedule_app/themes/app_shadow.dart';
import 'package:training_schedule_app/themes/app_text_styles.dart';

/// TODO: add functions to save the item

class AddItemScreen extends StatefulWidget {
  final String itemName;

  const AddItemScreen({super.key, required this.itemName});

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

  // void _submitItemForm(Future<void> addFunction) {
  //   if (_formKey.currentState!.validate()) {
  //     final title = _titleController.text.trim();
  //     final label = _labelController.text.trim();
  //     final description = _descriptionController.text.trim();

  //     if (widget.itemName == 'session') {
  //       final newSession = Session(
  //         title: title,
  //         label: label,
  //         description: description,
  //         list: [],
  //       );
  //       addFunction(newSession);
  //     } else if (widget.itemName == 'workout') {}

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Form submitted successfully!')),
  //     );
  //   }
  // }

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
      useSafeArea: true,
      builder: (BuildContext builder) {
        return AddExerciseModalSheet();
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
            title: Text('New ${widget.itemName}', style: context.h4),
            surfaceTintColor:
                Colors
                    .transparent, //disables Material3 overlay. I.e. doesn't change the color of the appBar when the ListView scrolls
          ), //TODO: add close button?
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextFormFields(),
                  SizedBox(height: 16),
                  _buildSearchAndAddRow(context),
                  Expanded(flex: 3, child: _buildListView(filteredPresetItems)),
                  SizedBox(height: 8),
                  SizedBox(
                    //TODO: extract widget?
                    height: 50,
                    child: Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(textStyle: context.h4),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final title = _titleController.text.trim();
                            final label = _labelController.text.trim();
                            final description =
                                _descriptionController.text.trim();

                            if (widget.itemName == 'session') {
                              final newSession = Session(
                                title: title,
                                label: label,
                                description: description,
                                list: [],
                              );
                              presetData.addPresetSession(newSession);
                            } else if (widget.itemName == 'workout') {
                              final newWorkout = Workout(
                                title: title,
                                label: label,
                                description: description,
                                list: [],
                              );
                              presetData.addPresetWorkout(newWorkout);
                            }

                            Navigator.pop;

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Form submitted successfully!'),
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 4,
                          ),
                          child: Text('Save ${widget.itemName}'),
                        ),
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
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.surfaceBright,
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.surfaceBright,

                    labelText: 'Label',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
              decoration: InputDecoration(
                fillColor: Theme.of(context).colorScheme.surfaceBright,

                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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
          width: MediaQuery.of(context).size.width * 0.35,
          child: Text(
            'All $listItemName',
            style: context.h4.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        _isSearching ? SizedBox.shrink() : Spacer(),
        // Spacer(),
        _isSearching
            ? SizedBox(
              key: const ValueKey('searchField'),
              width: MediaQuery.of(context).size.width * 0.55,
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
            : OutlinedButton(
              key: const ValueKey('searchButton'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1.5,
                ),
              ),
              onPressed: () {
                setState(() => _isSearching = true);
              },
              child: const Icon(Icons.search),
            ),

        !_isSearching ? SizedBox(width: 8) : SizedBox.shrink(),
        !_isSearching
            ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                side: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1.5,
                ),
              ),
              onPressed: _onPressedAddButton,
              child: Icon(Icons.add),
            )
            : SizedBox.shrink(),
      ],
    );
  }

  ListView _buildListView(List<dynamic> filteredPresetItems) {
    return ListView.builder(
      itemCount: filteredPresetItems.length,
      padding: EdgeInsets.symmetric(horizontal: 8),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 0.5,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              color: Theme.of(context).colorScheme.surfaceBright,
              boxShadow: context.shadowSmall,
            ),
            child: ListTile(
              leading: Checkbox(
                value: _selectedItemIds.contains(filteredPresetItems[index].id),
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
              title: Text(
                filteredPresetItems[index].title,
                style: context.title,
              ),
              subtitle:
                  filteredPresetItems[index].description != null
                      ? Text(
                        filteredPresetItems[index].description!,
                        style: context.bodyMedium,
                      )
                      : SizedBox.shrink(),
              trailing: Icon(Icons.edit), //TODO: make editable
            ),
          ),
        );
      },
    );
  }
}
