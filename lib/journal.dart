
import 'package:con_nected/GridItems/JournalGridItem.dart';
import 'package:con_nected/GridView/JournalGridView.dart';
import 'package:con_nected/JournalDetail.dart';
import 'package:flutter/material.dart';
import 'CreateJournal.dart';

class Journal extends StatefulWidget {
  @override
  _JournalState createState() => _JournalState();
}

class _JournalState extends State<Journal> {
  List<JournalGridItem> myItems = JournalGridItem.journalList;
  List<JournalGridItem> likedJournals = JournalGridItem.likedJournals;
  bool _isSearching = false;
  List<JournalGridItem> _filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = myItems.where((item) => item.isPublic).toList();  // Filter based on isPublic attribute
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
          var searchResults = myItems.where((item) =>
          item.theme.toLowerCase().contains(searchText) ||
              item.title.toLowerCase().contains(searchText) ||
              (item.reflection.toLowerCase().contains(searchText))
          ).toList();
          _filteredItems = searchResults.where((item) => item.isPublic).toList();
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
          style: const TextStyle(color: Colors.white), // 设置文本颜色为白色
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white), // 设置提示文本的颜色为白色
            border: InputBorder.none, // 去掉下划线
            focusedBorder: InputBorder.none, // 去掉焦点时的下划线
          ),
        )
            : const Text("Journal"),
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _isSearching = false;
                _searchController.clear();
              } else {
                _isSearching = true;
              }
            });
          },
          icon: _isSearching ? const Icon(Icons.close) : const Icon(Icons.search_outlined),
        ),
      ),
      body: JournalGridView(items: _filteredItems,
        onLikeToggle: (String id) {
          setState(() {
            // Find the item by id
            final item = myItems.firstWhere((item) => item.id == id);
            // Toggle the liked property
            item.liked = !item.liked;
            if (item.liked == false) {
              likedJournals.remove(item);
            }else{
              likedJournals.add(item);
            }
          });
        },
        onItemTap: (JournalGridItem item) {  // Assuming you've added an `onItemTap` callback to your JournalGridView widget.
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JournalDetail(journal: item,
                onLikedChanged: (updatedJournal) {
                  setState(() {
                    // Find the index of the journal you want to update
                    int index = myItems.indexWhere((j) => j.id == updatedJournal.id); // Assuming you have an id for each journal.
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
