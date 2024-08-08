class Product {
  final String name;
  final String image;
  final int price;

  Product({required this.name, required this.image, required this.price});
}

List<Product> productList = [
  Product(image: 'assets/tes-img.png', name: 'Dairy Milk', price: 10),
  Product(image: 'assets/tes-img.png', name: 'Chocolate', price: 12),
  Product(image: 'assets/tes-img.png', name: 'Rice', price: 15),
  Product(image: 'assets/tes-img.png', name: 'Egg', price: 17),
];
