class Exercise {
  Exercise({
    required this.title,
    required this.reps,
    required this.sets,
    required this.restTime,
    required this.activeTime,
    required this.load,
    required this.description,
  });

  final String title;
  final int reps;
  final int sets;
  final int restTime;
  final int activeTime;
  final dynamic load;
  final String description;

  Map<String, dynamic> toJson() => {
    'title': title,
    'reps': reps,
    'sets': sets,
    'restTime': restTime,
    'activeTime': activeTime,
    'load': load,
    'description': description,
  };

  factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
    title: json['title'],
    reps: json['reps'],
    sets: json['sets'],
    restTime: json['restTime'],
    activeTime: json['activeTime'],
    load: (json['load'] as num).toDouble(),
    description: json['description'],
  );
}
