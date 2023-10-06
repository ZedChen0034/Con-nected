
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
  late final ValueNotifier<List<Event>> _selectedEvents;

  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023,10,2): [const Event("Meeting")],
    DateTime.utc(2023,10,16): [const Event("Lecture"), const Event("Tutorial")],
  };
  List<Event> _getEventsForDay(day){
    return events[day] ?? [];
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
        backgroundColor: Colors.lightGreen[900],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
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
            child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _){
                  return ListView.builder(itemCount: value.length, itemBuilder: (context, index){
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text('${value[index]}'),
                      ),
                    );
                  });
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
