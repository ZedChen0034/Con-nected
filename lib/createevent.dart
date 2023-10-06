import 'package:flutter/material.dart';
import 'eventDemo.dart';
import 'package:intl/intl.dart';

class Createevent extends StatefulWidget {

  final Function(EventDemo) addTaskCallback;
  Createevent({required this.addTaskCallback});
  @override
  _CreateeventState createState() => _CreateeventState();
}

class _CreateeventState extends State<Createevent> {
  String name = "";
  String selectedTag = "Community Service";
  DateTime selectedDateTime = DateTime.now();
  String location = "";
  String contact = "";
  String notificationType = "None";
  String description = "";
  void _showSuccessDialog(BuildContext context,EventDemo newEvent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 1), () {
          // Navigator.of(context).pop();
          widget.addTaskCallback(newEvent);
          Navigator.pop(context);
          Navigator.popUntil(context, ModalRoute.withName("/"));
        });

        return AlertDialog(
          title: Text("Success"),
          content: Text("Event Created！"),
        );
      },
    );
  }
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDateTime) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
      );
      if (selectedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            selectedTime.hour,
            selectedTime.minute,
          );
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Event Name"),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: selectedTag,
                items: ["Community Service","Law Consult", "Court Meeting","DATO courses", "Personal"]
                    .map((tag) {
                  return DropdownMenuItem(
                    value: tag,
                    child: Text(tag),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTag = value!;
                  });
                },
                decoration: InputDecoration(labelText: "Tag"),
              ),
              SizedBox(height: 16.0),
              InkWell(
                onTap: () {
                  _selectDateTime(context);
                },
                child: InputDecorator(
                  decoration: InputDecoration(labelText: "Date and Time"),
                  child: Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Location"),
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Contact"),
                onChanged: (value) {
                  setState(() {
                    contact = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: notificationType,
                items: ["None", "5min before event","30min before event", "1h before event", "4h before event"]
                    .map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    notificationType = value!;
                  });
                },
                decoration: InputDecoration(labelText: "Notification Type"),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                maxLines: 4,
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {

                      EventDemo newEvent = EventDemo(
                        id: (EventDemo.SCRIPT.length+1).toString(),
                        name: name,
                        tag: selectedTag,
                        datetime: selectedDateTime,
                        location: location,
                        contact: contact,
                        notificationType: notificationType,
                        description: description, editable: true,
                      );
                      // EventDemo.SCRIPT.add(newEvent);
                      // print(newEvent.toString());
                      _showSuccessDialog(context,newEvent);
                    },
                    child: Text("Finish"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName("/"));
                    },
                    child: Text("Cancel"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

