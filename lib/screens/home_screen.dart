import 'package:flutter/material.dart';
import '../data/menu_data.dart';
import '../models/dish.dart';
import '../screens/ingredient_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Widget _vegNonVegSwitch({
  required bool isVeg,
  required bool value,
  required VoidCallback onTap,
}) {
  final Color color = isVeg ? Colors.green : Colors.red;

  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: 52,
      height: 28,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: value ? color : Colors.grey.shade300,
          width: 1.5
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [

          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment:
            value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 36,
              height: 8,
              decoration: BoxDecoration(
                color: value ? color : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),


          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment:
            value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: isVeg ? Colors.green:Colors.red,
                  width: 2,
                ),
              ),
              child: Center(
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: isVeg ? Colors.green:Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


class _HomeScreenState extends State<HomeScreen> {

  int selectedCategoryIndex = 0;
  String searchText = "";
  bool showVeg = true;
  bool showNonVeg = true;

  final categories = ["Starter", "Main Course", "Dessert", "Sides"];

  List<Dish> getFilteredDishes() {
    return menuList.where((dish) {
      if (searchText.isNotEmpty) {
        if (!dish.name.toLowerCase().contains(searchText.toLowerCase())) {
          return false;
        }
      } else {
        if (dish.category != categories[selectedCategoryIndex]) {
          return false;
        }
      }
      if (!showVeg && !showNonVeg) return true;
      if (dish.isVeg && !showVeg) return false;
      if (!dish.isVeg && !showNonVeg) return false;

      return false;
    }).toList();
  }

  int selectedCount(String category) {
    return menuList
        .where((d) => d.category == category && d.isSelected)
        .length;
  }

  int totalSelected() {
    return menuList.where((d) => d.isSelected).length;
  }

  @override
  Widget build(BuildContext context) {
    final dishes = getFilteredDishes();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 16),
            _buildCategoryTabs(),
            const SizedBox(height: 16),
            _buildCourseHeader(),
            const SizedBox(height: 16),
            Expanded(child: _buildDishList(dishes)),
            _buildBottomSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey)
        ),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios, size: 18),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Search dish for your party.....",
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() => searchText = value);
                },
              ),
            ),
            const Icon(Icons.search_outlined, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(categories.length, (index) {
          final category = categories[index];
          final isSelected = selectedCategoryIndex == index;
          final count = selectedCount(category);

          return GestureDetector(
            onTap: () {
              setState(() => selectedCategoryIndex = index);
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? Colors.orange : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.grey,
                ),
              ),
              child: Text(
                "$category ($count)",
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black, // 👈 text color
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCourseHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${categories[selectedCategoryIndex]} Selected (${totalSelected()})",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            children: [
              const SizedBox(width: 6),
              _vegNonVegSwitch(
                isVeg: true,
                value: showVeg,
                onTap: () {
                  setState(() => showVeg = !showVeg);
                },
              ),




              const SizedBox(width: 6),
              _vegNonVegSwitch(
                isVeg: false,
                value: showNonVeg,
                onTap: () {
                  setState(() => showNonVeg = !showNonVeg);
                },
              ),
            ],
          ),
        ],
      ),
      Text(
            "North Indian",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
        ],
      ),

    );
  }


  Widget _buildDishList(List<Dish> dishes) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        final dish = dishes[index];

        return GestureDetector(
          onTap: (){
            _openMealBottomSheet(dish);
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            dish.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width:8,),
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color:
                                dish.isVeg ? Colors.green : Colors.red,
                              ),
                            ),
                            child: Center(
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: dish.isVeg
                                      ? Colors.green
                                      : Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        dish.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Read more",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => IngredientScreen(dish: dish),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Row(
                            children: [
                              Icon(
                                Icons.receipt_long,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 5,),
                              Text(
                                "Ingredients",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                SizedBox(
                  width: 110,
                  height: 130,
                  child: Stack(
                    clipBehavior: Clip.none, //
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(dish.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: -0.5, //
                        left: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() => dish.isSelected = !dish.isSelected);
                          },
                          child: Center(
                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [BoxShadow(
                                  color: Colors.black.withOpacity(0.15), // shadow color
                                  blurRadius: 6,  // softness
                                  offset: Offset(0, 3), // position (x, y)
                                )]

                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,

                                children: [
                                  Text(
                                    dish.isSelected ? "Remove" : "Add",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: dish.isSelected ? Colors.orange : Colors.green,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (!dish.isSelected)
                                    Icon(
                                      Icons.add,
                                      size: 16,
                                      color: Colors.green,
                                    ),

                                  if (!dish.isSelected)
                                    const SizedBox(width: 6),
                                ],
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  Widget _buildBottomSummary() {
    return Column(
      children: [
        Container(

          padding:
          const EdgeInsets.only(top: 10, left: 16, right: 16, bottom: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFAF4),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 8,
                offset: const Offset(0, -2), // 👈 shadow upwards
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Dish Selected ${totalSelected()}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              const Icon(Icons.arrow_forward_ios_outlined, size: 16),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12,right: 12,bottom: 10),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 45),
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }


  void _openMealBottomSheet(Dish dish) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(dish.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    dish.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width:8,),
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color:
                        dish.isVeg ? Colors.green : Colors.red,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: dish.isVeg
                              ? Colors.green
                              : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                 const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() => dish.isSelected = !dish.isSelected);
                    },
                    child: Center(
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [BoxShadow(
                              color: Colors.black.withOpacity(0.15), // shadow color
                              blurRadius: 6,  // softness
                              offset: Offset(0, 3), // position (x, y)
                            )]

                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,

                          children: [
                            Text(
                              dish.isSelected ? "Remove" : "Add",
                              style: TextStyle(
                                fontSize: 16,
                                color: dish.isSelected ? Colors.orange : Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (!dish.isSelected)
                              Icon(
                                Icons.add,
                                size: 16,
                                color: Colors.green,
                              ),

                            if (!dish.isSelected)
                              const SizedBox(width: 6),
                          ],
                        ),

                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 16),
              Text(
                dish.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7E7E7E),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => IngredientScreen(dish: dish),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Icon(Icons.receipt_long, color: Colors.orange),
                    SizedBox(width: 8),
                    Text(
                      "View Ingredients",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        );
      },
    );
  }
}
