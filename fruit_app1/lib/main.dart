import "package:flutter/material.dart";
import "package:fruit_app1/introducion_screens/splash_screen.dart";
import "package:fruit_app1/pages/home_screen_page.dart";
import "package:fruit_app1/introducion_screens/introduction_screens.dart";
import "package:fruit_app1/pages/sample.dart";
import "package:fruit_app1/state_management/state_management.dart";
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StateManagement(),
      child: MaterialApp(
        title: "Fruit App",
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            shadowColor: Colors.black.withOpacity(1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            centerTitle: true,
            elevation: 5,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(201, 229, 252, 1),
          ),
          primaryColor: Color.fromRGBO(239, 201, 252, 1),
          fontFamily: "Montserrat",
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
            bodyMedium: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreenPage(),
      ),
    );
  }
}
