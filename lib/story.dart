import 'package:con_nected/CustomMasonryGridView.dart';
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
      setState(() {
        if (searchText.isEmpty) {
          _filteredItems = myItems;
        } else {
          _filteredItems = myItems.where((item) =>
          item.tag!.toLowerCase().contains(searchText) ||
              item.title.toLowerCase().contains(searchText) ||
              (item.description?.toLowerCase().contains(searchText) ?? false)
          ).toList();
        }
      });    });
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
            : const Text("Story"),
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
      body: CustomMasonryGridView(items: _filteredItems,
        onLikeToggle: (String id) {
          setState(() {
            // Find the item by id
            final item = myItems.firstWhere((item) => item.id == id);
            // Toggle the liked property
            item.liked = !(item.liked ?? false);
            if (item.liked == false) {
              likedStories.remove(item);
            }else{
              likedStories.add(item);
            }
          });
        },
      ),
    );
  }
}
