class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? thumbnail;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.thumbnail});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      thumbnail: json['thumbnail'],
    );
  }
}
