import 'package:flutter/material.dart';
import 'package:newsapp_cw1_pb/features/category/presentation/widgets/category_card.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  static const List<Widget> categories = [
    CategoryCard(categoryName: "Business", categoryIcon: Icons.business),
    CategoryCard(categoryName: "General", categoryIcon: Icons.question_answer),
    CategoryCard(categoryName: "Health", categoryIcon: Icons.health_and_safety),
    CategoryCard(categoryName: "Science", categoryIcon: Icons.science),
    CategoryCard(categoryName: "Sports", categoryIcon: Icons.sports),
    CategoryCard(categoryName: "Technology", categoryIcon: Icons.computer),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
      children: categories,
    );
  }
}
