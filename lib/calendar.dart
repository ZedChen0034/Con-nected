
import 'package:con_nected/Component/EventList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Component/eventDemo.dart';

/// Reference to https://pub.dev/packages/table_calendar

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar>{
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late final ValueNotifier<List<EventDemo>> _selectedEvents;
  List<EventDemo> events = EventDemo.SCRIPT;

  List<EventDemo> _getEventsForDay(date){
    Set<EventDemo> results = {};
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    results.addAll(events.where((user) =>
        dateFormat.format(date) == dateFormat.format(user.datetime)));
    var c = results.toList();
    if (c.isNotEmpty){
    }
    return results.toList();
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[700],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(1900),
            lastDay: DateTime(2900),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            headerStyle: const HeaderStyle(titleCentered: true),
            //Change format of calendar
            onFormatChanged: (format){
              setState(() {
                _calendarFormat = format;
              });
            },
            //select a date on calendar
            selectedDayPredicate: (day){
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay){
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents.value = _getEventsForDay(selectedDay);
                print(selectedDay);
              });
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ValueListenableBuilder<List<EventDemo>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _){
                  return EventList(
                    events: value,
                    onEventTap: (event) {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: event,
                      );
                    },
                  );
                }),
          )
        ]
      ),
    );
  }

}

class Event {
  final String title;
  const Event(this.title);
  @override
  String toString() => title;
}
