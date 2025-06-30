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

  Block copyWith(
      {String? newTitle,
      String? newDescription,
      DateTime? newDate,
      List<Exercise>? newExerciseList}) {
    return Block(
        title: newTitle ?? title,
        description: newDescription ?? description,
        date: newDate ?? date,
        list: newExerciseList ?? list);
  }
}
