import 'package:flutter_bloc/flutter_bloc.dart';

class PromoNavCubit extends Cubit<int> {
  PromoNavCubit() : super(0);
  void updateIndex(int index) => emit(index);
}
