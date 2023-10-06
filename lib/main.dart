// https://www.kindacode.com/article/how-to-create-a-filter-search-listview-in-flutter/#google_vignette
// https://api.flutter.dev/flutter/material/Icons-class.html
// https://stackoverflow.com/questions/53254963/flutter-show-different-icons-based-on-value
// https://www.fluttericon.com/
// https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
// https://stackoverflow.com/questions/57941227/how-to-add-icon-to-appbar-in-flutter
// https://stackoverflow.com/questions/56890400/set-color-on-active-item-in-a-bottomnavigationbartype-fixed
// https://api.flutter.dev/flutter/material/Colors-class.html
// https://www.courts.act.gov.au/supreme/about-the-courts/judiciary/Chronological-list-of-Former-and-Current-Judges,-Associate-Judge-and-Masters

import 'package:con_nected/createevent.dart';
import 'package:flutter/material.dart';
import 'calendar.dart';
import 'detail.dart';
import 'profile.dart';
import 'story.dart';
import 'package:con_nected/eventDemo.dart';
import 'package:con_nected/doneevent.dart';
import 'package:intl/intl.dart';


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
            print(currentPageIndex);
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
  String _appBarTitle = 'Event'; // 默认标题为'Event'

  @override
  initState() {
    FOUND = ALL;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<EventDemo> results = [];
    if (enteredKeyword.isEmpty) {results = ALL;}
    else {results =
        ALL.where((user) => user.tag.toLowerCase().contains(enteredKeyword.toLowerCase())).toList()+
        ALL.where((user) => user.name.toLowerCase().contains(enteredKeyword.toLowerCase())).toList()+
            ALL.where((user) => user.description.toLowerCase().contains(enteredKeyword.toLowerCase())).toList()+
            ALL.where((user) => user.location.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();}
    setState(() {FOUND = results;});
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppBarByIndex(_currentIndex, context),// profile页面不显示appbar
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Padding(
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
                  child: FOUND.isNotEmpty
                      ? ListView.builder(
                    itemCount: FOUND.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(FOUND[index].id),
                      color: Colors.lightGreen[200],
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: Icon(
                          Icons.settings_phone,
                          // FOUND[index].picture,
                          color: Colors.red,
                          size: 35,
                        ),

                        title: Text(DateFormat('yyyy-MM-dd HH:mm').format(FOUND[index].datetime) +'\n'+FOUND[index].name+" - "+FOUND[index].tag,),
                        subtitle: Text(FOUND[index].location),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail(),
                              settings: RouteSettings(arguments: FOUND[index]),
                            ),
                          );
                        },
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
          Center(
            child: Story(),
          ),
          const Center(
            child: Text(
              'Help Page Content', // 替换为实际的Profile页面内容
              style: TextStyle(fontSize: 24),
            ),
          ),
          const Center(
            child: Text(
              'Journal Page Content', // 替换为实际的Profile页面内容
              style: TextStyle(fontSize: 24),
            ),
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
            switch (index) {
              case 0:
                _appBarTitle = 'Event';
                break;
              case 1:
                _appBarTitle = 'Story';
                break;
              case 2:
                _appBarTitle = 'Help';
                break;
              case 3:
                _appBarTitle = 'Journal';
                break;
              case 4:
                _appBarTitle = 'Profile';
                break;
            }
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

  getAppBarByIndex(int index, BuildContext context) {
    switch(index) {
      case 0:
        return AppBar(
          centerTitle: true,
          title:  Text(_appBarTitle),
          backgroundColor: Colors.lightGreen[900],
          leading:
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Calendar()));
              },
              icon: const Icon(Icons.calendar_month),
            ),
            IconButton(
              onPressed: ()  {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Createevent(
                          addTaskCallback: (newEvent) {
                            setState(() {
                              FOUND.add(newEvent);
                            });
                          },
                        )));

              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Doneevent()));
              },
              icon: const Icon(Icons.done_outlined),
            ),
          ],
        );
      case 1:

        return AppBar(
          centerTitle: true,
          title:  Text(_appBarTitle),
          // backgroundColor: Colors.lightGreen[900],
          leading:
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
        );
      case 2:
      // 返回第三个AppBar配置
        break;
      case 3:
      // 返回第四个AppBar配置
        break;
      case 4:
      // 返回第五个AppBar配置
        break;
      default:
        return null;
    }
  }
}
