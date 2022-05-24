import 'package:flutter/material.dart';

import '../models/dish.dart';

class DishDetailPage extends StatelessWidget {
  const DishDetailPage({Key? key}) : super(key: key);

  Widget _getSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _getSectionContent(Widget child) {
    return Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        height: 250,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final dish = ModalRoute.of(context)!.settings.arguments as Dish;

    return Scaffold(
      appBar: AppBar(
        title: Text(dish.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                dish.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _getSectionTitle(context, "Ingredients"),
            _getSectionContent(ListView.builder(
              itemCount: dish.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(dish.ingredients[index]),
                  ),
                );
              },
            )),
            _getSectionTitle(context, "Steps"),
            _getSectionContent(ListView.builder(
              itemCount: dish.steps.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(
                          dish.steps[index],
                          style: const TextStyle(fontSize: 15),
                        )),
                    const Divider()
                  ],
                );
              },
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          Navigator.of(context).pop(dish.title);
        },
      ),
    );
  }
}
