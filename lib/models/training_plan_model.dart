import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/models/session.dart';

class TrainingPlanModel extends ChangeNotifier {
  final List<Session> _data = sessionList;
  int _weekIndex = 0;
  int _sessionIndex = 0;
  int _blockIndex = 0;
  // TODO: add sessionLength?

  List<Session> get data => _data;
  int get weekLength => _data.length;
  int get weekIndex => _weekIndex;
  int get sessionIndex => _sessionIndex;
  int get blockIndex => _blockIndex;

  void incrementWeekIndex() {
    _weekIndex++;
    notifyListeners();
  }

  void decrementWeekIndex() {
    _weekIndex--;
    notifyListeners();
  }

  void incrementSessionIndex() {
    _sessionIndex++;
    notifyListeners();
  }

  void decrementSessionIndex() {
    _sessionIndex--;
    notifyListeners();
  }

  void setSessionIndex(int index) {
    _sessionIndex = index;
    notifyListeners();
  }

  void incrementBlockIndex() {
    _blockIndex++;
    notifyListeners();
  }

  void decrementBlockIndex() {
    _blockIndex--;
    notifyListeners();
  }

  void setBlockIndex(int index) {
    _blockIndex = index;
    notifyListeners();
  }
}
