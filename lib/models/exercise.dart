import 'package:uuid/uuid.dart';

class Exercise {
  Exercise({
    String? id,
    required this.title,
    this.subtitle,
    this.label,
    required this.reps,
    required this.sets,
    required this.timeBetweenSets,
    this.timeForReps,
    this.load,
    this.description,
  }) : id = id ?? Uuid().v4();

  final String id;
  final String title;
  final String? subtitle;
  final String? label;
  int reps = 1;
  int sets = 1;
  final int timeBetweenSets;
  final int? timeForReps;
  final double? load;
  final String? description;

  Map<String, dynamic> toJson() => {
    'title': title,
    'subtitle': subtitle,
    'label': label,
    'reps': reps,
    'sets': sets,
    'timeBetweenSets': timeBetweenSets,
    'timeForReps': timeForReps,
    'load': load,
    'description': description,
  };

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    title: json['title'],
    subtitle: json['subtitle'],
    label: json['label'],
    reps: json['reps'],
    sets: json['sets'],
    timeBetweenSets: json['timeBetweenSets'],
    timeForReps: json['timeForReps'],
    load: json['load'] != null ? (json['load'] as num).toDouble() : null,
    description: json['description'],
  );
}
