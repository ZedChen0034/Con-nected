// https://www.kindacode.com/article/how-to-create-a-filter-search-listview-in-flutter/#google_vignette
// https://api.flutter.dev/flutter/material/Icons-class.html
// https://stackoverflow.com/questions/53254963/flutter-show-different-icons-based-on-value
// https://www.fluttericon.com/
// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
// https://stackoverflow.com/questions/57941227/how-to-add-icon-to-appbar-in-flutter
// https://stackoverflow.com/questions/56890400/set-color-on-active-item-in-a-bottomnavigationbartype-fixed
// https://api.flutter.dev/flutter/material/Colors-class.html

import 'package:flutter/material.dart';
import 'package:con_nected/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Event-0',
      home: HomePage(),
    );

  }
}

/// Flutter code sample for [NavigationBar].

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
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('Page 5'),
        ),
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
  final List<Map<String, dynamic>> _allUsers = [
    {"id": "2023-09-24-A", "picture": Icons.directions_run, "name": "09:00 - Community Serving", "address": "480 Northbourne Avenue, Dickson ACT 2602"},
    {"id": "2023-09-24-B", "picture": Icons.settings_phone, "name": "11:00 - Court meeting", "address": "4 Knowles Pl, Canberra ACT 2601"},
    {"id": "2023-10-16-A", "picture": Icons.public, "name": "13:00 - Farm Serving", "address": "2 Dairy Rd, Fyshwick ACT 2609"},
    {"id": "2023-12-11-A", "picture": Icons.emoji_transportation, "name": "14:30 - Traffic Conducting", "address": "111 Alinga St, Canberra ACT 2601"},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {results = _allUsers;}
    else {results = _allUsers.where((user) => user["id"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList()+_allUsers.where((user) => user["name"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList()+_allUsers.where((user) => user["address"].toLowerCase().contains(enteredKeyword.toLowerCase())).toList();}

    setState(() {_foundUsers = results;});

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event'),
        backgroundColor: Colors.lightGreen[900],
        leading:
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_outlined),
          ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.calendar_month),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundUsers.isNotEmpty
                  ? ListView.builder(
                itemCount: _foundUsers.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundUsers[index]["id"]),
                  color: Colors.lightGreen[200],
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Icon(
                      _foundUsers[index]['picture'],
                      color: Colors.red,
                      size: 35,
                    ),
                    title: Text(_foundUsers[index]["id"]+'\n'+_foundUsers[index]['name'],),
                    subtitle: Text(_foundUsers[index]['address']),
                  ),
                ),
              )
                  : const Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
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