import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';

class CartCubit extends Cubit<List<FoodModel>> {
  CartCubit() : super(_initialCart());

  /// Initialize with current items in dummyFoods that are already in cart
  static List<FoodModel> _initialCart() {
    return dummyFoods.where((f) => f.inCartQuantity > 0).toList();
  }

  /// Add item to cart, with quantity (defaults to 1)
  void addToCart(FoodModel food, {int quantity = 1}) {
    final index = dummyFoods.indexWhere((f) => f.id == food.id);
    if (index != -1) {
      final currentQty = dummyFoods[index].inCartQuantity;
      dummyFoods[index] =
          dummyFoods[index].copyWith(inCartQuantity: currentQty + quantity);
      _refreshCart();
    }
  }

  /// Remove a single quantity from cart
  void removeFromCart(FoodModel food) {
    final index = dummyFoods.indexWhere((f) => f.id == food.id);
    if (index != -1 && dummyFoods[index].inCartQuantity > 0) {
      dummyFoods[index] = dummyFoods[index].copyWith(
        inCartQuantity: dummyFoods[index].inCartQuantity - 1,
      );
      _refreshCart();
    }
  }

  /// Update quantity manually (e.g. from cart screen)
  void updateQuantity(FoodModel food, int quantity) {
    final index = dummyFoods.indexWhere((f) => f.id == food.id);
    if (index != -1) {
      dummyFoods[index] = dummyFoods[index].copyWith(
        inCartQuantity: quantity,
      );
      _refreshCart();
    }
  }

  /// Remove the item from cart completely
  void removeCompletely(FoodModel food) {
    updateQuantity(food, 0);
  }

  /// Emit updated cart list (based on dummyFoods)
  void _refreshCart() {
    emit(dummyFoods.where((f) => f.inCartQuantity > 0).toList());
  }
}

///////////////////////////////////////////////

/* import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/models/food_model.dart';

class CartCubit extends Cubit<List<FoodModel>> {
  CartCubit() : super([]);

  void addToCart(FoodModel food, {int quantity = 1}) {
    final existingIndex = state.indexWhere((item) => item.id == food.id);
    if (existingIndex != -1) {
      final updatedItem = state[existingIndex].copyWith(
        inCartQuantity: state[existingIndex].inCartQuantity + quantity,
      );
      final updatedList = [...state];
      updatedList[existingIndex] = updatedItem;
      emit(updatedList);
    } else {
      emit([...state, food.copyWith(inCartQuantity: quantity)]);
    }
  }

  void updateQuantity(String foodId, int quantity) {
    final updatedList = state.map((item) {
      if (item.id == foodId) {
        return item.copyWith(inCartQuantity: quantity);
      }
      return item;
    }).toList();
    emit(updatedList);
  }

  void removeFromCart(String foodId) {
    emit(state.where((item) => item.id != foodId).toList());
  }

  void clearCart() {
    emit([]);
  }
}
*/
