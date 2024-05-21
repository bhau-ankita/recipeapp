import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipeapp/model.dart';
import 'package:recipeapp/recipedetailmodel.dart';

class ApiService {
  final String appId = '43a9c818';
  final String appKey = 'f7f7a45cd7ef8d588555de241cff1462	';

  Future<List<RecipeModel>> fetchRecipes(String query) async {
    final url =
        "https://api.edamam.com/search?q=$query&app_id=$appId&app_key=$appKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<dynamic> hits = data['hits'];
      return hits.map((hit) => RecipeModel.fromJson(hit)).toList();
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<RecipedetailModel> fetchRecipeDetails(String recipeUri) async {
    final url = Uri.encodeFull(recipeUri);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return RecipedetailModel.fromJson(data);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }
}
