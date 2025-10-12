import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_schedule_app/models/session.dart';
import 'package:training_schedule_app/utils/date_utils.dart';

class MyWeeklyCalendar extends StatefulWidget {
  final List<Session> sessions;

  const MyWeeklyCalendar({super.key, required this.sessions});

  @override
  State<MyWeeklyCalendar> createState() => _MyWeeklyCalendarState();
}

class _MyWeeklyCalendarState extends State<MyWeeklyCalendar> {
  late final ValueNotifier<List<Session>> _selectedSessions;

  CalendarFormat _calendarFormat = CalendarFormat.week;
  StartingDayOfWeek _startingDayOfWeek = StartingDayOfWeek.monday;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedSessions = ValueNotifier(
      getSessionsForDay(widget.sessions, _selectedDay!),
    ); //change to forRange
  }

  @override
  Widget build(BuildContext context) {
    // create a range function with the calendarFormat as input.
    // return the DateTime for the start of the week and current day
    // return the DateTime for first of the month and the current day
    // return the Datetime for one week before current week and the current day
    // adapt the range if scrolling through
    // use isSameDay somewhere to check whether it's not Monday

    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          startingDayOfWeek: _startingDayOfWeek,
          calendarFormat: _calendarFormat,
          // eventLoader: getSessionsForDay, // figure this out
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
                // _rangeStart = (selectedDay); // Important to clean those
                // _rangeEnd = null;
                // _rangeSelectionMode = RangeSelectionMode.toggledOff;
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
        ),
        Spacer(),
        Expanded(
          child: ValueListenableBuilder<List<Session>>(
            valueListenable: _selectedSessions,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      onTap: () => print('${value[index]}'),
                      title: Text('${value[index]}'),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

// Add some code to highlight the full week. 
// Perhaps with Highlightbuilder, need to figure out how this works.
// utils.dart has the function getWeekdayNumber, which returns 1-7 for each day of the week. 
// Can be used to get the date for first and last day of selected week.