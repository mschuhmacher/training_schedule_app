import 'package:training_schedule_app/models/block.dart';

class Session {
  Session({
    required this.title,
    required this.description,
    required this.date,
    required this.blockList,
  });

  final String title;
  final String description;
  final DateTime date;
  final List<Block> blockList;

  Session copyWith(
      {String? newTitle,
      String? newDescription,
      DateTime? newDate,
      List<Block>? newBlockList}) {
    return Session(
        title: newTitle ?? title,
        description: newDescription ?? description,
        date: newDate ?? date,
        blockList: newBlockList ?? blockList);
  }
}
