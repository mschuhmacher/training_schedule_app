import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_schedule_app/providers/session_provider.dart';

/// TODO: add in eventLoader func. to add a marker (e.g. a dot) to each day on which a session was completed
/// TODO: add in 'today' button in the header

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  DateTime _focusedDay = DateTime.now();
  StartingDayOfWeek _startingDayOfWeek = StartingDayOfWeek.monday;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (BuildContext context, sessionData, Widget? child) {
        return TableCalendar(
          firstDay: DateTime.now().subtract(Duration(days: 365 * 30)),
          lastDay: DateTime.now().add(Duration(days: 365 * 10)),

          focusedDay: _focusedDay,
          calendarFormat: sessionData.calendarFormat,
          startingDayOfWeek: _startingDayOfWeek,
          rowHeight: 45,

          /// Manually disabling the twoWeeks format.
          /// I only want to display twoWeeks if it can show last week and current week,
          /// but it can only show this week and next week. Since it is used to show loggedSessions,
          /// it doesn't make sense to display a future week.
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            CalendarFormat.week: 'Week',
          },

          onFormatChanged: (format) {
            sessionData.changeCalendarFormat(format);

            // Update the selectedSessions based on the new format. The range changes to the first day of the format.ß
            sessionData.updateSelectedSessionsCalendarFormat(
              focusedDay: _focusedDay,
            );

            // Call `setState()` when updating calendar format
            setState(() {});
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;

            // Update the selectedSessions for the new calendarPage
            sessionData.updateSelectedSessionsCalendarFormat(
              // format: _calendarFormat,
              focusedDay: _focusedDay,
            );
          },
        );
      },
    );
  }
}
