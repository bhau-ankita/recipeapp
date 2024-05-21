import 'package:flutter/material.dart';
import 'package:recipeapp/model.dart';
import 'package:recipeapp/rapiservice.dart';

class RecipeListProvider extends ChangeNotifier {
  List<RecipeModel> _recipeList = [];
  bool _isLoading = false;
  TextEditingController searchController = TextEditingController();

  List<RecipeModel> get recipeList => _recipeList;
  bool get isLoading => _isLoading;

  void fetchRecipes() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<RecipeModel> recipes =
          await ApiService().fetchRecipes(searchController.text);
      _recipeList = recipes;
    } catch (e) {
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
