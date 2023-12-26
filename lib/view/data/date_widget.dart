import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          selectedDayPredicate: (day) {
            var selectedDay = DateTime.now();
            return isSameDay(selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              var selectedDay = DateTime.now();
              var focusedDay = DateTime.now();
              selectedDay = selectedDay;
              focusedDay = focusedDay;
            });
          },
          calendarFormat: CalendarFormat.month,
          onFormatChanged: (format) {
            setState(() {
              format = format;
            });
          },
          firstDay: DateTime.utc(2010, 11, 16),
          lastDay: DateTime.utc(2030, 5, 14),
          focusedDay: DateTime.now(),
        )
      ],
    );
  }
}
