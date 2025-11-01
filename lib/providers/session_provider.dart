import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_schedule_app/_obsolete/dummy_data.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/services/session_logger.dart';
import 'package:training_schedule_app/utils/date_utils.dart';

class SessionProvider extends ChangeNotifier {
  /// The below variables and functions all pertain to retrieving the logged sessions and
  /// loading the sessions within a certain timeframe, depending on the calenderFormat

  late DateTime currentDay;
  late DateTime startDay;
  late DateTime endDay;
  late CalendarFormat calendarFormat;

  // startDay in a constructor because it uses currentDay to initialize.
  SessionProvider() {
    currentDay = DateTime.now();
    startDay = startOfWeek(currentDay);
    endDay = currentDay;
    calendarFormat = CalendarFormat.week;
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

    // TODO: add in writing the defaultData here

    await loadLoggedSessions();
    updateSelectedSessionsCalendarFormat();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadLoggedSessions() async {
    // readLogs is non-nullable, if errors then returns empty list
    _loggedSessions = await SessionLogger.readLoggedSessions();
    // await Future.delayed(Duration(seconds: 2)); // for testing the progressIndicator on HomeScreen
  }

  void changeCalendarFormat(CalendarFormat format) {
    if (calendarFormat != format) {
      calendarFormat = format;
    }
    notifyListeners();
    // Needed?
  }

  void refreshSelectedSessions(Session newSession) {
    _loggedSessions.add(newSession);
    _selectedSessions = getSessionsForRange(_loggedSessions, startDay, endDay);
    notifyListeners();
  }

  void updateSelectedSessionsCalendarFormat({
    // required CalendarFormat format,
    DateTime? focusedDay,
  }) {
    // Update endDay if a focusedDay is provided
    if (focusedDay != null) {
      endDay = focusedDay;
    }

    // Determine the startDay based on format
    // And set endDay to the end of the week / month respectively
    switch (calendarFormat) {
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
    // print('StartDay: $startDay');
    // print('EndDay: $endDay');
    _selectedSessions = getSessionsForRange(_loggedSessions, startDay, endDay);

    notifyListeners();
  }

  /// All below variables and functions pertain to global state management of the sessions.
  /// There is also functionality to keep track of the weeks in a training plan, but that is not utilized right now.
  ///

  //TODO: change to local JSON of saved planned sessions to do in a workout. Current planned sessions can be a standard file.
  final List<Session> _presetData = sessionList;
  List<Session> get data => _presetData;
  int _weekIndex = 0;
  int _sessionIndex = 0;
  int _workoutIndex = 0;

  int get weekLength => _presetData.length;
  int get weekIndex => _weekIndex;
  int get sessionIndex => _sessionIndex;
  int get workoutIndex => _workoutIndex;

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

  void incrementWorkoutIndex() {
    _workoutIndex++;
    notifyListeners();
  }

  void decrementWorkoutIndex() {
    _workoutIndex--;
    notifyListeners();
  }

  void setWorkoutIndex(int index) {
    _workoutIndex = index;
    notifyListeners();
  }
}
