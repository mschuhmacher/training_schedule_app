// TODO: add unique identifier

class Exercise {
  Exercise({
    required this.title,
    this.subtitle,
    this.label,
    required this.reps,
    required this.sets,
    required this.timeBetweenSets,
    this.timeForReps,
    this.load,
    this.description,
  });

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
    load: (json['load'] as num).toDouble(),
    description: json['description'],
  );
}
