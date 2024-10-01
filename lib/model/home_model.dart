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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icedCoffee'] = this.icedCoffee;
    data['brownies'] = this.brownies;
    data['shakes'] = this.shakes;
    data['iceCream'] = this.iceCream;
    data['chocolate'] = this.chocolate;
    data['categories'] = this.categories;
    return data;
  }
}
