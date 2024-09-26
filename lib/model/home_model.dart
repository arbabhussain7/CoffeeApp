class Category {
  String? icedCoffee;
  String? brownies;
  String? shakes;
  String? iceCream;
  String? chocolate;

  Category(
      {this.icedCoffee,
      this.brownies,
      this.shakes,
      this.iceCream,
      this.chocolate});

  Category.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
