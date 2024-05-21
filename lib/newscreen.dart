import 'package:flutter/material.dart';
import 'package:recipeapp/model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeDetailScreen({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          recipe.label ?? 'Recipe Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  recipe.image ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey,
                      child: Icon(Icons.broken_image, size: 50),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                recipe.label ?? 'No Title',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                'Calories: ${recipe.calories?.toStringAsFixed(2) ?? 'N/A'}',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Ingredients:',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              ...?recipe.ingredients
                  ?.map((ingredient) => Text(
                        '- $ingredient',
                        style: TextStyle(color: Colors.white),
                      ))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
