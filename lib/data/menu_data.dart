import '../models/dish.dart';

List<Dish> menuList = [
  Dish(
    name: "Spring Rolls",
    description: "Crispy vegetable spring rolls filled with fresh veggies and spices, "
        "deep fried to golden perfection and served hot.",
    image: "assets/images/spring roll.jpg",
    category: "Starter",
    isVeg: true,
    ingredients: [
      {"Cabbage": "100g"},
      {"Carrot": "50g"},
      {"Oil": "20ml"},
    ],
  ),
  Dish(
    name: "Dal Makhani",
    description:
    "Slow-cooked black lentils in a creamy tomato-based gravy. "
        "Rich, buttery, and full of authentic North Indian flavors.",
    image: "assets/images/dal makhani.jpg",
    category: "Main Course",
    isVeg: true,
    ingredients: [
      {"Black Lentils": "150g"},
      {"Butter": "30g"},
      {"Cream": "50ml"},
    ],
  ),

  Dish(
    name: "Tandoori Chicken",
    description:
    "Juicy chicken marinated in yogurt and traditional Indian spices. "
        "Grilled to perfection with a smoky and spicy flavor.",
    image: "assets/images/tandoori chicken.jpg",
    category: "Starter",
    isVeg: false,
    ingredients: [
      {"Chicken": "500g"},
      {"Yogurt": "100g"},
      {"Spices": "20g"},
    ],
  ),

  Dish(
    name: "Chicken Biryani",
    description: "Fragrant basmati rice cooked with spiced chicken and herbs. "
        "A flavorful and aromatic one-pot meal.",
    image: "assets/images/chiken biryani.jpg",
    category: "Main Course",
    isVeg: false,
    ingredients: [
      {"Rice": "200g"},
      {"Chicken": "250g"},
      {"Spices": "20g"},
    ],
  ),
  Dish(
    name: "Cabbage Stir Fry",
    description:
    "Fresh cabbage sautéed with mild spices and herbs. "
        "A light, healthy, and flavorful side dish.",
    image: "assets/images/cabbage.jpg",
    category: "Sides",
    isVeg: true,
    ingredients: [
      {"Cabbage": "200g"},
      {"Oil": "15ml"},
      {"Spices": "10g"},
    ],
  ),
  Dish(
    name: "Gulab Jamun",
    description: "Soft milk-solid dumplings soaked in warm sugar syrup. "
        "A classic Indian dessert with rich sweetness.",
    image: "assets/images/gulab jamun.jpg",
    category: "Dessert",
    isVeg: true,
    ingredients: [
      {"Milk": "200ml"},
      {"Sugar": "100g"},
    ],
  ),
];
