import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotificationPage(),
      routes: {
        '/eventDetail': (context) => EventDetailPage(),
      },
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<Event> events = [
    Event(
      name: 'Event 1',
      tag: 'Tag 1',
      dateTime: '2023-10-10 10:00 AM',
      location: 'Location 1',
      contact: 'Contact 1',
      notificationType: 'Type 1',
      description: 'Description 1',
      imageUrl: 'https://example.com/image1.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CachedNetworkImage(
              imageUrl: events[index].imageUrl,
              width: 50,
              height: 50,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: Text(events[index].name),
            subtitle: Text(events[index].dateTime),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/eventDetail',
                arguments: events[index],
              );
            },
          );
        },
      ),
    );
  }
}

class EventDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Event event = ModalRoute.of(context)?.settings.arguments as Event;

    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Event Name: ${event.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Tag: ${event.tag}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Date and Time: ${event.dateTime}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Location: ${event.location}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Contact: ${event.contact}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Notification Type: ${event.notificationType}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${event.description}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Image.network(event.imageUrl),
          ],
        ),
      ),
    );
  }
}

class Event {
  final String name;
  final String tag;
  final String dateTime;
  final String location;
  final String contact;
  final String notificationType;
  final String description;
  final String imageUrl;

  Event({
    required this.name,
    required this.tag,
    required this.dateTime,
    required this.location,
    required this.contact,
    required this.notificationType,
    required this.description,
    required this.imageUrl,
  });
}