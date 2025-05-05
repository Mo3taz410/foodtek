import 'package:flutter_bloc/flutter_bloc.dart';

enum PaymentMethod { card, cash }

class PaymentMethodCubit extends Cubit<PaymentMethod> {
  PaymentMethodCubit() : super(PaymentMethod.card);

  void select(PaymentMethod method) => emit(method);
}
