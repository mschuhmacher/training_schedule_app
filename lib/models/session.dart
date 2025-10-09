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

  Session copyWith({
    String? newTitle,
    String? newDescription,
    DateTime? newDate,
    List<Block>? newBlockList,
  }) {
    return Session(
      title: newTitle ?? title,
      description: newDescription ?? description,
      date: newDate ?? date,
      list: newBlockList ?? list,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'date': date.toIso8601String(),
    'list': list.map((b) => b.toJson()).toList(),
  };

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    title: json['title'],
    description: json['description'],
    date: DateTime.parse(json['date']),
    list:
        (json['list'] as List<dynamic>).map((b) => Block.fromJson(b)).toList(),
  );
}
