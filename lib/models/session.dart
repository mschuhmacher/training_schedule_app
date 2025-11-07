import 'package:training_schedule_app/models/workout.dart';
import 'package:uuid/uuid.dart';

// TODO: add unique identifier

class Session {
  Session({
    String? id,
    required this.title,
    this.label,
    this.subtitle,
    this.description,
    this.date,
    required this.list,
  }) : id = id ?? Uuid().v4();
  // ?? is null-coalescing operator, provides a default value if null. If id is null, then assign new id. If not null, then use existing id.

  final String id;
  final String title;
  final String? label;
  final String? subtitle;
  final String? description;
  final DateTime? date;
  final List<Workout> list;

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'label': label,
    'subtitle': subtitle,
    'description': description,
    'date': date?.toIso8601String(),
    'list': list.map((b) => b.toJson()).toList(),
  };

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json['id'],
    title: json['title'],
    label: json['label'],
    subtitle: json['subtitle'],
    description: json['description'],
    date: DateTime.parse(json['date']),
    list:
        (json['list'] as List<dynamic>)
            .map((b) => Workout.fromJson(b))
            .toList(),
  );
}
