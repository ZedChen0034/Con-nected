import 'package:flutter/material.dart';

import 'Search_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(width: 10.0),
                    Text('Search...'),
                  ],
                ),
              ),
            ),
          ),
          // Add other content or widgets here if necessary
        ],
      ),
    );
  }
}


