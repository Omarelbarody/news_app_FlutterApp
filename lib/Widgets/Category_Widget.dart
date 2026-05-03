import 'package:flutter/material.dart';
import 'package:news_app/Models/Category_Model.dart';
import 'package:news_app/view/Category_View.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return CategoryView(category: category.categoryname);
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(category.image),
            ),
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
          child: Center(
            child: Text(
              category.categoryname,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
