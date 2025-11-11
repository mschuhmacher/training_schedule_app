import 'package:training_schedule_app/models/exercise.dart';
import 'package:uuid/uuid.dart';

// TODO: add unique identifier

class Workout {
  Workout({
    String? id,
    required this.title,
    this.subtitle,
    this.label,
    this.description,
    this.date,
    required this.list,
  }) : id = id ?? Uuid().v4();

  final String id;
  final String title;
  final String? subtitle;
  final String? label;
  final String? description;
  final DateTime? date;
  final List<Exercise> list;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'label': label,
    'description': description,
    'date': date?.toIso8601String(),
    'list': list.map((e) => e.toJson()).toList(),
  };

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
    id: json['id'],
    title: json['title'] ?? 'Untitled workout',
    subtitle: json['subtitle'],
    label: json['label'],
    description: json['description'],
    date: json['date'] != null ? DateTime.tryParse(json['date']) : null,
    list:
        (json['list'] as List<dynamic>? ?? [])
            .map((e) => Exercise.fromJson(e))
            .toList(),
  );
}
