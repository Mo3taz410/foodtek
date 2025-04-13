part of 'food_details_cubit.dart';

class FoodDetailsState {
  final int quantity;
  final int spiceLevel;

  const FoodDetailsState({
    this.quantity = 1,
    this.spiceLevel = 0,
  });

  FoodDetailsState copyWith({
    int? quantity,
    int? spiceLevel,
  }) {
    return FoodDetailsState(
      quantity: quantity ?? this.quantity,
      spiceLevel: spiceLevel ?? this.spiceLevel,
    );
  }
}
