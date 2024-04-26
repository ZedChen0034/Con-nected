// https://www.kindacode.com/article/how-to-create-a-filter-search-listview-in-flutter/#google_vignette
// https://api.flutter.dev/flutter/material/Icons-class.html
// https://stackoverflow.com/questions/53254963/flutter-show-different-icons-based-on-value
// https://www.fluttericon.com/
// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
// https://stackoverflow.com/questions/57941227/how-to-add-icon-to-appbar-in-flutter
// https://stackoverflow.com/questions/56890400/set-color-on-active-item-in-a-bottomnavigationbartype-fixed
// https://api.flutter.dev/flutter/material/Colors-class.html
// https://www.courts.act.gov.au/supreme/about-the-courts/judiciary/Chronological-list-of-Former-and-Current-Judges,-Associate-Judge-and-Masters

import 'package:flutter/material.dart';
import 'package:con_nected/Component/EventList.dart';
import 'package:con_nected/Event/Notifications.dart';
import 'package:con_nected/journal.dart';
import 'package:con_nected/profile.dart';
import 'package:con_nected/story.dart';
import 'package:con_nected/peer.dart';
import 'package:con_nected/Component/eventDemo.dart';
import 'package:con_nected/Component/from_event_to_main.dart';
import 'package:con_nected/help.dart';
import 'dialog.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EventDemo> ALL = EventDemo.SCRIPT;
  bool visible = false;
  int point = 0;
  double slope = 0.5;
  double height = 100;
  double top = 0;
  double noteTop = 40;
  double angle = math.pi;
  String noteText = "Text";
  // eventDEMO
  List<EventDemo> FOUND = [];
  int _currentIndex = 0;

  @override
  initState() {
    FOUND = ALL;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    Set<EventDemo> results = {};
    if (enteredKeyword.isEmpty) {
      results = Set.from(ALL);
    } else {
      results.addAll(ALL.where((user) =>
          user.tag.toLowerCase().contains(enteredKeyword.toLowerCase())));
      results.addAll(ALL.where((user) =>
          user.name.toLowerCase().contains(enteredKeyword.toLowerCase())));
      results.addAll(ALL.where((user) => user.description
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase())));
      results.addAll(ALL.where((user) =>
          user.location.toLowerCase().contains(enteredKeyword.toLowerCase())));
    }

    setState(() {
      FOUND = results.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    FromEventToMain? fromEventToMain;

    if (ModalRoute.of(context)?.settings.arguments != null) {
      fromEventToMain =
          ModalRoute.of(context)!.settings.arguments as FromEventToMain;
    }

    if (fromEventToMain != null) {
      if (fromEventToMain.createOrEdit == "create") {
        int indexToUpdate = FOUND
            .indexWhere((event) => event.id == fromEventToMain?.eventDemo.id);
        if (indexToUpdate == -1) {
          setState(() {
            FOUND.add(fromEventToMain!.eventDemo);
          });
        }
      } else if (fromEventToMain.createOrEdit == "edit") {
        int indexToUpdate = FOUND
            .indexWhere((event) => event.id == fromEventToMain?.eventDemo.id);
        if (indexToUpdate != -1) {
          setState(() {
            FOUND[indexToUpdate] = fromEventToMain!.eventDemo;
          });
        }
      } else if (fromEventToMain.createOrEdit == "delete") {
        FOUND.remove(fromEventToMain.eventDemo);
      }
    }
    return Scaffold(
      appBar: _currentIndex == 0
          ? AppBar(
              centerTitle: true,
              title: const Text("Event"),
              backgroundColor: Colors.deepPurple[700],
              leading: GestureDetector(
                onLongPress: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return AlertDialog(
                  //       title: const Text("Notification"),
                  //       content: const Text("This is a notification."),
                  //       actions: [
                  //         TextButton(
                  //           onPressed: () {
                  //             Navigator.of(context).pop();
                  //           },
                  //           child: const Text("Close"),
                  //         ),
                  //       ],
                  //     );
                  //   },
                  // );
                  setState(() {
                    visible = true;
                    point = 4;
                    slope = 0.8;
                    height = 100;
                    top = 0;
                    noteTop = 40;
                    angle = math.pi;
                    noteText =
                        "Never miss out on what's important with timely event notifications.";
                  });
                },
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Notifications()));
                  },
                  icon: const Icon(Icons.notifications_outlined,
                      color: Colors.white),
                ),
              ),
              actions: [
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      visible = true;
                      point = 1;
                      slope = 0.4;
                      height = 100;
                      top = 0;
                      noteTop = 40;
                      angle = math.pi;
                      noteText =
                          "Utilize our event calendar to keep track of your plans and schedules.";
                    });
                  },
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/calendar');
                    },
                    icon: const Icon(Icons.calendar_month, color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      visible = true;
                      point = 1;
                      slope = 0;
                      height = 100;
                      top = 0;
                      noteTop = 40;
                      angle = math.pi;
                      noteText =
                          "Have an idea? Easily create new events and bring people together.";
                    });
                  },
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/createEvent');
                    },
                    icon: const Icon(Icons.add_circle_outline,
                        color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      visible = true;
                      point = 0;
                      slope = 0.2;
                      height = 100;
                      top = 0;
                      noteTop = 40;
                      angle = math.pi;
                      noteText =
                          "Browse through completed activities to relive the fun moments.";
                    });
                  },
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/doneEvent');
                    },
                    icon: const Icon(Icons.done_all, color: Colors.white),
                  ),
                ),
              ],
            )
          : null,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          IndexedStack(
            index: _currentIndex,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      onChanged: (value) => _runFilter(value),
                      decoration: InputDecoration(
                        labelText: 'Search',
                        suffixIcon: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              visible = true;
                              point = 0;
                              slope = 0.2;
                              height = 100;
                              top = 90;
                              noteTop = 40;
                              angle = math.pi;
                              noteText =
                                  "Quickly search for events that match your interests or schedules.";
                            });
                          },
                          child: const Icon(Icons.search,
                              color: Colors.deepPurple),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onLongPress: () {
                          setState(() {
                            visible = true;
                            point = 2;
                            slope = 0.6;
                            height = 100;
                            top = 20;
                            noteTop = 20;
                            angle = 0;
                            noteText =
                                "Check out our list of upcoming events to find your next adventure.";
                          });
                        },
                        child: EventList(
                          events: FOUND,
                          onEventTap: (event) {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: event,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Story(),
              ),
              Center(
                child: Help(),
              ),
              Center(
                child: Journal(),
              ),
              Center(
                child: Peer(),
              ),
              Center(
                child: Profile(),
              ),
            ],
          ),
          Positioned(
            left: 18.0,
            right: 18.0,
            top: top,
            child: Visibility(
              visible: visible,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    visible = false;
                  });
                },
                child: Transform.rotate(
                  angle: angle,
                  child: ClipPath(
                    clipper:
                        DialogClipper(radius: 30, point: point, slope: slope),
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
              visible: visible,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    visible = !visible;
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Story',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Peer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
