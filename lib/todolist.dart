// GENERAL APPROACH
// UI overview to view training schedules:
// Homescreen which shows almost nothing. Navigation options to training plans 
// Training plan >> week >> day (session) >> exercises 
// Currently got a nice UI to show the sessions and their exercises

// STATUS
// think about what the weekScreen and sessionScreen are for. What is their goal, what do they display?

// FEATURES TO BUILD
// VIEWS:
// - Homescreen
// - training plan
// - active training plan
// - week screen
// BACK-END:
// - offline local storage (SQLite or Hive)
// - page routing
// - state mgmt solution 
// INTERACTION:
// - adding new training plan / session / workout (copy from previous build?)


/// for the calendar view and the logged sessions
/// 1. load the logged sessions (in a model?)
/// 2. get current day and calculate the
///   2.1 first day of the week
///   2.2 first of the month
///   2.3 first of last week (two week format)
/// 3. get sessions for the selected time period
///   3.1 get sessions for the day
///   3.2 get sessions for the week
///   3.3 get sessions for the range depending on the format
///   3.4 get sessions for the previous time periods
/// 4. display the sessions in a listview





// LATER STAGE
// - workout screen which shows the current session and exercises with timers / progressions
// - timers without adding sessions/exercises first
// - user profiles
// - online mode (cloud storage)



