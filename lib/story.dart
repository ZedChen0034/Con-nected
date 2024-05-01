import 'package:con_nected/GridItems/StoryGridItem.dart';
import 'package:flutter/material.dart';
import 'dialog.dart' as dialog;
import 'dart:math' as math;

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  List<StoryGridItem> myItems = StoryGridItem.storyList;
  List<StoryGridItem> likedStories = StoryGridItem.likedStories;
  bool _isSearching = false;
  List<StoryGridItem> _filteredItems = [];

  final TextEditingController _searchController = TextEditingController();

  //dialog variable
  int point = 0;
  double slope = 0.5;
  double height = 100;
  double top = 0;
  double noteTop = 40;
  double angle = math.pi;
  String noteText = "Text";

  @override
  void initState() {
    super.initState();
    dialog.visible = false;
    _filteredItems = myItems;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      String searchText = _searchController.text.toLowerCase();
      if (searchText.isEmpty) {
        _filteredItems = myItems;
      } else {
        _filteredItems = myItems
            .where((item) =>
        item.tag.toLowerCase().contains(searchText) ||
            item.title.toLowerCase().contains(searchText) ||
            item.content.toLowerCase().contains(searchText))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: _isSearching
            ? TextField(
          controller: _searchController,
          autofocus: true,
          style: TextStyle(color: Colors.grey[700]),
          decoration: const InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        )
            : Text("Story Telling", style: TextStyle(color: Colors.grey[800])),
        leading: IconButton(
          onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
              if (!_isSearching) {
                _searchController.clear();
              }
            });
          },
          icon: Icon(_isSearching ? Icons.close : Icons.search_outlined, color: Colors.grey[600]),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.grey[600]),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Welcome to the Story Page"),
                    content: Text("Explore various narratives and dive deep into the storytelling experience."),
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
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: <Widget>[
          ListView.separated(
            itemCount: _filteredItems.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.0),
            itemBuilder: (context, index) {
              StoryGridItem item = _filteredItems[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300]!,
                      blurRadius: 5,
                      offset: Offset(0, 3), // Shadow position
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800])),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(item.tag,
                                      style:
                                          TextStyle(color: Colors.blue[700])),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onLongPress: () {
                                        setState(() {
                                          dialog.visible = true;
                                          point = 4;
                                          slope = 0.8;
                                          height = 100;
                                          top = 0;
                                          noteTop = 15;
                                          angle = 0;
                                          noteText =
                                              "Remember to ask Felix for message.";
                                        });
                                      },
                                      child: IconButton(
                                        icon: Icon(item.liked
                                            ? Icons.favorite
                                            : Icons.favorite_border),
                                        color: item.liked
                                            ? Colors.red
                                            : Colors.grey,
                                        onPressed: () {
                                          setState(() {
                                            item.liked = !item.liked;
                                            if (item.liked) {
                                              likedStories.add(item);
                                            } else {
                                              likedStories.remove(item);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    //暂时隐藏了，不能热更新，需修复
                                    // Text(item.like,
                                    //     style:
                                    //         TextStyle(color: Colors.grey[700]))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
    );
  }
}
