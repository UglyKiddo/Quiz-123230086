import 'package:flutter/material.dart';
import '../models/food_list.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodModel food;

  const FoodDetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Details"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Image.network(
              food.image,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "${food.name} (${food.category})",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "${food.price}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                      ),
                    ),

                  Text(
                    "Kalori: ${food.calories}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                      ),
                    ),

                  const SizedBox(height: 10),

                  Text(food.description),

                  const SizedBox(height: 15),

                  Text("Komposisi: ${food.ingredients}", 
                    style: TextStyle(fontWeight: FontWeight.bold),),

                  const SizedBox(height: 5),

                  const SizedBox(height: 20),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Checkout"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}