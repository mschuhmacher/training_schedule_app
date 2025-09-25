import 'package:training_schedule_app/models/block.dart';
import 'package:training_schedule_app/models/exercise.dart';
import 'package:training_schedule_app/models/session.dart';


// TODO: add weeks to data structure
// Plan >> Week >> Session >> Block >> Exercise
final List<Session> sessionList = [
  Session(
    title: 'Today',
    description: 'First day of training',
    date: DateTime.now(),
    list: blockList,
  ),
  Session(
    title: 'Tomorrow',
    description: 'Second day of training',
    date: DateTime.now(),
    list: blockList2,
  ),Session(
    title: 'Third day',
    description: 'Third day of training',
    date: DateTime.now(),
    list: blockList3,
  ),
];

final List<Block> blockList = [
  Block(
    title: 'Warm-up',
    description: 'Warm-up',
    date: DateTime.now(),
    list: exerciseList,
  ),
  Block(
    title: 'Kilterboard',
    description: 'The one with the pretty lights',
    date: DateTime.now(),
    list: exerciseList2,
  ),
  Block(
    title: 'Strength training',
    description: 'Weights and supersets',
    date: DateTime.now(),
    list: exerciseList3,
  ),
];

final List<Block> blockList2 = [
  Block(
    title: 'Warm-up',
    description: 'Warm-up',
    date: DateTime.now(),
    list: exerciseList,
  ),
  Block(
    title: 'Kilterboard',
    description: 'The one with the pretty lights',
    date: DateTime.now(),
    list: exerciseList4,
  ),
  Block(
    title: 'Supersets',
    description: 'Weights and supersets',
    date: DateTime.now(),
    list: exerciseList5,
  ),
];

final List<Block> blockList3 = [
  Block(
    title: 'Warm-up',
    description: 'Warm-up',
    date: DateTime.now(),
    list: exerciseList,
  ),
  Block(
    title: 'Kilterboard',
    description: 'The one with the pretty lights',
    date: DateTime.now(),
    list: exerciseList6,
  ),
  Block(
    title: 'Strength training',
    description: 'Weights and supersets',
    date: DateTime.now(),
    list: exerciseList7,
  ),
];

final List<Exercise> exerciseList = [
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
    description: 'Banded pull-ups',
  ),
];

final List<Exercise> exerciseList2 = [
  Exercise(
    title: 'Board 10',
    reps: 4,
    sets: 10,
    restTime: 300,
    activeTime: 120,
    load: 0,
    description:
        '5 around flash grade, 5 project grade. Max 4 attempts per climb, must attempt all climbs',
  ),
  Exercise(
    title: 'Campussing',
    reps: 2,
    sets: 3,
    restTime: 120,
    activeTime: 60,
    load: 0,
    description: 'Static campussing',
  ),
];

final List<Exercise> exerciseList3 = [
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
    title: 'Superset pullups, toes to bar, dips',
    reps: 6,
    sets: 3,
    restTime: 120,
    activeTime: 120,
    load: 0,
    description: '6 pull-ups, 8 ttb, 8 dips',
  ),
];

final List<Exercise> exerciseList4 = [
  Exercise(
    title: 'Pyramids',
    reps: 30,
    sets: 15,
    restTime: 180,
    activeTime: 60,
    load: 0,
    description: '8 routes in increasing difficulty, then in reverse order',
  ),
];

final List<Exercise> exerciseList5 = [
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
];

final List<Exercise> exerciseList6 = [
  Exercise(
    title: '4x4',
    reps: 4,
    sets: 4,
    restTime: 240,
    activeTime: 180,
    load: 0,
    description: '4x4',
  ),
];

final List<Exercise> exerciseList7 = [
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