import 'package:flutter/material.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/services/session_logger.dart';

class SessionProvider extends ChangeNotifier {
  final List<Session> _presetData =
      sessionList; // change to local JSON of saved planned sessions to do in a workout. Current planned sessions can be a standard file.
  List<Session>? _loggedSessions;
  int _weekIndex = 0;
  int _sessionIndex = 0;
  int _blockIndex = 0;
  // TODO: add sessionLength?

  List<Session> get data => _presetData;
  List<Session>? get loggedSessions => _loggedSessions;
  int get weekLength => _presetData.length;
  int get weekIndex => _weekIndex;
  int get sessionIndex => _sessionIndex;
  int get blockIndex => _blockIndex;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> loadLoggedSessions() async {
    _isLoading = true;
    notifyListeners();

    _loggedSessions = await SessionLogger.readLogs();

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
