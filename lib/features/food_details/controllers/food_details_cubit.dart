import 'package:flutter_bloc/flutter_bloc.dart';

part 'food_details_state.dart';

class FoodDetailsCubit extends Cubit<FoodDetailsState> {
  FoodDetailsCubit() : super(const FoodDetailsState());

  void increaseQuantity() {
    emit(state.copyWith(quantity: state.quantity + 1));
  }

  void decreaseQuantity() {
    if (state.quantity > 1) {
      emit(state.copyWith(quantity: state.quantity - 1));
    }
  }

  void setSpiceLevel(int level) {
    emit(state.copyWith(spiceLevel: level));
  }
}
