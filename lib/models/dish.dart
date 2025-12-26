class Dish {
  final String name;
  final String description;
  final String image;
  final String category; // Starter, Main Course, Dessert, Sides
  final bool isVeg;
  final List<Map<String, String>> ingredients;

  bool isSelected;

  Dish({
    required this.name,
    required this.description,
    required this.image,
    required this.category,
    required this.isVeg,
    required this.ingredients,
    this.isSelected = false,
  });
}
