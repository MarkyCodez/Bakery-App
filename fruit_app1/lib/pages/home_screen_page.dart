import "package:flutter/material.dart";
import "package:fruit_app1/pages/grid_of_fruits.dart";
import "package:fruit_app1/pages/nav_bar.dart";
import "package:fruit_app1/pages/profile_slider.dart";
import "package:fruit_app1/pages/search_tabs.dart";

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});
  @override
  State<HomeScreenPage> createState() => _HomeScreenPage();
}

class _HomeScreenPage extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: NavBar(),
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home, size: 27),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 35,
              ),
              Container(
                height: 45,
                width: size * 0.85,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    suffixIcon: Container(
                      width: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IntrinsicHeight(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.segment_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              SearchTabs(),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Delicious Cakes",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ProfileSlider(),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Popular Products",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridOfFruits(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
