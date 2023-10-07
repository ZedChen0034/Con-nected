import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF8f8f8),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Helping Center"),
        automaticallyImplyLeading: false,
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
          gradient: LinearGradient(  // Add gradient background
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.blueGrey[50]!,
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
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,

              ),
            ),
            if (description != null && description.isNotEmpty)
              Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,

                ),
              ),
          ],
        ),
      ),
    );
  }
}
