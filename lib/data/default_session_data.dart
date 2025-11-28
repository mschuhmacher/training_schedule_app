import 'package:training_schedule_app/data/default_workout_data.dart';
import 'package:training_schedule_app/models/session.dart';

final List<Session> kDefaultSessions = [
  Session(
    title: 'Projecting session',
    description: 'Flash tries and projecting',
    date: DateTime.now(),
    label: 'Limit',
    list:
        kDefaultWorkouts
            .where(
              (w) => [
                'General Full-Body Warm-up',
                'Footwork Fundamentals',
                'Max Fingerboard Strength',
              ].contains(w.title),
            )
            .toList(),
  ),
  Session(
    title: 'Powerendurance training',
    description: 'Powerendurance',
    date: DateTime.now(),
    label: 'Powerendurance',
    list:
        kDefaultWorkouts
            .where(
              (w) => [
                'Climbing-Specific Warm-up',
                'Fingerboard Strength Builder',
                'Boulder Pyramid Endurance',
                'Full-Body Strength Session',
              ].contains(w.title),
            )
            .toList(),
  ),
  Session(
    title: 'Power',
    description: 'Training power',
    date: DateTime.now(),
    label: 'Power',
    list:
        kDefaultWorkouts
            .where(
              (w) => [
                'Climbing-Specific Warm-up',
                'Combined Limit Strength',
                'Dynamic Climbing Power',
                'Upper Body Powerv',
              ].contains(w.title),
            )
            .toList(),
  ),
];
