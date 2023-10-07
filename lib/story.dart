import 'package:con_nected/GridItem.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  List<GridItem> myItems = GridItem.storyList;
  List<GridItem> likedStories = GridItem.likedStories;
  bool _isSearching = false;
  List<GridItem> _filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = myItems;
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
                item.tag!.toLowerCase().contains(searchText) ||
                item.title.toLowerCase().contains(searchText) ||
                (item.description?.toLowerCase().contains(searchText) ?? false))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style:  TextStyle(color: Colors.grey[700]),
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none, // 去掉焦点时的下划线
                ),
              )
            : Text("Story Telling", style: TextStyle(color: Colors.grey[800])),
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
          icon: _isSearching
              ? Icon(Icons.close, color: Colors.grey[600])
              : Icon(Icons.search_outlined, color: Colors.grey[600]),
        ),
      ),
      body: ListView.separated(
        itemCount: _filteredItems.length,
        separatorBuilder: (context, index) => Divider(color: Colors.grey[400]),
        // 添加分隔符
        itemBuilder: (context, index) {
          GridItem item = _filteredItems[index];
          return Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    blurRadius: 3,
                    offset: Offset(0, 1),  // Shadow position
                  ),
                ],
              ),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(item.imagePath,
                        fit: BoxFit.cover, height: 150, width: 150)),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800])),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(item.tag!, style: TextStyle(color: Colors.blue[800])),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(item.liked! ? Icons.favorite : Icons.favorite_border),
                                color: item.liked! ? Colors.red : Colors.grey,
                                onPressed: () {
                                  setState(() {
                                    item.liked = !item.liked!;
                                    if (item.liked!) {
                                      likedStories.add(item);
                                    } else {
                                      likedStories.remove(item);
                                    }
                                  });
                                },
                              ),
                              Text(item.like!, style: TextStyle(color: Colors.grey[700]))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
