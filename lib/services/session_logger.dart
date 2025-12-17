import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/session.dart';

class SessionLogger {
  /// Finds or creates the local JSON file for the logged sessions
  static Future<String> _getSessionLogFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/session_log.json';
  }

  /// 🔹 Save a completed workout session to the log file
  static Future<void> logSession(Session session) async {
    final path = await _getSessionLogFilePath();
    final file = File(path);

    List<dynamic> existingLogs = [];

    // Read existing logs (if any)
    if (await file.exists()) {
      final content = await file.readAsString();
      if (content.isNotEmpty) {
        existingLogs = jsonDecode(content);
      }
    }

    // Convert the current session to JSON
    final sessionJson = session.toJson();
    sessionJson['timestamp'] = DateTime.now().toIso8601String();

    // Append and write back to the file
    existingLogs.add(sessionJson);
    await file.writeAsString(jsonEncode(existingLogs), flush: true);

    print('✅ Session logged successfully to: $path');
  }

  /// 🔹 Read all workout logs from file
  static Future<List<Session>> readLoggedSessions() async {
    try {
      final path = await _getSessionLogFilePath();
      final file = File(path);

      if (!await file.exists()) return [];

      final content = await file.readAsString();
      if (content.isEmpty) return [];

      final List<dynamic> jsonList = jsonDecode(content);
      return jsonList.map((e) => Session.fromJson(e)).toList();
    } catch (e) {
      print('Error reading logged sessions: $e');
      return [];
    }
  }

  /// 🔹 Clear all logs (for testing or reset)
  static Future<void> clearLoggedSessions() async {
    final path = await _getSessionLogFilePath();
    final file = File(path);
    if (await file.exists()) {
      await file.writeAsString(jsonEncode([]));
      print('🧹 Session log cleared');
    }
  }
}
