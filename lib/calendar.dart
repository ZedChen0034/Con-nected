import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

/// Reference to https://pub.dev/packages/table_calendar

class Calendar extends StatelessWidget {
  const Calendar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event"),
        centerTitle: true,
      ),
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(1900),
        lastDay: DateTime(2900),
      ),
    );
  }
  
}