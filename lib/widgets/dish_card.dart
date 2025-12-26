import 'package:flutter/material.dart';
import '../models/dish.dart';
import '../screens/ingredient_screen.dart';

class DishCard extends StatelessWidget {
  final Dish dish;
  final VoidCallback onToggle;

  const DishCard({super.key, required this.dish, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(dish.image, width: 50),
        title: Text(dish.name),
        subtitle: Text(dish.description),
        trailing: IconButton(
          icon: Icon(
            dish.isSelected ? Icons.remove_circle : Icons.add_circle,
            color: dish.isSelected ? Colors.red : Colors.green,
          ),
          onPressed: () {
            dish.isSelected = !dish.isSelected;
            onToggle();
          },
        ),
      ),
    );
  }
}
