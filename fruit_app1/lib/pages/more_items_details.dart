import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruit_app1/pages/more_items.dart';
import 'package:fruit_app1/pages/nav_bar.dart';
import 'package:fruit_app1/state_management/state_management.dart';
import 'package:provider/provider.dart';

class MoreItemsDetails extends StatefulWidget {
  final Map<String, dynamic> popular1;
  const MoreItemsDetails({super.key, required this.popular1});

  @override
  State<MoreItemsDetails> createState() => _PopularProductsDetailsState();
}

class _PopularProductsDetailsState extends State<MoreItemsDetails> {
  late String value_7;
  @override
  void initState() {
    super.initState();
    value_7 = "";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 27.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      value_7 = widget.popular1["name"];
                    });
                  },
                  child: Container(
                    height: 300,
                    width: size * 0.87,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.7),
                          spreadRadius: 4,
                          blurRadius: 10,
                        ),
                      ],
                      color: value_7 == widget.popular1["name"]
                          ? Color.fromRGBO(201, 229, 252, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: value_7 == widget.popular1["name"]
                        ? Column(
                            children: [
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                child: Image.asset(
                                  widget.popular1["image"],
                                  height: 280,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Image.asset(
                                widget.popular1["image"],
                                height: 240,
                              ),
                            ],
                          ),
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                Container(
                  height: 126,
                  width: size * 0.87,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400.withOpacity(0.7),
                        spreadRadius: 4,
                        blurRadius: 10,
                      ),
                    ],
                    color: Color.fromRGBO(201, 229, 252, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.popular1["name"],
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "${widget.popular1["price"]} Rs",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.popular1["weight"]),
                            ElevatedButton.icon(
                              onPressed: () {
                                Provider.of<StateManagement>(context,
                                        listen: false)
                                    .addItems(widget.popular1);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    content: Container(
                                      padding: EdgeInsets.all(16),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400
                                                .withOpacity(0.7),
                                            blurRadius: 10,
                                            spreadRadius: 4,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Added Successfully",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          Icon(Icons.check),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.shopping_bag_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                              label: Text(
                                "Add to Cart",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                minimumSize: Size(40, 40),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MoreItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
