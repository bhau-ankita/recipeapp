class RecipeModel {
  String? label;
  String? image;
  double? calories;
  String? url;
  List<String>? ingredients;

  RecipeModel(
      {this.label, this.image, this.calories, this.url, this.ingredients});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      label: json['recipe']['label'],
      image: json['recipe']['image'],
      calories: json['recipe']['calories'],
      url: json['recipe']['url'],
      ingredients: (json['recipe']['ingredientLines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }
}
