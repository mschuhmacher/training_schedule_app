import 'package:flutter/material.dart';

class SessionStateProvider extends ChangeNotifier {
  /// All below variables and functions pertain to global state management of the sessions.
  /// There is also functionality to keep track of the weeks in a training plan, but that is not utilized right now.
  ///

  int _weekIndex = 0;
  int _sessionIndex = 0;
  int _workoutIndex = 0;

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
