import "package:flutter/material.dart";
import "package:fruit_app1/data/fruits_data.dart";
import 'dart:math';

import "package:fruit_app1/pages/popular_products_details.dart";

Random r = Random();

class GridOfFruits extends StatefulWidget {
  const GridOfFruits({super.key});
  @override
  State<GridOfFruits> createState() => _GridOfFruits();
}

class _GridOfFruits extends State<GridOfFruits> {
  late String value_2;
  @override
  void initState() {
    super.initState();
    value_2 = "";
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14),
      itemCount: fruits.length,
      itemBuilder: (context, index) {
        final items = fruits[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              value_2 = items["name"];
            });
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return PopularProductsDetails(popular: items);
              }),
            );
          },
          child: Container(
            height: 200,
            width: 120,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400.withOpacity(0.7),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
              color: value_2 == items["name"]
                  ? Color.fromRGBO(201, 229, 252, 1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(items["name"]),
                Text(
                  items["weight"],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Image.asset(
                  items["image"],
                  height: 100,
                  width: 90,
                ),
                Text("${items["price"].toString()} Rs"),
              ],
            ),
          ),
        );
      },
    );
  }
}
