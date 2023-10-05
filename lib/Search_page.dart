import 'package:flutter/material.dart';
import 'note.dart';
import 'detail.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String dropdownValue = 'Title';
  List<Note> searchResults = [];
  List<String> searchHistory = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _performSearch,
                ),
              ),
            ),
          ),
          DropdownButton<String>(
            value: dropdownValue,
            onChanged: (String? newValue) {
              if (newValue == 'Time') {
                _showTimePicker();
              } else {
                setState(() {
                  dropdownValue = newValue!;
                });
              }
            },
            items: <String>['Title', 'Time', 'Host', 'Address']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index].name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail(),
                        settings: RouteSettings(arguments: searchResults[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Text('Search History:'),
          ...searchHistory.map((term) => ListTile(
            title: Text(term),
            onTap: () {
              _searchController.text = term;
              _performSearch();
            },
          )).toList(),
        ],
      ),
    );
  }

  void _performSearch() {
    String query = _searchController.text;

    // Check if the history already contains this query. If yes, remove it so that it can be added to the end.
    if (searchHistory.contains(query)) {
      searchHistory.remove(query);
    }

    // Add the new search query to the history
    searchHistory.insert(0, query);

    // If the history exceeds 6 items, remove the oldest one
    if (searchHistory.length > 6) {
      searchHistory.removeLast();
    }

    searchResults.clear();

    if (dropdownValue == 'Title') {
      searchResults = Note.SCRIPT.where((note) => note.name.contains(query)).toList();
    } else if (dropdownValue == 'Time') {
      searchResults = Note.SCRIPT.where((note) => note.time.contains(query)).toList();
    } else if (dropdownValue == 'Host') {
      searchResults = Note.SCRIPT.where((note) => note.host.contains(query)).toList();
    } else if (dropdownValue == 'Address') {
      searchResults = Note.SCRIPT.where((note) => note.address.contains(query)).toList();
    }

    setState(() {});
  }


  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((selectedTime) {
      if (selectedTime != null) {
        _searchController.text = selectedTime.format(context);
        _performSearch();
      }
    });
  }
}
