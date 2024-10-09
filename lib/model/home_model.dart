class Category {
  String? icedCoffee;
  String? brownies;
  String? shakes;
  String? iceCream;
  String? chocolate;
  List<String>? categories;

  Category(
      {this.icedCoffee,
      this.brownies,
      this.shakes,
      this.iceCream,
      this.categories,
      this.chocolate});

  Category.fromJson(Map<String, dynamic> json) {
    categories = json['categories'];
    icedCoffee = json['icedCoffee'];
    brownies = json['brownies'];
    shakes = json['shakes'];
    iceCream = json['iceCream'];
    chocolate = json['chocalate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icedCoffee'] = icedCoffee;
    data['brownies'] = brownies;
    data['shakes'] = shakes;
    data['iceCream'] = iceCream;
    data['chocolate'] = chocolate;
    data['categories'] = categories;
    return data;
  }
}
