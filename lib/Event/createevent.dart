import 'package:flutter/material.dart';
import '../Component/eventDemo.dart';
import 'package:intl/intl.dart';
import '../Component/from_event_to_main.dart';

class Createevent extends StatefulWidget {
  @override
  _CreateeventState createState() => _CreateeventState();
}

class _CreateeventState extends State<Createevent> {
  late EventDemo event;
  bool create = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EventDemo? passedEvent =
        ModalRoute.of(context)?.settings.arguments as EventDemo?;

    event = passedEvent ?? EventDemo.empty();
    create = event.isEmpty;
  }

  void _showSuccessDialog(BuildContext context, EventDemo newEvent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushNamed(
            context,
            '/',
            arguments: FromEventToMain(
              eventDemo: newEvent,
              createOrEdit: create ? "create" : "edit",
            ),
          );
        });

        return  AlertDialog(
          title: const Text("Success"),
          content: create?const Text("Event Created！"):const Text("Event Updated！"),
        );
      },
    );
  }

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: event.datetime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != event.datetime) {
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(event.datetime),
      );
      if (selectedTime != null) {
        setState(() {
          event.datetime = DateTime(
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
        title: Text(event.isEmpty ? "Create event" : "Edit event"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        backgroundColor: Colors.lightBlue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [

              TextFormField(
                initialValue: event.name,
                decoration: const InputDecoration(labelText: "Event Name",              prefixIcon: Icon(Icons.event, color: Colors.deepPurple),  // Icon for Event Name
                ),
                onChanged: (value) {
                  setState(() {
                    event.name = value;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: event.tag,
                items: [
                  "Community Service",
                  "Law Consult",
                  "Court Meeting",
                  "DATO courses",
                  "Personal"
                ].map((tag) {
                  return DropdownMenuItem(
                    value: tag,
                    child: Text(tag),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    event.tag = value!;
                  });
                },
                decoration: const InputDecoration(labelText: "Tag"),
              ),
              const SizedBox(height: 10.0),
              InkWell(
                onTap: () {
                  _selectDateTime(context);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(labelText: "Date and Time"),
                  child: Text(
                    DateFormat('yyyy-MM-dd HH:mm').format(event.datetime),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                initialValue: event.location,
                decoration: const InputDecoration(labelText: "Location"),
                onChanged: (value) {
                  setState(() {
                    event.location = value;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                initialValue: event.contact,
                decoration: const InputDecoration(labelText: "Contact"),
                onChanged: (value) {
                  setState(() {
                    event.contact = value;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                value: event.notificationType,
                items: [
                  "None",
                  "5min before event",
                  "30min before event",
                  "1h before event",
                  "4h before event"
                ].map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    event.notificationType = value!;
                  });
                },
                decoration:
                    const InputDecoration(labelText: "Notification Type"),
              ),
              // const SizedBox(height: 10.0),
              TextFormField(
                initialValue: event.description,
                decoration: const InputDecoration(labelText: "Description"),
                onChanged: (value) {
                  setState(() {
                    event.description = value;
                  });
                },
                maxLines: 4,
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // EventDemo eventToSave;
                      if (create) {
                        event = EventDemo(
                          id: (EventDemo.SCRIPT.length + 1).toString(),
                          name: event.name,
                          tag: event.tag,
                          datetime: event.datetime,
                          location: event.location,
                          contact: event.contact,
                          notificationType: event.notificationType,
                          description: event.description,
                          editable: true,
                        );
                      }
                      _showSuccessDialog(context, event);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),  // Custom Color for Button
                      elevation: MaterialStateProperty.all(5),  // Shadow under Button
                    ),
                    child: create?const Text("Create"):const Text("Update"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.grey),
                      elevation: MaterialStateProperty.all(5),  // Shadow under Button
                    ),
                    child: const Text("Cancel"),
                  ),
                ],
              ),
            ])))],
          ),
        ),
      ),
    );
  }
}
