import 'package:flutter_bloc/flutter_bloc.dart';

enum CardType { mastercard, visa }

class CardTypeCubit extends Cubit<CardType> {
  CardTypeCubit() : super(CardType.mastercard);

  void select(CardType type) => emit(type);
}
