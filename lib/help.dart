import 'package:flutter/material.dart';
import 'dialog.dart' as dialog;
import 'dart:math' as math;

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8f8f8),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Helping Center"),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildListItem("Document", "Personal Documents"),
                _buildListItem("Jobs", "Job Offers"),
                _buildListItem("Public Resources", "Restaurant / Shelter"),
                _buildListItem("Emergency Contact"),
                _buildListItem("Court Meeting Manual"),
                _buildListItem("User Manual", "App Guidance"),
              ],
            ),
          ),
          Positioned(
            left: 18.0,
            right: 18.0,
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
            left: 25.0,
            right: 25.0,
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
                  style: const TextStyle(color: Colors.black45, fontSize: 20),
                )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          setState(() {
            dialog.visible = true;
            point = 4;
            slope = 0.7;
            height = 100;
            top = 400;
            noteTop = 15;
            angle = 0;
            noteText = "Remember to ask Felix for message.";
          });
        },
        child: FloatingActionButton(
          heroTag: "chatbot",
          onPressed: () {
            setState(() {
              dialog.visible = false;
            });
            Navigator.pushNamed(context, '/chat');
          },
          child: Icon(Icons.chat_bubble),
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }

  Widget _buildListItem(String title, [String? description]) {
    return GestureDetector(
      onTap: () {
        if (title == "Document") {
          Navigator.pushNamed(context, '/documentDetail');
        }
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // More vibrant gradient
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.purple[100]!,
                Colors.blue[100]!,
              ],
            ),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (description != null && description.isNotEmpty)
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
