import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/food_model.dart';

class CategoryNavCubit extends Cubit<FoodCategory> {
  CategoryNavCubit() : super(FoodCategory.all);

  void updateCategory(FoodCategory category) => emit(category);
}
