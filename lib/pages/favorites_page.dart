import 'package:flutter/material.dart';

import '../components/dish_item.dart';
import '../models/dish.dart';

class FavoritesPage extends StatelessWidget {
  final List<Dish> favoriteDishes;

  const FavoritesPage(this.favoriteDishes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteDishes.isEmpty
        ? const Center(
            child: Text("There is not favorite yet!"),
          )
        : ListView.builder(
            itemCount: favoriteDishes.length,
            itemBuilder: (ctx, index) {
              return DishItem(favoriteDishes[index]);
            });
  }
}
