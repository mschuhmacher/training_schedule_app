import 'package:uuid/uuid.dart';

class Exercise {
  Exercise({
    String? id,
    required this.title,
    required this.description,
    required this.label,
    required this.sets,
    required this.reps,
    required this.timeBetweenSets,
    required this.timePerRep,
    required this.timeBetweenReps,
    required this.load,
    required this.rpe,
    required this.equipment,
    required this.muscleGroups,
    required this.difficulty,
  }) : id = id ?? const Uuid().v4();

  final String id;
  final String title;
  final String description;
  final String label;
  final int sets;
  final int reps;
  final int timeBetweenSets;
  final int timePerRep;
  final int timeBetweenReps;
  final String load;
  final int rpe;
  final String equipment;
  final String muscleGroups;
  final String difficulty;

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'label': label,
    'sets': sets,
    'reps': reps,
    'timeBetweenSets': timeBetweenSets,
    'timePerRep': timePerRep,
    'timeBetweenReps': timeBetweenReps,
    'load': load,
    'rpe': rpe,
    'equipment': equipment,
    'muscleGroups': muscleGroups,
    'difficulty': difficulty,
  };

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    label: json['label'],
    sets: json['sets'],
    reps: json['reps'],
    timeBetweenSets: json['timeBetweenSets'],
    timePerRep: json['timePerRep'],
    timeBetweenReps: json['timeBetweenReps'],
    load: json['load'],
    rpe: json['rpe'],
    equipment: json['equipment'],
    muscleGroups: json['muscleGroups'],
    difficulty: json['difficulty'],
  );
}
