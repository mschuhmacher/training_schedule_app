import 'package:flutter/foundation.dart';
import 'package:training_schedule_app/services/preset_logger.dart';
import '../models/session.dart';
import '../models/workout.dart';
import '../models/exercise.dart';
import '../data/default_data.dart';

/// Responsibilities:
/// - Holds in-memory state of all presets (sessions, blocks, exercises).
/// - Provides getters for UI and business logic to access presets.
/// - Loads user-added presets from local JSON and merges with defaults.
/// - Allows adding new user presets and persists them to local JSON.
/// - Notifies listeners when presets change.
///
/// Why:
/// This provider manages the app’s active preset data, keeping the UI
/// reactive while separating mutable user data from the immutable defaults.

class PresetProvider extends ChangeNotifier {
  List<Session> _presetSessions = [];
  List<Workout> _presetWorkouts = [];
  List<Exercise> _presetExercises = [];

  List<Session> get presetSessions => _presetSessions;
  List<Workout> get presetWorkouts => _presetWorkouts;
  List<Exercise> get presetExercises => _presetExercises;

  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;
    _isInitialized = true;

    // TODO: change to read the JSONs instead of Dart defined Lists
    // Load defaults
    _presetSessions = List.from(defaultSessions);
    _presetWorkouts = List.from(defaultWorkouts);
    _presetExercises = List.from(defaultExercises);

    // Merge with user presets
    await _loadUserPresetData();

    notifyListeners();
  }

  /// Loads user-added presets if they exist
  Future<void> _loadUserPresetData() async {
    _presetSessions.addAll(await PresetLogger.readUserPresetSessions());
    _presetWorkouts.addAll(await PresetLogger.readUserPresetWorkouts());
    _presetExercises.addAll(await PresetLogger.readUserPresetExercises());
  }

  /// Save new user-added presets
  Future<void> addPresetSession(Session session) async {
    _presetSessions.add(session);
    await PresetLogger.savePresetToFile(
      'user_preset_sessions.json',
      _presetSessions,
    );
    notifyListeners();
  }

  Future<void> addPresetBlock(Workout block) async {
    _presetWorkouts.add(block);
    await PresetLogger.savePresetToFile(
      'user_preset_blocks.json',
      _presetWorkouts,
    );
    notifyListeners();
  }

  Future<void> addPresetExercise(Exercise exercise) async {
    _presetExercises.add(exercise);
    await PresetLogger.savePresetToFile(
      'user_preset_exercises.json',
      _presetExercises,
    );
    notifyListeners();
  }
}
