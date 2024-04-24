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
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

// Unused
import 'package:con_nected/Event/createevent.dart';
import 'package:con_nected/Event/calendar.dart';
import 'package:con_nected/Event/detail.dart';
import 'package:con_nected/Event/doneevent.dart';
import 'package:con_nected/Help/chat.dart';
import 'package:con_nected/Help/DocumentDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EventDemo> ALL = EventDemo.SCRIPT;
  bool visible = false;
  List<EventDemo> FOUND = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    FOUND = ALL;
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Notification"),
                        content: const Text("This is a notification."),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                  setState(() {
                    visible = !visible;
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
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/calendar');
                  },
                  icon: const Icon(Icons.calendar_month, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/createEvent');
                  },
                  icon:
                      const Icon(Icons.add_circle_outline, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/doneEvent');
                  },
                  icon: const Icon(Icons.done_all, color: Colors.white),
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
                        suffixIcon:
                            const Icon(Icons.search, color: Colors.deepPurple),
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
            top: 25.0,
            child: Visibility(
              visible: visible,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: ClipPath(
                  clipper: MessageClipper(borderRadius: 16),
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.deepPurple,
                    ),
                    child: const Center(
                        child: Text(
                      "This is a Message",
                      style: TextStyle(color: Colors.white70, fontSize: 20),
                    )),
                  ),
                ),
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
