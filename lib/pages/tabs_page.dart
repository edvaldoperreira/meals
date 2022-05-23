import 'package:flutter/material.dart';
import 'package:meals/pages/categories_page.dart';
import 'package:meals/pages/favorites_page.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Let's Cook!")),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.food_bank),
                text: "Dishes",
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: "Favorites",
              )
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoriesPage(),
            FavoritesPage(),
          ],
        ),
      ),
    );
  }
}
