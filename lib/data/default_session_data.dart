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
                'General Warm-up',
                'Flash and limit bouldering',
                'Full-Body Strength Workout',
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
                'General Warm-up',
                'Fingerboard Strength Builder',
                'Boulder Pyramid Endurance',
                'Push & Antagonist Training',
                'Quick Core Maintenance',
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
                'General Warm-up',
                'Combined Limit Strength',
                'Dynamic Climbing Power',
                'Upper Body Power',
              ].contains(w.title),
            )
            .toList(),
  ),
  Session(
    title: 'Full body strength training',
    description: 'No climbing, just strength and finger training',
    date: DateTime.now(),
    label: 'Strength',
    list:
        kDefaultWorkouts
            .where(
              (w) => [
                'General Warm-up',
                'Weighted pull-ups, pick-ups, hamstring stretch',
                'Handstand Progression Training',
                'Dips and front lever',
                'Barbell Strength Training',
              ].contains(w.title),
            )
            .toList(),
  ),
  Session(
    title: 'Daily fingerboard and stretching',
    description: 'Quick light fingerboard and stretching',
    date: DateTime.now(),
    label: 'Daily maintenance',
    list:
        kDefaultWorkouts
            .where((w) => ['Daily Mobility & Light Hangs'].contains(w.title))
            .toList(),
  ),
  Session(
    title: 'Daily evening stretch',
    description: 'Relaxed stretching at the end of the day',
    date: DateTime.now(),
    label: 'Daily maintenance',
    list:
        kDefaultWorkouts
            .where((w) => ['Evening Stretch & Recovery'].contains(w.title))
            .toList(),
  ),
];
