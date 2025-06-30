import 'package:training_schedule_app/models/block.dart';

class Session {
  Session({
    required this.title,
    required this.description,
    required this.date,
    required this.list,
  });

  final String title;
  final String description;
  final DateTime date;
  final List<Block> list;

  Session copyWith(
      {String? newTitle,
      String? newDescription,
      DateTime? newDate,
      List<Block>? newBlockList}) {
    return Session(
        title: newTitle ?? title,
        description: newDescription ?? description,
        date: newDate ?? date,
        list: newBlockList ?? list);
  }
}
