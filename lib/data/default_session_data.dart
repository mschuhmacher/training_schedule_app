import 'package:training_schedule_app/data/default_workout_data.dart';
import 'package:training_schedule_app/models/session.dart';

final List<Session> defaultSessions = [
  Session(
    title: 'Projecting session',
    description: 'Flash tries and projecting',
    date: DateTime.now(),
    label: 'Limit',
    list:
        defaultWorkouts
            .where(
              (w) => [
                'Warm-up',
                'Flashen en projecten',
                'Strength training - full body',
              ].contains(w.title),
            )
            .toList(),
  ),
  Session(
    title: 'Powerendurance training',
    description: 'Powerendurance',
    date: DateTime.now(),
    list:
        defaultWorkouts
            .where(
              (w) => [
                'Warm-up',
                'Fingerboard',
                'Powerendurance',
                'Strength training - basic',
              ].contains(w.title),
            )
            .toList(),
  ),
  Session(
    title: 'Whatever you want',
    description: 'Unstructured climbing',
    date: DateTime.now(),
    list:
        defaultWorkouts
            .where(
              (w) => [
                'Warm-up',
                'Fingerboard',
                'Vrij klimmen',
                'Strength training - back',
              ].contains(w.title),
            )
            .toList(),
  ),
];
