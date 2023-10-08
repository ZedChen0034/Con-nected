import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Model/NotificationItem.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<NotificationItem> notifications = [
    NotificationItem(
        sender: 'System',
        content: 'xxx has successfully reached the third phase.',
        timestamp: DateTime.now()),
    NotificationItem(
        sender: 'Warning',
        content: 'Note: Your penalty points are too high!',
        timestamp: DateTime.now().subtract(Duration(hours: 1))),
    NotificationItem(
        sender: 'System',
        content: 'xxx has successfully reached the second phase.',
        timestamp: DateTime.now().subtract(Duration(days: 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(notifications[index].timestamp.toString()),
            // Unique key for Dismissible
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                notifications.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notification dismissed'),
                  duration: Duration(
                      milliseconds: 500),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text(notifications[index].sender[0]),
                backgroundColor: notifications[index].sender == 'Warning'
                    ? Colors.red
                    : Colors.blue,
              ),
              title: Text(notifications[index].content),
              subtitle: Text(DateFormat('yyyy-MM-dd HH:mm')
                  .format(notifications[index].timestamp)),
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 14.0, color: Colors.grey[400]),
            ),
          );
        },
      ),
    );
  }
}
