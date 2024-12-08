import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData categoryIcon;
  const CategoryCard(
      {super.key, required this.categoryName, required this.categoryIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .pushNamed('category', pathParameters: {'category': categoryName}),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categoryIcon),
              const SizedBox(height: 8),
              Text(categoryName),
            ],
          ),
        ),
      ),
    );
  }
}
