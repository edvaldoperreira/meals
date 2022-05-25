import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/dish.dart';
import 'categories_page.dart';
import 'favorites_page.dart';

class TabsPage extends StatefulWidget {
  final List<Dish> favoriteDishes;
  const TabsPage(this.favoriteDishes, {Key? key}) : super(key: key);

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedTabIndex = 0;
  List<Map<String, Object>> _pages = [];

  @override
  initState() {
    super.initState();
    _pages = [
      {'title': 'Dishes' ' Category', 'Page': const CategoriesPage()},
      {'title': 'My Favorites', 'Page': FavoritesPage(widget.favoriteDishes)},
    ];
  }

  _selectPage(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text(_pages[_selectedTabIndex]['title'] as String)),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedTabIndex]['Page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedTabIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: "Let's Cook!",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          )
        ],
      ),
    );

    //* Tab Navigation - TOP *//
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Center(child: Text("Let's Cook!")),
    //       bottom: const TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.food_bank),
    //             text: "Dishes",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //             text: "Favorites",
    //           )
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         CategoriesPage(),
    //         FavoritesPage(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
