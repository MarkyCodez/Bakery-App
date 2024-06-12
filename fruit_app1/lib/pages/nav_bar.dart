import 'package:flutter/material.dart';
import 'package:fruit_app1/pages/home_screen_page.dart';
import 'package:fruit_app1/pages/items.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [HomeScreenPage(), items()];
    int select_index = 0;
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: Color.fromRGBO(201, 229, 252, 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: GNav(
          selectedIndex: select_index,
          onTabChange: (index) {
            setState(
              () {
                select_index = index;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return pages[select_index];
                    },
                  ),
                );
              },
            );
          },
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          curve: Curves.easeIn,
          padding: EdgeInsets.all(8),
          tabBackgroundColor: Colors.white,
          gap: 10,
          color: Colors.black45,
          activeColor: Colors.black,
          tabs: [
            GButton(
              icon: Icons.home,
              iconSize: 29,
              text: "Home",
            ),
            GButton(
              icon: Icons.shopping_bag,
              iconSize: 29,
              text: "Cart",
            ),
          ],
        ),
      ),
    );
  }
}
