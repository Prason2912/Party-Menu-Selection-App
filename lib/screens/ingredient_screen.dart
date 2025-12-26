import 'package:flutter/material.dart';
import '../models/dish.dart';

class IngredientScreen extends StatelessWidget {
  final Dish dish;

  const IngredientScreen({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Ingredient List",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
        elevation: 10,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                dish.image,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dish.name
                        ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,),),
                SizedBox(height: 15,),
                Text(dish.description,
                  maxLines: 4, //
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )
              ]
            ),
            SizedBox(height: 30,),

            Text("Ingredients", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700)),
            SizedBox(height: 5,),
            Text("For 2 People", style: TextStyle(fontSize: 14)),
            SizedBox(height: 10,),
            Divider(thickness: 1,),
            const SizedBox(height: 10),



            ...dish.ingredients.map((item) {
              final key = item.keys.first;
              final value = item.values.first;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      key,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
