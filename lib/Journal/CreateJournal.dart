import 'package:flutter/material.dart';

class CreateJournal extends StatefulWidget {
  @override
  _CreateJournalState createState() => _CreateJournalState();
}

class _CreateJournalState extends State<CreateJournal> {
  String? _feeling;
  String? _theme;
  String? _title;
  String? _reflection;
  bool? _photoUploaded = false;
  bool? _videoUploaded = false;
  bool _isPublic = false;  // New state for public access

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Journal'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Welcome to Create Journal Page"),
                    content: Text("You can upload your own journal here. Photos & videos are allowed as well."),
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
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter the journal title',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _title = value,
            ),
            SizedBox(height: 20),
            _buildDropdownButton('Select Feeling', _feeling, ['Great', 'Average', 'Bad']),
            SizedBox(height: 20),
            _buildDropdownButton('Select Theme', _theme, ['Appointment', 'Court', 'Pressure', 'Cravings', 'Opportunity']),
            SizedBox(height: 20),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your reflection...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _reflection = value,
            ),
            SizedBox(height: 20),
            _buildUploadButton('Upload Photo', _photoUploaded),
            SizedBox(height: 10),
            _buildUploadButton('Upload Video', _videoUploaded),
            SizedBox(height: 5),
            SwitchListTile(
              title: Text('Make Journal Public'),
              value: _isPublic,
              onChanged: (value) => setState(() => _isPublic = value),
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: _handleSubmit,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  DropdownButton<String> _buildDropdownButton(String hint, String? value, List<String> options) {
    return DropdownButton<String>(
      hint: Text(hint),
      value: value,
      onChanged: (newValue) => setState(() => value = newValue),
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  ElevatedButton _buildUploadButton(String text, bool? uploaded) {
    return ElevatedButton(
      onPressed: () => setState(() => uploaded = true),
      child: Text(uploaded == true ? '$text Uploaded' : text),
    );
  }

  void _handleSubmit() {
    if (_feeling != null && _title != null && _theme != null && _reflection != null) {
      // Implement journal creation logic here
      Navigator.pop(context); // If you created a new journal, replace this with return data
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill out all required fields!'))
      );
    }
  }
}
