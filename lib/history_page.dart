import 'package:flutter/material.dart';
import 'Search_page.dart';
import 'new_task_screen.dart';
import 'TaskDetailPage.dart';
import 'task.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> completedTasks = [
    Task(
        title: "Complete and publish a journal",
        description:
        "About my recent feelings and daily life without drinking alcohol",
        completedDate: DateTime.now().subtract(Duration(days: 1))),
    Task(
        title: "Watched a live broadcast",
        description:
        "I watched a live broadcast by a graduate and felt inspired.",
        completedDate: DateTime.now().subtract(Duration(days: 2))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Welcome to History Page"),
                    content: Text("You can check your historical events here. You will also find the search function on the top center useful."),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchPage()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, color: Colors.black, size: 20.0),
                  SizedBox(width: 4.0),
                  Text('Search...',
                      style: TextStyle(color: Colors.black, fontSize: 14.0)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: completedTasks.length,
              itemBuilder: (context, index) {
                final task = completedTasks[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Dismissible(
                    key: Key('${task.title}-${task.completedDate}'),
                    onDismissed: (direction) {
                      setState(() {
                        completedTasks.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                            Text('Task "${task.title}" has been deleted')),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            Icon(Icons.delete, color: Colors.white),
                            SizedBox(width: 20),
                            Text("Delete",
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      title: Text(task.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text(task.description,
                          style:
                          TextStyle(fontSize: 14, color: Colors.grey[600])),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TaskDetailsScreen(task: task),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTaskScreen(
                addTaskCallback: (newTask) {
                  setState(() {
                    completedTasks.add(newTask);
                  });
                },
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
