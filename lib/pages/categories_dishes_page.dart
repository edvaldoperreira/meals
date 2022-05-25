import 'package:flutter/material.dart';
import 'package:meals/models/dish.dart';

import '../components/dish_item.dart';
import '../models/category.dart';

class CategoriesDishesPage extends StatelessWidget {
  List<Dish> dishes;
  CategoriesDishesPage(this.dishes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoryDishes = dishes.where((meal) {
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
