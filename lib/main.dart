import 'package:flutter/material.dart';
import 'package:meals/screens/settings_screen.dart';
import 'screens/tabs_screen.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import '../utils/app_routes.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../models/settings.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Settings settings = Settings();
  
  List<Meal> _avaiableMeals = dummyMeals;

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avaiableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        primarySwatch: Colors.pink,
        colorScheme: ThemeData.light().colorScheme.copyWith(
          primary: Colors.pink,
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
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(_avaiableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
        // AppRoutes.FAVORITES_MEALS: (ctx) => TabsScreen();
      },
      // onGenerateRoute: (settings) {
      //   if(settings.name == 'alguma-rota') {
      //     return null;
      //   } else if (settings.name == 'outra-rota') {
      //     return null;
      //   } else {
      //     return MaterialPageRoute(
      //       builder: (_) {
      //         return CategoriesScreen(); // home
      //       }
      //     );
      //   }
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       return CategoriesMealsScreen(); // home // colocar uma mensagem de erro 404 NOT FOUND
      //     }
      //   );
      // },
    );
  }
}