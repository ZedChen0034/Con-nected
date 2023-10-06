import 'package:con_nected/CustomMasonryGridView.dart';
import 'package:con_nected/GridItem.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {

  List<GridItem> myItems = GridItem.storyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMasonryGridView(items: myItems,
        onLikeToggle: (index) {
          setState(() {
            myItems[index].liked = !(myItems[index].liked ?? false);
          });
        },),
    );
  }
}
