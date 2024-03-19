import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the get package
import 'package:shine/pages/HomeScreen/Item.dart';
import 'package:shine/data/item_on_front_page.dart';
import 'package:shine/product_page.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({Key? key}) : super(key: key);

  @override
  State<MostPopular> createState() => _MostPopularState();
}

class _MostPopularState extends State<MostPopular> {
  List<MyProduct> cart = [];

  @override
  void initState() {
    super.initState();
    Get.put(ProductController()); // Instantiate ProductController using Get.put
  }

  void addToCart(MyProduct product) {
    setState(() {
      cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Most Popular",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              TextButton(
                child: Text(
                  "see all",
                  style: TextStyle(fontSize: 16, color: Color(0XFF6055D8)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(addToCart: addToCart),
                    ),
                  );
                },
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: mostpopular.entries
                  .map((MapEntry<String, List<dynamic>> entry) {
                String key = entry.key;
                List<dynamic> value = entry.value;
                return Row(
                  children: [
                    Item(value[0], key, value[1]),
                    const SizedBox(width: 16.0), // Adjust the width as needed
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp( // Use GetMaterialApp instead of MaterialApp
    debugShowCheckedModeBanner: false,
    home: MostPopular(),
  ));
}