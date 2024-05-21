import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/home1.dart';
import 'package:recipeapp/provider.dart';
import 'package:recipeapp/recipe.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final rp = Provider.of<RecipeListProvider>(context, listen: false);
      rp.searchController.text = "pasta";
      rp.fetchRecipes();
      print(rp.recipeList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Recipe',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_active,
                color: Colors.white,
              ))
        ],
      ),
      body: Consumer<RecipeListProvider>(
        builder: (context, recipeListProvider, _) => Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'What would you like to cook today?',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: recipeListProvider.searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for recipes...',
                          hintStyle: TextStyle(color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade200,
                      ),
                      onPressed: () {
                        recipeListProvider.fetchRecipes();
                      },
                      child: Text(
                        'Search',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: recipeListProvider.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : recipeListProvider.recipeList.isEmpty
                        ? Center(
                            child: Text(
                            'No recipes found',
                            style: TextStyle(color: Colors.white),
                          ))
                        : ListView.builder(
                            itemCount: recipeListProvider.recipeList.length,
                            itemBuilder: (context, index) {
                              return RecipeCard(
                                recipe: recipeListProvider.recipeList[index],
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
