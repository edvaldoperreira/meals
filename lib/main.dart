import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/settings.dart';
import 'models/dish.dart';
import 'pages/categories_dishes_page.dart';
import 'pages/categories_page.dart';
import 'pages/dish_detail_page.dart';
import 'pages/settings_page.dart';
import 'pages/tabs_page.dart';
import 'utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Dish> _availableDishes = dummyDishes;
  List<Dish> _favoriteDishes = [];
  Settings settings = Settings();

  void fillAvailableDishes(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableDishes = dummyDishes.where((dish) {
        final gluten = settings.isGlutenFree && !dish.isGlutenFree;
        final lactose = settings.isLactoseFree && !dish.isLactoseFree;
        final vegan = settings.isVegan && !dish.isVegan;
        final vegetarian = settings.isVegetarian && !dish.isVegetarian;
        return !gluten && !lactose && !vegan && !vegetarian;
      }).toList();
    });
  }

  void toggleFavorite(Dish dish) {
    setState(() {
      _favoriteDishes.contains(dish)
          ? _favoriteDishes.remove(dish)
          : _favoriteDishes.add(dish);
    });
  }

  bool isFavorite(Dish dish) {
    return _favoriteDishes.contains(dish);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lets Cook!',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
                titleMedium: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
                titleSmall: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      //home: const CategoriesPage(),
      //initialRoute: '/',
      routes: {
        AppRoutes.home: (context) => TabsPage(_favoriteDishes),
        AppRoutes.categoriesDishes: (context) =>
            CategoriesDishesPage(_availableDishes),
        AppRoutes.dishDetail: (context) =>
            DishDetailPage(toggleFavorite, isFavorite),
        AppRoutes.settings: (context) =>
            SettingsPage(fillAvailableDishes, settings)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) {
          return const CategoriesPage();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliDishes'),
      ),
      body: const Center(
        child: Text('Navegar é preciso!!'),
      ),
    );
  }
}
