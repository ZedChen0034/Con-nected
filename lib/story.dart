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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMasonryGridView(items: myItems,
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
