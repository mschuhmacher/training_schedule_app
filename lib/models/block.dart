import 'package:training_schedule_app/models/exercise.dart';

class Block {
  Block({
    required this.title,
    required this.description,
    required this.date,
    required this.list,
  });

  final String title;
  final String description;
  final DateTime date;
  final List<Exercise> list;

  // TODO: review whether copyWith is still used
  Block copyWith({
    String? newTitle,
    String? newDescription,
    DateTime? newDate,
    List<Exercise>? newExerciseList,
  }) {
    return Block(
      title: newTitle ?? title,
      description: newDescription ?? description,
      date: newDate ?? date,
      list: newExerciseList ?? list,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'date': date.toIso8601String(),
    'list': list.map((e) => e.toJson()).toList(),
  };

  factory Block.fromJson(Map<String, dynamic> json) => Block(
    title: json['title'],
    description: json['description'],
    date: DateTime.parse(json['date']),
    list:
        (json['list'] as List<dynamic>)
            .map((e) => Exercise.fromJson(e))
            .toList(),
  );
}
