import 'package:foodtek/features/home/models/top_rated_food.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';

class TopRatedFoodList {
  List<TopRatedFood> topRatedFoodL = [
    TopRatedFood(
      name: 'Chicken Burger',
      imagePath: AppImageStrings.chickenBurger,
      description: '100g chicken + tomato + cheese',
      price: 20.00,
      rating: 4.2,
    ),
    TopRatedFood(
      name: 'Cheese Burger',
      imagePath: AppImageStrings.cheeseBurger,
      description: '100g beef + onion + cheese',
      price: 15.00,
      rating: 4.5,
    ),
    TopRatedFood(
      name: 'Veggie Delight',
      imagePath: AppImageStrings.cheeseBurger,
      description: 'Tomato + lettuce + cucumber',
      price: 12.00,
      rating: 4.0,
    ),
  ];
}
