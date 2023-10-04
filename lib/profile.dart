import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  TabController? _tabController;

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
                    Tab(text: 'Favorites'),
                    Tab(text: 'Watch Later'),
                    Tab(text: 'Watch Later'),
                    Tab(text: 'Watch Later'),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildGridView(),
                      _buildGridView(),
                      _buildGridView(),
                      _buildGridView(),
                      _buildGridView(),
                    ],
                  ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8.0,  // Spacing between columns
        mainAxisSpacing: 2.0,  // Spacing between rows
      ),
      itemBuilder: (context, index) {
        return _buildGridItem();
      },
    );
  }

  Widget _buildGridItem() {
    return Column(
      children: [
        // You can replace the below image with any asset or network image.
        Image.asset('images/pig.png', fit: BoxFit.cover),
        const SizedBox(height: 8.0),
        const Text('Some description here'),
      ],
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
