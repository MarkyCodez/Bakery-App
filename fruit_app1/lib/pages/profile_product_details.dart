import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_app1/pages/items.dart';
import 'package:fruit_app1/pages/more_items.dart';
import 'package:fruit_app1/pages/nav_bar.dart';
import 'package:fruit_app1/state_management/state_management.dart';
import 'package:provider/provider.dart';

class ProfileProductDetails extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProfileProductDetails({super.key, required this.product});
  @override
  State<ProfileProductDetails> createState() => _ProfileProductDetails();
}

class _ProfileProductDetails extends State<ProfileProductDetails> {
  late String value_4;
  @override
  void initState() {
    super.initState();
    value_4 = "asd";
  }

  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
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
                      value_4 = widget.product["name"];
                    });
                  },
                  child: Container(
                    height: 300,
                    width: pageWidth * 0.87,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400.withOpacity(0.7),
                            spreadRadius: 4,
                            blurRadius: 10),
                      ],
                      color: value_4 == widget.product["name"]
                          ? Color.fromRGBO(201, 229, 252, 1)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: value_4 == widget.product["name"]
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                child: Image.asset(
                                  widget.product["image"] as String,
                                  height: 280,
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                widget.product["image"] as String,
                                height: 240,
                              ),
                            ],
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 7,
                ),
                SizedBox(
                  height: 120,
                  child: Container(
                    width: pageWidth * 0.87,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.7),
                          spreadRadius: 4,
                          blurRadius: 10,
                        ),
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: Color.fromRGBO(201, 229, 252, 1),
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
                                "${widget.product["name"]}",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                "${widget.product["price"]} Rs",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.product["weight"]}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Provider.of<StateManagement>(context,
                                          listen: false)
                                      .addItems(widget.product);
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  Icons.shopping_bag,
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
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.grey.shade400,
                                  elevation: 1,
                                  minimumSize: Size(10, 40),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
