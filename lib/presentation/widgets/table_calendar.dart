import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyTableCalendar extends StatefulWidget {
  const MyTableCalendar({super.key});

  @override
  State<MyTableCalendar> createState() => _MyTableCalendarState();
}

class _MyTableCalendarState extends State<MyTableCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; 
  DateTime? _selectedDay;
    DateTime? _rangeStart;
  DateTime? _rangeEnd;


  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
            _rangeStart = (selectedDay); // Important to clean those
              _rangeEnd = null;
              _rangeSelectionMode = RangeSelectionMode.toggledOff;
          });
        }
      },
      onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
    );
  }
}

// Add some code to highlight the full week. 
// Perhaps with Highlightbuilder, need to figure out how this works.
// utils.dart has the function getWeekdayNumber, which returns 1-7 for each day of the week. 
// Can be used to get the date for first and last day of selected week.