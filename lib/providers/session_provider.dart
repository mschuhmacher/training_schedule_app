import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/services/session_logger.dart';
import 'package:training_schedule_app/utils/date_utils.dart';

class SessionProvider extends ChangeNotifier {
  final List<Session> _presetData =
      sessionList; // change to local JSON of saved planned sessions to do in a workout. Current planned sessions can be a standard file.
  List<Session> _loggedSessions = [];

  bool _isLoading = true;

  int _weekIndex = 0;
  int _sessionIndex = 0;
  int _blockIndex = 0;

  List<Session> get data => _presetData;
  List<Session> get loggedSessions => _loggedSessions;

  bool get isLoading => _isLoading;

  int get weekLength => _presetData.length;
  int get weekIndex => _weekIndex;
  int get sessionIndex => _sessionIndex;
  int get blockIndex => _blockIndex;

  Future<void> loadLoggedSessions() async {
    _isLoading = true;
    notifyListeners();

    // readLogs is non-nullable, if errors then returns empty list
    _loggedSessions = await SessionLogger.readLogs();
    // await Future.delayed(Duration(seconds: 2)); // for testing the progressIndicator on HomeScreen

    _isLoading = false;
    notifyListeners();
  }

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
