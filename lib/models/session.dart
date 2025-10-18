import 'package:training_schedule_app/models/block.dart';

// TODO: add unique identifier

class Session {
  Session({
    required this.title,
    this.subtitle,
    this.description,
    this.date,
    required this.list,
  });

  final String title;
  final String? subtitle;
  final String? description;
  final DateTime? date;
  final List<Workout> list;

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'description': description,
    'date': date?.toIso8601String(),
    'list': list.map((b) => b.toJson()).toList(),
  };

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    title: json['title'],
    subtitle: json['subtitle'],
    description: json['description'],
    date: DateTime.parse(json['date']),
    list:
        (json['list'] as List<dynamic>)
            .map((b) => Workout.fromJson(b))
            .toList(),
  );
}
