import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/labels.dart';
import 'package:training_schedule_app/models/label.dart';

class MyLabelDropdownButton extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;
  final Map<String, Label> labels;
  final String hintText;
  final String labelText;

  const MyLabelDropdownButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.validator,
    this.labels = kDefaultLabels,
    this.hintText = 'Label',
    this.labelText = 'Label',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: Text(hintText),
      items:
          labels.entries.map((entry) {
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
        return labels.values.map((option) {
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
