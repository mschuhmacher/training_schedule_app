import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_schedule_app/data/dummy_data.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/services/session_logger.dart';
import 'package:training_schedule_app/utils/date_utils.dart';

class SessionProvider extends ChangeNotifier {
  late DateTime currentDay;
  late DateTime startDay;
  late DateTime endDay;

  // startDay in a constructor because it uses currentDay to initialize.
  SessionProvider() {
    currentDay = DateTime.now();
    startDay = startOfWeek(currentDay);
    endDay = currentDay;
  }

  // Define bools for loading and initializing the data
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isInitialized = false;
  bool get isInitialized => _isInitialized;

  // Initialization and getter functions for the loggedSessions and selectedSessions
  List<Session> _loggedSessions = [];
  List<Session> _selectedSessions = [];

  List<Session> get loggedSessions => _loggedSessions;
  List<Session> get selectedSessions => _selectedSessions;

  /// Initialization function called from the HomeScreen. This runs as the first thing on startup.
  /// Could have called in main.dart, but since loadLoggedSessions is async the UI was build before it finished loading,
  /// and thus selectedSessions would be empty --> triggering the ternary condition in the listView on the HomeScreen
  Future<void> init() async {
    if (_isInitialized) return; // avoid running twice
    _isInitialized = true;
    _isLoading = true;
    notifyListeners();

    await loadLoggedSessions();
    updateSelectedSessions(format: CalendarFormat.week);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadLoggedSessions() async {
    // readLogs is non-nullable, if errors then returns empty list
    _loggedSessions = await SessionLogger.readLogs();
    // await Future.delayed(Duration(seconds: 2)); // for testing the progressIndicator on HomeScreen
  }

  void updateSelectedSessions({
    required CalendarFormat format,
    DateTime? focusedDay,
  }) {
    // Update endDay if a focusedDay is provided
    if (focusedDay != null) {
      endDay = focusedDay;
    }

    // Determine the startDay based on format
    // And set endDay to the end of the week / month respectively
    switch (format) {
      case CalendarFormat.week:
        startDay = startOfWeek(endDay);
        endDay = endOfWeek(endDay);
        break;
      case CalendarFormat.twoWeeks:
        startDay = startOfLastWeek(endDay);
        endDay = endOfWeek(endDay);
        break;
      case CalendarFormat.month:
        startDay = firstOfMonth(endDay);
        endDay = lastOfMonth(endDay);
        break;
    }
    _selectedSessions = getSessionsForRange(_loggedSessions, startDay, endDay);

    notifyListeners();
  }

  //TODO: change to local JSON of saved planned sessions to do in a workout. Current planned sessions can be a standard file.
  final List<Session> _presetData = sessionList;
  List<Session> get data => _presetData;
  int _weekIndex = 0;
  int _sessionIndex = 0;
  int _blockIndex = 0;

  int get weekLength => _presetData.length;
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
