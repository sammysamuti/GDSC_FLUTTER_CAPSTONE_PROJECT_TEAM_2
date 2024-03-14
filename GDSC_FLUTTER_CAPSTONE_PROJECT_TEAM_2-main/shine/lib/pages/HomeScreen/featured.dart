import 'package:flutter/material.dart';
import 'package:shine/pages/HomeScreen/Item.dart';
import 'package:shine/data/item_on_front_page.dart';

class FeaturedPart extends StatelessWidget {
  const FeaturedPart({super.key});

  @override
  Widget build(BuildContext context) { 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                "see all",
                style: TextStyle(fontSize: 16, color: Color(0XFF6055D8)),
              )
            ],
          ),
         
      SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: featured.entries.map((MapEntry<String, List<dynamic>> entry) {
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
)

                
        ],
      ),
    );
  }
}
