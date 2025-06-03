

import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {


  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
      style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      width: 300,
      height: 250,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover
              ),
            ),
            _createSectionTitle(context, 'Ingredientes'),
            _createSectionContainer(
              ListView.builder(
              itemCount: meal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).colorScheme.secondary, // substitui accentColor
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(meal.ingredients[index]),
                    ),
                  );
                }
              ),
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              ListView.builder(
              itemCount: meal.steps.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider(),
                    ],
                  );
                }
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(Icons.star),
        onPressed: () {
          Navigator.of(context).pop(meal.title);
        }
      ),
    );
  }
}