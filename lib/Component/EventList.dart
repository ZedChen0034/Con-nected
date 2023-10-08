import 'package:con_nected/eventDemo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventList extends StatelessWidget {
  final List<EventDemo> events;
  final Function(EventDemo) onEventTap;

  EventList({required this.events, required this.onEventTap});

  @override
  Widget build(BuildContext context) {
    return events.isNotEmpty
        ? ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) => Card(
        key: ValueKey(events[index].id),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.transparent,
        elevation: 8,
        margin:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                leading: const Icon(
                  Icons.event,
                  color: Colors.white,
                  size: 35,
                ),
                title: Text(
                  DateFormat('yyyy-MM-dd HH:mm')
                      .format(events[index].datetime) +
                      '\n' +
                      events[index].name +
                      " - " +
                      events[index].tag,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  events[index].location,
                  style: TextStyle(color: Colors.white60),
                ),
                onTap: () => onEventTap(events[index]),
              ),
            )),
      ),
    )
        : Center(
        child: Text(
          'No results found',
          style: TextStyle(fontSize: 24, color: Colors.deepPurple[700]),
        ));
  }
}
