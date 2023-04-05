import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// A custom widget for the Table Calendar
class CalendarTable extends StatelessWidget {
  // Constructor with required properties
  const CalendarTable({
    Key? key,
    required this.calendarFormat,
    required this.focusedDay,
    required this.firstDay,
    required this.lastDay,
    required this.calendarStyle,
    required this.headerStyle,
    required this.selectedDayPredicate,
    required this.onDaySelected,
    required this.onPageChanged,
    required this.calendarBuilders,
  }) : super(key: key);

  final CalendarFormat calendarFormat;
  final DateTime focusedDay;
  final DateTime firstDay;
  final DateTime lastDay;
  final CalendarStyle calendarStyle;
  final HeaderStyle headerStyle;
  final bool Function(DateTime day) selectedDayPredicate;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final void Function(DateTime focusedDay) onPageChanged;
  final CalendarBuilders calendarBuilders;

  @override
  Widget build(BuildContext context) {
    // Return the TableCalendar widget with the given properties
    return TableCalendar(
      calendarFormat: calendarFormat,
      focusedDay: focusedDay,
      firstDay: firstDay,
      lastDay: lastDay,
      calendarStyle: calendarStyle,
      headerStyle: headerStyle,
      selectedDayPredicate: selectedDayPredicate,
      onDaySelected: onDaySelected,
      onPageChanged: onPageChanged,
      calendarBuilders: calendarBuilders,
    );
  }
}
