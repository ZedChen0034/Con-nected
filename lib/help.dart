import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8f8f8),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Helping Center"),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _buildListItem("Document", "Personal Document"),
                _buildListItem("Jobs", "Job Offers"),
                _buildListItem("Public Resources", "Restaurant / Shelter"),
                _buildListItem("Emergency Contact"),
                _buildListItem("Court Meeting Manual"),
                _buildListItem("User Manual", "App Guidance"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(String title, [String? description]) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(  // More vibrant gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple[100]!,
              Colors.blue[100]!,
            ],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (description != null && description.isNotEmpty)
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
