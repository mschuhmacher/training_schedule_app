import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_schedule_app/providers/session_provider.dart';
import 'package:training_schedule_app/utils/date_utils.dart';

/// TODO: add in eventLoader func. to add a marker (e.g. a dot) to each day on which a session was completed

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;
  StartingDayOfWeek _startingDayOfWeek = StartingDayOfWeek.monday;

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(
      builder: (BuildContext context, sessionData, Widget? child) {
        return TableCalendar(
          firstDay: DateTime.now().subtract(Duration(days: 365 * 30)),
          lastDay: DateTime.now().add(Duration(days: 365 * 10)),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          startingDayOfWeek: _startingDayOfWeek,

          /// LEAVE CODE FOR NOW, REVISIT LATER
          /// onDaySelected is disabled. Comment in to enable.
          /// if enabled, also add in functionality to update the selectedSessions based on selectedDay
          /// and find a way to disable / reverse the selection to return to a list of the sessions in the range of format

          // selectedDayPredicate: (day) {
          //   // Use `selectedDayPredicate` to determine which day is currently selected.
          //   // If this returns true, then `day` will be marked as selected.

          //   // Using `isSameDay` is recommended to disregard
          //   // the time-part of compared DateTime objects.
          //   return isSameDay(_selectedDay, day);
          // },

          // onDaySelected: (selectedDay, focusedDay) {
          //   if (!isSameDay(_selectedDay, selectedDay)) {
          //     // Call `setState()` when updating the selected day
          //     setState(() {
          //       _selectedDay = selectedDay;
          //       _focusedDay = focusedDay;
          //     });
          //   }
          // },

          /// TODO: BUG calendar shows current and next week in twoWeeks format.
          /// But selectedSessions gets session for last week and current week.
          /// So a mismatch between dates shown and sessions shown. Cannot figure out how to change which weeks are shown...
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              _calendarFormat = format;

              // Update the selectedSessions based on the new format. The range changes to the first day of the format.ß
              sessionData.updateSelectedSessions(
                format: _calendarFormat,
                focusedDay: _focusedDay,
              );

              // Call `setState()` when updating calendar format
              setState(() {});
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;

            // Update the selectedSessions for the new calendarPage
            sessionData.updateSelectedSessions(
              format: _calendarFormat,
              focusedDay: _focusedDay,
            );
          },
        );
      },
    );
  }
}
