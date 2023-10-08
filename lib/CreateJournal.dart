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
  // 为了简化，我们这里不实际处理图片和视频的上传
  bool? _photoUploaded = false;
  bool? _videoUploaded = false;
  bool _isPublic = false;  // 新添加的状态


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Journal'),
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
              onChanged: (value) {
                _title = value;
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              hint: Text("Select Feeling"),
              value: _feeling,
              onChanged: (String? newValue) {
                setState(() {
                  _feeling = newValue;
                });
              },
              items: <String>['Great', 'Average', 'Bad']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              hint: Text("Select Theme"),
              value: _theme,
              onChanged: (String? newValue) {
                setState(() {
                  _theme = newValue;
                });
              },
              items: <String>['Appointment', 'Court', 'Pressure','Cravings','Opportunity']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),

            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your reflection...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _reflection = value;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 这里你可以添加照片上传的逻辑
                setState(() {
                  _photoUploaded = true;
                });
              },
              child: Text(_photoUploaded == true ? 'Photo Uploaded' : 'Upload Photo'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // 这里你可以添加视频上传的逻辑
                setState(() {
                  _videoUploaded = true;
                });
              },
              child: Text(_videoUploaded == true ? 'Video Uploaded' : 'Upload Video'),
            ),
            SizedBox(height: 5),
            SwitchListTile(
              title: Text('Make Journal Public'),
              value: _isPublic,
              onChanged: (value) {
                setState(() {
                  _isPublic = value;
                });
              },
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                if (_feeling != null&& _title != null && _theme != null&& _reflection != null) {
                  // 此处，你应该创建并返回新的journal，此为简化示例
                  // GridItem newJournal = GridItem(...);

                  Navigator.pop(context); // 如果你创建了新的journal，应该替换这里返回的数据
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill out all required fields!'))
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
