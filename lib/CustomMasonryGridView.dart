import 'package:con_nected/GridItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomMasonryGridView extends StatelessWidget {
  final List<GridItem> items;

  CustomMasonryGridView({required this.items});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Image.asset(items[index].imagePath, fit: BoxFit.cover),
              Container(
                width: double.infinity,
                child: Text(
                  items[index].title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  items[index].description,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
