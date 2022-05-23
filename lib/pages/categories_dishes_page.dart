import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

import '../components/dish_item.dart';
import '../data/dummy_data.dart';

class CategoriesDishesPage extends StatelessWidget {
  const CategoriesDishesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryDishes = dummyDishes.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.title}'s recipes"),
      ),
      body: ListView.builder(
          itemCount: categoryDishes.length,
          itemBuilder: (ctx, index) {
            return DishItem(categoryDishes[index]);
          }),
    );
  }
}
