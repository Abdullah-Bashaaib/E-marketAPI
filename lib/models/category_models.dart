class CategoryModel {
  String? slug, name, url;

  CategoryModel({required this.slug, required this.name, required this.url});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        slug: json['slug'], name: json['name'], url: json['url']);
  }
}
