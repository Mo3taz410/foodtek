class CartItem {
  final String name;
  final String restaurant;
  final double price;
  final String image;
  int quantity;

  CartItem({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}
