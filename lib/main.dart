// https://www.kindacode.com/article/how-to-create-a-filter-search-listview-in-flutter/#google_vignette
// https://api.flutter.dev/flutter/material/Icons-class.html
// https://stackoverflow.com/questions/53254963/flutter-show-different-icons-based-on-value
// https://www.fluttericon.com/
// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
// https://stackoverflow.com/questions/57941227/how-to-add-icon-to-appbar-in-flutter
// https://stackoverflow.com/questions/56890400/set-color-on-active-item-in-a-bottomnavigationbartype-fixed
// https://api.flutter.dev/flutter/material/Colors-class.html
// https://www.courts.act.gov.au/supreme/about-the-courts/judiciary/Chronological-list-of-Former-and-Current-Judges,-Associate-Judge-and-Masters

import 'package:con_nected/Component/EventList.dart';
import 'package:con_nected/Notifications.dart';
import 'package:con_nected/createevent.dart';
import 'package:con_nected/journal.dart';
import 'package:flutter/material.dart';
import 'calendar.dart';
import 'detail.dart';
import 'profile.dart';
import 'story.dart';
import 'package:con_nected/Component/eventDemo.dart';
import 'package:con_nected/doneevent.dart';
import 'Component/from_event_to_main.dart';
import 'help.dart';
import 'chat.dart';
import 'DocumentDetail.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Event-0',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/calendar': (context) => const Calendar(),
        '/createEvent': (context) => Createevent(),
        '/doneEvent': (context) => Doneevent(),
        '/detail': (context) => Detail(),
        '/help': (context) => Help(),
        '/chat': (context) => Chat(),
        '/documentDetail': (context) => DocumentDetail(),
      },
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Event',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'Story',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.question_mark),
            icon: Icon(Icons.question_mark_outlined),
            label: 'Help',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.directions_car),
            icon: Icon(Icons.directions_car_outlined),
            label: 'Journal',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.face),
            icon: Icon(Icons.face_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
        Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
        // Profile(),
      ][currentPageIndex],
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<EventDemo> ALL = EventDemo.SCRIPT;

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
                  // ClipPath(
                  //   clipper: MessageClipper(borderRadius: 16),
                  //   child: Container(
                  //     height: 200,
                  //     decoration: const BoxDecoration(
                  //       borderRadius: BorderRadius.all(Radius.circular(16)),
                  //       color: Colors.purpleAccent,
                  //     ),
                  //     child: const Center(child: Text("Message")),
                  //   ),
                  // );
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
      body: IndexedStack(
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
            child: Profile(),
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
            icon: Icon(Icons.face),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
