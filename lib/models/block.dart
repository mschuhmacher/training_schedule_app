import 'package:training_schedule_app/models/exercise.dart';

// TODO: add unique identifier

class Workout {
  Workout({
    required this.title,
    this.subtitle,
    this.label,
    this.description,
    this.date,
    required this.list,
  });

  final String title;
  final String? subtitle;
  final String? label;
  final String? description;
  final DateTime? date;
  final List<Exercise> list;

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'label': label,
    'description': description,
    'date': date?.toIso8601String(),
    'list': list.map((e) => e.toJson()).toList(),
  };

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    title: json['title'],
    subtitle: json['subtitle'],
    label: json['label'],
    description: json['description'],
    date: DateTime.parse(json['date']),
    list:
        (json['list'] as List<dynamic>)
            .map((e) => Exercise.fromJson(e))
            .toList(),
  );
}
