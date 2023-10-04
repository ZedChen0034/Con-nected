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
import 'note.dart';
import 'createevent.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as Note;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Information'),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Year-Month-Date (Event ID)", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              Text(note.id, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              Text("Start Time", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              Text(note.time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              Text("Event Title", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              Text(note.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              Text("Compulsory or Optional", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              Text(note.attendance, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              Text("Host (Judge)", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              Text(note.host, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              Text("Address", style: TextStyle(color: Colors.green, fontSize: 20, height: 3),),
              Text(note.address, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
              ElevatedButton(
                child: Text("Google Map - Click to Open", style: TextStyle(fontSize: 20),),
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () async {
                  String A = "https://www.google.com/maps/place/"+note.address;
                  var url = Uri.parse(A);
                  await launchUrl(url);
                },
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  note.picture,
                  color: Colors.green,
                  size: 39,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
