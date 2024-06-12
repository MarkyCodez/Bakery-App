import 'package:flutter/material.dart';
import 'package:fruit_app1/introducion_screens/intro_screen1.dart';
import 'package:fruit_app1/introducion_screens/intro_screen2.dart';
import 'package:fruit_app1/introducion_screens/intro_screen3.dart';
import 'package:fruit_app1/pages/home_screen_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Widget> _pages = [
    IntroScreen1(
      text: "Welcome to our \n    Bakery App",
      animation: "assets/animations/Animation - 1715020555179.json",
    ),
    IntroScreen2(
      text: "Let's Contine..",
      animation: "assets/animations/Animation - 1715020581847.json",
    ),
    IntroScreen3(
      text: "Welcome",
      animation: "assets/animations/Animation - 1715020671181.json",
    ),
  ];
  late int page_index;
  PageController _controller = PageController();
  @override
  void initState() {
    super.initState();
    setState(() {
      page_index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              page_index = index;
            });
          },
          controller: _controller,
          children: [
            _pages[0],
            _pages[1],
            _pages[2],
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                page_index == 0
                    ? ElevatedButton.icon(
                        onPressed: () async {
                          await Future.delayed(
                            Duration(milliseconds: 400),
                          );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeScreenPage();
                              },
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                        ),
                        label: Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                        ),
                      )
                    : ElevatedButton.icon(
                        onPressed: () async {
                          await Future.delayed(
                            Duration(milliseconds: 400),
                          );
                          _controller.jumpToPage(page_index - 1);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                        ),
                        label: Text(
                          "Back",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                        ),
                      ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: WormEffect(
                      spacing: 10,
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Colors.white,
                      type: WormType.normal),
                ),
                page_index == 2
                    ? ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeScreenPage();
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Done ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Next ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 3,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
