class ProductModel {
  String? name;
  String? coffeeImg;
  int? coffeePrice;
  String? id;
  String? category;
  String? description;
  List<String>? favorite; // Changed to List<String> to store user IDs

  ProductModel({
    this.name,
    this.coffeeImg,
    this.coffeePrice,
    this.id,
    this.category,
    this.description,
    this.favorite,
  });

  // Factory method to create a ProductModel from a JSON map
  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coffeeImg = json['coffee_img'];
    coffeePrice = json['coffee_price'];
    id = json['id'];
    category = json['category'];
    description = json['description'];
    favorite = List<String>.from(
        json['favorite'] ?? []); // Corrected assignment for favorite
  }

  // Method to convert the ProductModel to JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['coffee_img'] = coffeeImg;
    data['coffee_price'] = coffeePrice;
    data['id'] = id;
    data['category'] = category;
    data['description'] = description;
    data['favorite'] = favorite; // Added favorite to the toJson method

    return data;
  }
}
