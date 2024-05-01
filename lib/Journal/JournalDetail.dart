import 'package:flutter/material.dart';
import 'package:con_nected/GridItems/JournalGridItem.dart';
import '../dialog.dart' as dialog;
import 'dart:math' as math;

class JournalDetail extends StatefulWidget {
  final JournalGridItem journal;
  final Function(JournalGridItem) onLikedChanged;

  JournalDetail({required this.journal, required this.onLikedChanged});

  @override
  _JournalDetailState createState() => _JournalDetailState();
}

class _JournalDetailState extends State<JournalDetail> {
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
    super.initState();
    dialog.visible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
        title: Text(widget.journal.author, style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.black),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Welcome to Journal Detail Page"),
                    content: Text("You can read the detailed contents of stories here. If you like this story, click the 'Like' button to add it to your Favorite."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
            child: ListView(
              children: <Widget>[
                if (widget.journal.imagePath != null &&
                    widget.journal.imagePath!.isNotEmpty)
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(widget.journal.imagePath!),
                    ),
                  ),
                Text(widget.journal.title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                SizedBox(height: 10),
                Text(widget.journal.feeling,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[600],
                        fontStyle: FontStyle.italic)),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Text(widget.journal.reflection,
                      style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                ),
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
    );
  }
}
