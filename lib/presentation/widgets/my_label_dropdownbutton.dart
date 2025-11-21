import 'package:flutter/material.dart';
import 'package:training_schedule_app/models/label.dart';

const Map<String, LabelOption> kDefaultLabelOptions = {
  'Warm-up': LabelOption(
    name: 'Warm-up',
    icon: Icons.wb_sunny,
    color: Colors.amber,
  ),
  'Limit': LabelOption(
    name: 'Limit',
    icon: Icons.trending_up,
    color: Colors.red,
  ),
  'Powerendurance': LabelOption(
    name: 'Powerendurance',
    icon: Icons.bolt,
    color: Colors.orange,
  ),
  'Endurance': LabelOption(
    name: 'Endurance',
    icon: Icons.loop,
    color: Colors.blue,
  ),
  'Strength': LabelOption(
    name: 'Strength',
    icon: Icons.fitness_center,
    color: Colors.purple,
  ),
  'Technique': LabelOption(
    name: 'Technique',
    icon: Icons.touch_app,
    color: Colors.green,
  ),
  'Skills': LabelOption(
    name: 'Skills',
    icon: Icons.psychology,
    color: Colors.teal,
  ),
  'Flexibility': LabelOption(
    name: 'Flexibility',
    icon: Icons.self_improvement,
    color: Colors.pink,
  ),
  'Other': LabelOption(
    name: 'Other',
    icon: Icons.more_horiz,
    color: Colors.grey,
  ),
};

class MyLabelDropdownButton extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;
  final Map<String, LabelOption> labelOptions;
  final String hintText;
  final String labelText;

  const MyLabelDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.validator,
    this.labelOptions = kDefaultLabelOptions,
    this.hintText = 'Label',
    this.labelText = 'Label',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hintText),
      items:
          labelOptions.entries.map((entry) {
            return DropdownMenuItem<String>(
              value: entry.key,
              child: Row(
                children: [
                  Icon(entry.value.icon, color: entry.value.color, size: 20),
                  const SizedBox(width: 8),
                  Text(entry.value.name),
                ],
              ),
            );
          }).toList(),
      selectedItemBuilder: (context) {
        return labelOptions.values.map((option) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(option.icon, color: option.color),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    option.name,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ],
            ),
          );
        }).toList();
      },
      isExpanded: true,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.surfaceBright,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
