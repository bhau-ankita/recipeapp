import 'dart:convert';

class RecipedetailModel {
  String label;
  String image;
  String source;
  String url;
  List<String> ingredients;
  double calories;

  RecipedetailModel({
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.ingredients,
    required this.calories,
  });

  RecipedetailModel copyWith({
    String? label,
    String? image,
    String? source,
    String? url,
    List<String>? ingredients,
    double? calories,
  }) =>
      RecipedetailModel(
        label: label ?? this.label,
        image: image ?? this.image,
        source: source ?? this.source,
        url: url ?? this.url,
        ingredients: ingredients ?? this.ingredients,
        calories: calories ?? this.calories,
      );

  factory RecipedetailModel.fromRawJson(String str) =>
      RecipedetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RecipedetailModel.fromJson(Map<String, dynamic> json) =>
      RecipedetailModel(
        label: json["label"],
        image: json["image"],
        source: json["source"],
        url: json["url"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        calories: json["calories"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "image": image,
        "source": source,
        "url": url,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "calories": calories,
      };
}
