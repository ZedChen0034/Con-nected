import 'package:con_nected/GridItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomMasonryGridView extends StatelessWidget {
  final List<GridItem> items;
  final void Function(String index)? onLikeToggle;

  CustomMasonryGridView({super.key, required this.items, this.onLikeToggle});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(items[index].imagePath, fit: BoxFit.cover),
              const SizedBox(height: 6),
              Text(
                items[index].title,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              if (items[index].tag != null &&
                  items[index].tag!.isNotEmpty &&
                  items[index].like != null &&
                  items[index].like!.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(items[index].tag!),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (onLikeToggle != null) {
                              onLikeToggle!(items[index].id);
                            }
                          },
                          child: Icon(
                            items[index].liked ?? false ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(items[index].like!),
                      ],
                    ),
                  ],
                ),
              if (items[index].description != null &&
                  items[index].description!.isNotEmpty)
                Text(
                  items[index].description!,
                  textAlign: TextAlign.start,
                ),
            ],
          ),
        );
      },
    );
  }
}
