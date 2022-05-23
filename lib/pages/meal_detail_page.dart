import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleMedium,
              )),
          Container(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return Card(
                  child: Text(meal.ingredients[index]),
                );
              }),
              itemCount: meal.ingredients.length,
            ),
          )
        ],
      ),
    );
  }
}
