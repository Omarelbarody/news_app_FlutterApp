import 'package:flutter/cupertino.dart';

import '../Models/Category_Model.dart';
import 'Category_Widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

 final List<CategoryModel> categories = const [
    CategoryModel(categoryname: "Business", image: "assets/business.png"),
    CategoryModel(categoryname: "Entertainment", image: "assets/entertaiment.png"),
    CategoryModel(categoryname: "Health", image: "assets/health.png"),
    CategoryModel(categoryname: "Science", image: "assets/science.png"),
    CategoryModel(categoryname: "Sports", image: "assets/sports.png"),
    CategoryModel(categoryname: "Technology", image: "assets/technology.png"),
   CategoryModel(categoryname: "General", image: "assets/general.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryWidget(category: categories[index]);
        },
      ),
    );
  }
}
