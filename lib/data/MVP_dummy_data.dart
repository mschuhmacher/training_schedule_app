import 'package:training_schedule_app/models/block.dart';
import 'package:training_schedule_app/models/exercise.dart';
import 'package:training_schedule_app/models/session.dart';

// TODO: add weeks to data structure
// TODO: change to full list of exercises, and in blocks only grab specific ones.
// Plan >> Week >> Session >> Block >> Exercise

final List<Session> sessionList = [
  Session(
    title: 'Training session 1',
    description: 'Flash tries and projecting',
    date: DateTime.now(),
    list: flashAndProject,
  ),
  Session(
    title: 'Training session 2',
    description: 'Powerendurance',
    date: DateTime.now(),
    list: powerenduranceAndFingers,
  ),
  Session(
    title: 'Training session 3',
    description: 'Unstructured climbing',
    date: DateTime.now(),
    list: unstructuredClimbing,
  ),
];

final List<Block> flashAndProject = [
  Block(
    title: 'Warm-up',
    description: 'Warming up',
    date: DateTime.now(),
    list: warmupExercises,
  ),
  Block(
    title: 'Klimmen',
    description: 'Flashen en Projecten',
    date: DateTime.now(),
    list: flashAndProjectExercises,
  ),

  Block(
    title: 'Strength training',
    description: 'Weights and supersets',
    date: DateTime.now(),
    list: handstandAndSupersetExercises,
  ),
];

final List<Block> powerenduranceAndFingers = [
  Block(
    title: 'Warm-up',
    description: 'Warming up',
    date: DateTime.now(),
    list: warmupExercises,
  ),
  Block(
    title: 'Fingerboard',
    description: 'Pickups with loading pin',
    date: DateTime.now(),
    list: kilterboardPyramidExercise,
  ),
  Block(
    title: 'Powerendurance',
    description: 'Max 2 pogingen per boulder',
    date: DateTime.now(),
    list: flashAndProjectExercises,
  ),
  Block(
    title: 'Strength training',
    description: 'Weights and supersets',
    date: DateTime.now(),
    list: handstandAndFullBodyExercises,
  ),
];

final List<Block> unstructuredClimbing = [
  Block(
    title: 'Warm-up',
    description: 'Warming up',
    date: DateTime.now(),
    list: warmupExercises,
  ),
  Block(
    title: 'Fingerboard',
    description: 'Pickups with loading pin',
    date: DateTime.now(),
    list: kilterboardPyramidExercise,
  ),
  Block(
    title: 'Vrij klimmen',
    description: 'Lekker ongestructureerd',
    date: DateTime.now(),
    list: pe4x4Exercise,
  ),
  Block(
    title: 'Strength training',
    description: 'Weights and supersets',
    date: DateTime.now(),
    list: handstandAndBackExercises,
  ),
];

final List<Exercise> warmupExercises = [
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

final List<Exercise> flashAndProjectExercises = [
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
];

final List<Exercise> handstandAndSupersetExercises = [
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

final List<Exercise> kilterboardPyramidExercise = [
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

final List<Exercise> handstandAndFullBodyExercises = [
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

final List<Exercise> pe4x4Exercise = [
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

final List<Exercise> handstandAndBackExercises = [
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
