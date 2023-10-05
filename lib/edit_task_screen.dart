
import 'package:flutter/material.dart';
import 'task.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  final Function(Task) updateTaskCallback;

  EditTaskScreen({required this.task, required this.updateTaskCallback});

  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late DateTime _completedDate;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task.title;
    _descriptionController.text = widget.task.description;
    _completedDate = widget.task.completedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit task'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.updateTaskCallback(Task(
                title: _titleController.text,
                description: _descriptionController.text,
                completedDate: _completedDate,
              ));
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _completedDate,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );

                if (pickedDate != null) {
                  setState(() {
                    _completedDate = pickedDate;
                  });
                }
              },
              icon: Icon(Icons.calendar_today),
              label: Text('Select completion date'),
            ),
          ],
        ),
      ),
    );
  }
}
