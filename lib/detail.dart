// https://androidride.com/flutter-listview-navigation/
// https://blog.csdn.net/shving/article/details/114458640
// https://stackoverflow.com/questions/59940790/flutter-text-left-alignment
// https://stackoverflow.com/questions/59940790/flutter-text-left-alignment
// https://www.geeksforgeeks.org/urls-in-flutter/
// https://github.com/flutter/flutter/issues/116656
// https://stackoverflow.com/questions/66547273/how-can-i-change-the-background-color-of-a-textbutton-in-flutter
// https://stackoverflow.com/questions/74176046/how-to-put-an-icon-in-the-bottom-right-edge-of-container-in-flutter

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'eventDemo.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)!.settings.arguments as EventDemo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Information'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text("Year-Month-Date (Event ID)", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              // Text(note.datetime, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              // Text("Start Time", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              // Text(note.time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              const Text(
                "Event Name",
                style: TextStyle(color: Colors.green, fontSize: 20, height: 2),
              ),
              Text(
                event.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, height: 1),
              ),
              // const Text("Compulsory or Optional", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              const Text(
                "Tag",
                style: TextStyle(color: Colors.green, fontSize: 20, height: 2),
              ),
              Text(
                event.tag,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, height: 1),
              ),
              // const Text("Host (Judge)", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              // Text(note.host, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              const Text(
                "DateTime",
                style: TextStyle(color: Colors.green, fontSize: 20, height: 2),
              ),
              Text(
                event.datetime.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, height: 1),
              ),
              const Text(
                "Location",
                style: TextStyle(color: Colors.green, fontSize: 20, height: 2),
              ),
              Text(
                event.location,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, height: 1),
              ),
              ElevatedButton(
                child: const Text(
                  "Google Map - Click to Open",
                  style: TextStyle(fontSize: 15),
                ),
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () async {
                  String A =
                      "https://www.google.com/maps/place/" + event.location;
                  var url = Uri.parse(A);
                  await launchUrl(url);
                },
              ),
              const Text(
                "Contact",
                style: TextStyle(color: Colors.green, fontSize: 20, height: 3),
              ),
              Text(
                event.contact,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, height: 1),
              ),

              const Text(
                "NotificationType",
                style: TextStyle(color: Colors.green, fontSize: 20, height: 3),
              ),
              Text(
                event.notificationType,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, height: 1),
              ),
              const Text(
                "Description",
                style: TextStyle(color: Colors.green, fontSize: 20, height: 3),
              ),
              Text(
                event.description,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20, height: 1),
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
          )),
        ),
      ),
    );
  }
}
