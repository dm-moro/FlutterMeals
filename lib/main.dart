import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import '../utils/app_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ThemeData.light().colorScheme.copyWith(
          secondary: Colors.amber,
        ),
        fontFamily: 'Raleway',
        canvasColor: Color.from(alpha: 255, red: 254 , green: 229, blue: 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}