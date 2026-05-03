import 'package:flutter/material.dart';
import '../Widgets/Category_List_View.dart';
import '../Widgets/News_ListView_Builder.dart';
import '../Widgets/News_Tile_List_View.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: CategoryListView()),
          NewsListViewBuilder(
            category: "general",
          ),
        ],
      ),


      // Column(
      //   children: [
      //      CategoryListView(),
      //     Expanded(child: NewsTileListView()),
      //   ],
      // )
    );
  }
}



