import 'package:con_nected/GridItems/JournalGridItem.dart';
import 'package:con_nected/GridView/JournalGridView.dart';
import 'package:con_nected/Journal/JournalDetail.dart';
import 'package:flutter/material.dart';
import 'Journal/CreateJournal.dart';
import 'dialog.dart' as dialog;
import 'dart:math' as math;

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  //dialog variable
  int point = 0;
  double slope = 0.5;
  double height = 100;
  double top = 0;
  double noteTop = 40;
  double angle = math.pi;
  String noteText = "Text";

  List<JournalGridItem> myItems = JournalGridItem.journalList;
  List<JournalGridItem> likedJournals = JournalGridItem.likedJournals;
  bool _isSearching = false;
  List<JournalGridItem> _filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dialog.visible = false;
    _filteredItems = myItems
        .where((item) => item.isPublic)
        .toList(); // Filter based on isPublic attribute
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    setState(() {
      String searchText = _searchController.text.toLowerCase();
      if (searchText.isEmpty) {
        _filteredItems = myItems;
      } else {
        _filteredItems = myItems
            .where((item) =>
        item.theme.toLowerCase().contains(searchText) ||
            item.title.toLowerCase().contains(searchText) ||
            item.reflection.toLowerCase().contains(searchText))
            .toList();
        _filteredItems = _filteredItems.where((item) => item.isPublic).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: _isSearching
            ? TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none, // remove underline
            focusedBorder: InputBorder.none, // remove focus underline
          ),
        )
            : const Text("Journal"),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Welcome to Journal Page"),
                    content: Text("Explore published journals by other users on our Journal page."),
                    actions: [
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
          IconButton(
            icon: _isSearching ? Icon(Icons.close) : Icon(Icons.search_outlined),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchController.clear();
                }
              });
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          JournalGridView(
            items: _filteredItems,
            onLikeToggle: (String id) {
              setState(() {
                // Find the item by id
                final item = myItems.firstWhere((item) => item.id == id);
                // Toggle the liked property
                item.liked = !item.liked;
                if (item.liked == false) {
                  likedJournals.remove(item);
                } else {
                  likedJournals.add(item);
                }
              });
            },
            onItemTap: (JournalGridItem item) {
              setState(() {
                dialog.visible = false;
              });
              // Navigate to JournalDetail
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JournalDetail(
                    journal: item,
                    onLikedChanged: (updatedJournal) {
                      setState(() {
                        // Update the journal
                        int index = myItems.indexWhere((j) => j.id == updatedJournal.id);
                        if (index != -1) {
                          myItems[index] = updatedJournal;
                        }
                      });
                    },
                  ),
                ),
              );
            },
          ),
          // Positioned widgets for dialog
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "journal",
        onPressed: () async {
          final newJournal = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateJournal()),
          );

          if (newJournal != null) {
            setState(() {
              myItems.add(newJournal);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
