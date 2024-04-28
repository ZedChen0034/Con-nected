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
      setState(() {
        if (searchText.isEmpty) {
          _filteredItems = myItems;
        } else {
          var searchResults = myItems
              .where((item) =>
                  item.theme.toLowerCase().contains(searchText) ||
                  item.title.toLowerCase().contains(searchText) ||
                  (item.reflection.toLowerCase().contains(searchText)))
              .toList();
          _filteredItems =
              searchResults.where((item) => item.isPublic).toList();
        }
      });
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
        leading: GestureDetector(
          onLongPress: () {
            setState(() {
              dialog.visible = true;
              point = 4;
              slope = 1;
              height = 130;
              top = 0;
              noteTop = 40;
              angle = math.pi;
              noteText =
                  "Interested in some specific topics? You can search whatever you like here to find out related journals.";
            });
          },
          child: IconButton(
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchController.clear();
                }
                _isSearching = !_isSearching;
                dialog.visible = false;
              });
            },
            icon: _isSearching
                ? const Icon(Icons.close)
                : const Icon(Icons.search_outlined),
          ),
        ),
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
              // Assuming you've added an `onItemTap` callback to your JournalGridView widget.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JournalDetail(
                    journal: item,
                    onLikedChanged: (updatedJournal) {
                      setState(() {
                        // Find the index of the journal you want to update
                        int index = myItems.indexWhere((j) =>
                            j.id ==
                            updatedJournal
                                .id); // Assuming you have an id for each journal.
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
          Positioned(
            left: 18.0,
            right: 18.0,
            top: top,
            child: Visibility(
              visible: dialog.visible,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    dialog.visible = false;
                  });
                },
                child: Transform.rotate(
                  angle: angle,
                  child: ClipPath(
                    clipper: dialog.DialogClipper(
                        radius: 30, point: point, slope: slope),
                    child: Container(
                      height: height,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 25.0,
            right: 25.0,
            top: top + noteTop,
            child: Visibility(
              visible: dialog.visible,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    dialog.visible = false;
                  });
                },
                child: Center(
                    child: Text(
                  noteText,
                  style: const TextStyle(color: Colors.black45, fontSize: 20),
                )),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "journal",
        onPressed: () async {
          setState(() {
            dialog.visible = false;
          });
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
