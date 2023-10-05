import 'package:con_nected/CustomMasonryGridView.dart';
import 'package:con_nected/GridItem.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {

  List<GridItem> myItems = [
    GridItem(imagePath: 'images/pig.png',title:"Ep 2: The Cell The Secret Life of Prisons",tag: "Relationships",like: "23"),
    GridItem(imagePath: 'images/bean.jpg',title:"After Prison: Jarrad's Story CRC",tag: "Arrest",like: "23"),
    GridItem(imagePath: 'images/pi1.jpg',title:"Ep 1: Making HERstory Bird's Eye View",tag: "Music",like: "23"),
    GridItem(imagePath: 'images/pi2.jpg',title:"Cellies Ear Hustle",tag: "Prison Life",like: "23"),
    GridItem(imagePath: 'images/pig.png',title:"adafafsdffsfafaafwadafafsdffsfafaafw",tag: "Survival",like: "23"),
    GridItem(imagePath: 'images/bean.jpg',title:"adafafsdffsfafaafwadafafsdffsfafaafw",tag: "Survival",like: "23"),
    GridItem(imagePath: 'images/pi1.jpg', title:"adafafsdffsfafaafwadafafsdffsfafaafw",tag: "Survival",like: "23"),
    GridItem(imagePath: 'images/pi2.jpg', title:"a",tag: "Survival",like: "23"),
    GridItem(imagePath: 'images/pig.png', title:"a",tag: "Survival",like: "23"),
    GridItem(imagePath: 'images/bean.jpg',title:"a",tag: "Survival",like: "23"),
    GridItem(imagePath: 'images/pi1.jpg', title:"a",tag: "Survival",like: "23"),
    GridItem(imagePath: 'images/pi2.jpg', title:"a",tag: "Survival",like: "23"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMasonryGridView(items: myItems),
    );
  }
}
