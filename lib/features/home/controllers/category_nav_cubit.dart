import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/features/home/models/food_category.dart';

class CategoryNavCubit extends Cubit<FoodCategory> {
  CategoryNavCubit() : super(FoodCategory.all);

  void updateCategory(FoodCategory category) => emit(category);
}
