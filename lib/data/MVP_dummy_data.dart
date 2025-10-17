import 'package:training_schedule_app/models/block.dart';
import 'package:training_schedule_app/models/exercise.dart';
import 'package:training_schedule_app/models/session.dart';

// TODO: add weeks to data structure
// TODO: change to full list of exercises, and in blocks only grab specific ones.
// Plan >> Week >> Session >> Block >> Exercise

final List<Session> presetSessions = [
  Session(
    title: 'Projecting session',
    description: 'Flash tries and projecting',
    date: DateTime.now(),
    list:
        allBlocks
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
        allBlocks
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
        allBlocks
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

final List<Block> allBlocks = [
  Block(
    title: 'Warm-up',
    description: 'Warming up',
    date: DateTime.now(),
    list:
        allExercises
            .where(
              (w) => [
                'Hangboard repeaters',
                'Pull-ups, push-ups, shoulder rotation',
              ].contains(w.title),
            )
            .toList(),
  ),
  Block(
    title: 'Fingerboard',
    description: 'Pickups with loading pin',
    date: DateTime.now(),
    list: allExercises.where((w) => ['Pick-ups'].contains(w.title)).toList(),
  ),
  Block(
    title: 'Flashen en projecten',
    description: '10 flash boulder, max 2 pogingen. 2 project boulders',
    date: DateTime.now(),
    list:
        allExercises
            .where((w) => ['Flash game', 'Projecting'].contains(w.title))
            .toList(),
  ),
  Block(
    title: 'Powerendurance',
    description: 'Max 2 pogingen per boulder',
    date: DateTime.now(),
    list:
        allExercises
            .where((w) => ['Kilter pyramids', '4x4'].contains(w.title))
            .toList(),
  ),
  Block(
    title: 'Vrij klimmen',
    description: 'Lekker ongestructureerd',
    date: DateTime.now(),
    list:
        allExercises.where((w) => ['Vrij klimmen'].contains(w.title)).toList(),
  ),
  Block(
    title: 'Strength training - basic',
    description: 'Handstand and supersets',
    date: DateTime.now(),
    list:
        allExercises
            .where(
              (w) => [
                'Handstands',
                'Superset pullups, toes to bar, hamstring stretches',
              ].contains(w.title),
            )
            .toList(),
  ),
  Block(
    title: 'Strength training - full body',
    description: 'Handstand and full body exercises',
    date: DateTime.now(),
    list:
        allExercises
            .where(
              (w) => [
                'Handstands',
                'Superset weighted pullups and dips',
                'Superset windshield wipers and dumb bells press',
              ].contains(w.title),
            )
            .toList(),
  ),
  Block(
    title: 'Strength training - back',
    description: 'Handstand and back exercises',
    date: DateTime.now(),
    list:
        allExercises
            .where(
              (w) => [
                'Handstands',
                'Superset weighted pullups and dips',
                'Superset wall angels and IYT',
              ].contains(w.title),
            )
            .toList(),
  ),
];

final List<Exercise> allExercises = [
  Exercise(
    title: 'Hangboard repeaters',
    reps: 3,
    sets: 4,
    restTime: 3,
    activeTime: 7,
    load: 0,
    description: '3x on 20mm and 1x on 14mm',
  ),
  Exercise(
    title: 'Pull-ups, push-ups, shoulder rotation',
    reps: 8,
    sets: 2,
    restTime: 30,
    activeTime: 60,
    load: 0,
    description: 'Easy and good form',
  ),
  Exercise(
    title: 'Pick-ups',
    reps: 2,
    sets: 5,
    restTime: 120,
    activeTime: 30,
    load: 45,
    description: 'Loading pin, 7 second hold for each arm',
  ),
  Exercise(
    title: 'Flash game',
    reps: 2,
    sets: 10,
    restTime: 120,
    activeTime: 60,
    load: 0,
    description: '10 flash climbs, max 2 attempts.',
  ),
  Exercise(
    title: 'Projecting',
    reps: 3,
    sets: 2,
    restTime: 120,
    activeTime: 60,
    load: 0,
    description: 'Projecting on 2 climbs. 7B-7C level.',
  ),
  Exercise(
    title: 'Kilter pyramids',
    reps: 30,
    sets: 15,
    restTime: 180,
    activeTime: 60,
    load: 0,
    description: '8 routes in increasing difficulty, then in reverse order',
  ),
  Exercise(
    title: '4x4',
    reps: 4,
    sets: 4,
    restTime: 240,
    activeTime: 180,
    load: 0,
    description: '4 climbs, each 4 times in a row with 4 minutes rest.',
  ),
  Exercise(
    title: 'Vrij klimmen',
    reps: 1,
    sets: 1,
    restTime: 0,
    activeTime: 3600,
    load: 0,
    description: 'Gewoon wat die dag goed voelt',
  ),
  Exercise(
    title: 'Handstands',
    reps: 10,
    sets: 3,
    restTime: 60,
    activeTime: 300,
    load: 0,
    description: 'Attempting handstands, against wall and H-stands.',
  ),
  Exercise(
    title: 'Superset pullups, toes to bar, hamstring stretches',
    reps: 6,
    sets: 3,
    restTime: 120,
    activeTime: 120,
    load: 0,
    description: '6 pull-ups, 8 ttb, 90s stretches',
  ),
  Exercise(
    title: 'Superset weighted pullups and hamstring stretches',
    reps: 6,
    sets: 4,
    restTime: 120,
    activeTime: 30,
    load: 10,
    description: 'between 4-8 pullups',
  ),
  Exercise(
    title: 'Superset windshield wipers and dumb bells press',
    reps: 6,
    sets: 3,
    restTime: 120,
    activeTime: 90,
    load: 10,
    description: '6 of each',
  ),
  Exercise(
    title: 'Superset wall angels and IYT',
    reps: 6,
    sets: 3,
    restTime: 120,
    activeTime: 60,
    load: 0,
    description: 'with TRX',
  ),
  Exercise(
    title: 'Superset weighted pullups and dips',
    reps: 6,
    sets: 3,
    restTime: 120,
    activeTime: 90,
    load: 10,
    description: '6 of each',
  ),
];
