import 'package:flutter/material.dart';
import '../models/food_list.dart';
import 'food_detail_page.dart';

class FoodListPage extends StatefulWidget {
  final String username;

  const FoodListPage({super.key, required this.username});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
  //State<FoodListPage> createState() => _Pesan
}

class _FoodListPageState extends State<FoodListPage> {
  List<bool> bookmarked = List.generate(foodList.length, (index) => false);
  /*void _pesan(){

  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Welcome, ${widget.username}!",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: foodList.length,
                itemBuilder: (context, index) {

                  FoodModel movie = foodList[index];

                  return foodCard(context, movie, index);
                },
              ),
            ),
            //_buttonPesan()
          ],
        ),
      ),
    );
  }

  Widget foodCard(BuildContext context, FoodModel food, int index) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FoodDetailPage(food: food),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        children: [

          Image.network(
            food.image,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "${food.name}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(
                  "${food.category}",
                  ),

              const SizedBox(height: 5),

              const SizedBox(height: 15),

              const SizedBox(height: 15),

            SizedBox(
                    width: 500,
                    child: ElevatedButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text("Sedang Memesan")
                              ),
                          );
                        },
                      child: const Text("Pesan"),
                    ),
                  ),
                ],
            ),
                  
            ),
        ],
      ),
    ),
  );
}

/*Widget _buttonPesan(){
    
  }*/

}