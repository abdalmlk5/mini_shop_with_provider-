class ProductModel {
  String image;
  String title;
  String brand;
  String rate;
  double price;
  int amount;

  ProductModel({
    required this.image,
    required this.title,
    required this.brand,
    required this.rate,
    required this.price,
    this.amount = 1,
  });
}
