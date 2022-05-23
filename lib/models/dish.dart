enum Complexity { simple, medium, difficult }

enum Cost { cheap, fair, expensive }

class Dish {
  final String id;
  final List<String> categories;
  final String title;
  final Cost cost;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Dish(
      {required this.id,
      required this.categories,
      required this.title,
      required this.cost,
      required this.complexity,
      required this.imageUrl,
      required this.duration,
      required this.ingredients,
      required this.steps,
      required this.isGlutenFree,
      required this.isVegan,
      required this.isVegetarian,
      required this.isLactoseFree});

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.medium:
        return "Normal";
      case Complexity.difficult:
        return "Difficult";
      default:
        return "Unknown";
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return "Cheap";
      case Cost.fair:
        return "Fair";
      case Cost.expensive:
        return "Expensive";
      default:
        return "Unknown";
    }
  }
}
