
import 'package:con_nected/CustomMasonryGridView.dart';
import 'package:con_nected/GridItem.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<GridItem> myItems = GridItem.profileList;
  List<GridItem> likedStories = GridItem.likedStories;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF293936),

      body: Stack(
        children: <Widget>[
          Container(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Profile',
                style: TextStyle(color: Colors.white, fontSize: 24.0),
              ),
            ),
          ),
          SlidingUpPanel(
            maxHeight: MediaQuery.of(context).size.height - 80,
            minHeight: MediaQuery.of(context).size.height * 0.5,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            panel: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable:true,
                  tabs: const [
                    Tab(text: 'My Journal',),
                    Tab(text: 'Liked Stories'),
                    Tab(text: 'Watch Later'),
                    Tab(text: 'Watch Later'),
                    Tab(text: 'Watch Later'),
                  ],
                ),
                Expanded(
                 child: Container(
                      color: const Color(0xFFf8f5f7),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            CustomMasonryGridView(items: myItems),
                            CustomMasonryGridView(items: likedStories,
                                onLikeToggle: (String id) {
                                  setState(() {
                                    // Find the item by id
                                    final item = GridItem.storyList.firstWhere((item) => item.id == id);
                                    // Toggle the liked property
                                    item.liked = !(item.liked ?? false);
                                    if (item.liked == false) {
                                      likedStories.remove(item);
                                    }else{
                                      likedStories.add(item);
                                    }
                                  });
                                }),
                            CustomMasonryGridView(items: myItems),
                            CustomMasonryGridView(items: myItems),
                            CustomMasonryGridView(items: myItems),
                          ],
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}


