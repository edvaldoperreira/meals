import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.title}'s recipes"),
      ),
      body: Center(
          child: Text(
        'Recipes by category - ${category.title}',
      )),
    );
  }
}
