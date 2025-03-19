class Product {
  final String id;
  final String name;
  final String image;
  final String description;
  final String brand;
  final num price;
  final List<String> catagories;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.brand,
      required this.price,
      required this.catagories,
      required this.description});
  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"] ?? "",
        image: json["image"],
        brand: json["brand"] ?? "",
        description: json["description"] ?? "",
        price: json["price"],
        catagories:
            List.from(json["catagories"]).map((x) => x.toString()).toList(),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "brand": brand,
        "description": description,
        "price": price,
        "catagories": catagories,
      };
}
