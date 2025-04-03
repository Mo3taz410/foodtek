import "package:foodtek/features/app/models/top_rated_food.dart";

class TopRatedFoodList {
  List<TopRatedFood> topRatedFoodL = [
    TopRatedFood(
      name: 'Chicken Burger',
      imagePath: 'assets/images/burger2.png',
      description: '100g chicken + tomato + cheese',
      price: 20.00,
      rating: 4.2,
    ),
    TopRatedFood(
      name: 'Cheese Burger',
      imagePath: 'assets/images/burger1.png',
      description: '100g beef + onion + cheese',
      price: 15.00,
      rating: 4.5,
    ),
    TopRatedFood(
      name: 'Veggie Delight',
      imagePath: 'assets/images/burger2.png',
      description: 'Tomato + lettuce + cucumber',
      price: 12.00,
      rating: 4.0,
    ),
  ];
}
