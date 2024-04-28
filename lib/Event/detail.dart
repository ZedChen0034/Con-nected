// https://androidride.com/flutter-listview-navigation/
// https://blog.csdn.net/shving/article/details/114458640
// https://stackoverflow.com/questions/59940790/flutter-text-left-alignment
// https://stackoverflow.com/questions/59940790/flutter-text-left-alignment
// https://www.geeksforgeeks.org/urls-in-flutter/
// https://github.com/flutter/flutter/issues/116656
// https://stackoverflow.com/questions/66547273/how-can-i-change-the-background-color-of-a-textbutton-in-flutter
// https://stackoverflow.com/questions/74176046/how-to-put-an-icon-in-the-bottom-right-edge-of-container-in-flutter

import 'package:con_nected/Component/from_event_to_main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Component/eventDemo.dart';
import 'package:intl/intl.dart';
import '../dialog.dart' as dialog;
import 'dart:math' as math;

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  //dialog variable
  int point = 0;
  double slope = 0.5;
  double height = 100;
  double top = 0;
  double noteTop = 40;
  double angle = math.pi;
  String noteText = "Text";

  @override
  initState() {
    dialog.visible = false;
  }

  void _showDeleteConfirmation(BuildContext context, EventDemo event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Event'),
          content: const Text('Are you sure you want to delete this event?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/',
                  arguments: FromEventToMain(
                    eventDemo: event,
                    createOrEdit: "delete",
                  ),
                );
                // Navigator.of(context).pop(true);
                // Navigator.of(context).pop('deleted');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final EventDemo event =
        ModalRoute.of(context)!.settings.arguments as EventDemo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Information'),
        backgroundColor: Colors.green,
        actions: event.editable
            ? [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      Navigator.pushNamed(
                        context,
                        '/createEvent',
                        arguments: event,
                      );
                    } else if (value == 'delete') {
                      _showDeleteConfirmation(context, event);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Event Name",
                        style: TextStyle(
                            color: Colors.green, fontSize: 20, height: 2),
                      ),
                      Text(
                        event.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1),
                      ),
                      const Text(
                        "Tag",
                        style: TextStyle(
                            color: Colors.green, fontSize: 20, height: 2),
                      ),
                      Text(
                        event.tag,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1),
                      ),
                      const Text(
                        "DateTime",
                        style: TextStyle(
                            color: Colors.green, fontSize: 20, height: 2),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd HH:mm').format(event.datetime),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1),
                      ),
                      const Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.green, fontSize: 20, height: 2),
                      ),
                      Text(
                        event.location,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1),
                      ),
                      GestureDetector(
                        onLongPress: () {
                          setState(() {
                            dialog.visible = true;
                            point = 3;
                            slope = 0;
                            height = 130;
                            top = 130;
                            noteTop = 15;
                            angle = 0;
                            noteText =
                                "Simply click the orange button to open Google Maps and find the location instantly.";
                          });
                        },
                        child: ElevatedButton(
                          child: const Text(
                            "Google Map - Click to Open",
                            style: TextStyle(fontSize: 15),
                          ),
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.red)),
                          onPressed: () async {
                            String A = "https://www.google.com/maps/place/" +
                                event.location;
                            var url = Uri.parse(A);
                            await launchUrl(url);
                          },
                        ),
                      ),
                      const Text(
                        "Contact",
                        style: TextStyle(
                            color: Colors.green, fontSize: 20, height: 3),
                      ),
                      Text(
                        event.contact,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1),
                      ),
                      const Text(
                        "NotificationType",
                        style: TextStyle(
                            color: Colors.green, fontSize: 20, height: 3),
                      ),
                      Text(
                        event.notificationType,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1),
                      ),
                      const Text(
                        "Description",
                        style: TextStyle(
                            color: Colors.green, fontSize: 20, height: 3),
                      ),
                      Text(
                        event.description,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            height: 1),
                      ),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          Icons.directions_run,
                          color: Colors.green,
                          size: 39,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: top,
                    child: Visibility(
                      visible: dialog.visible,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            dialog.visible = false;
                          });
                        },
                        child: Transform.rotate(
                          angle: angle,
                          child: ClipPath(
                            clipper: dialog.DialogClipper(
                                radius: 30, point: point, slope: slope),
                            child: Container(
                              height: height,
                              color: Colors.greenAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 7.0,
                    right: 7.0,
                    top: top + noteTop,
                    child: Visibility(
                      visible: dialog.visible,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            dialog.visible = false;
                          });
                        },
                        child: Center(
                          child: Text(
                            noteText,
                            style: const TextStyle(
                                color: Colors.black45, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
