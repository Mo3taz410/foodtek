import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit()
      : super(AuthInitial(
          isPasswordHidden: true,
          isConfirmPasswordHidden: true,
          selectedBirthDate: null,
        ));

  void login(UserModel user) {
    if (!user.isValidLogin) {
      emit(AuthFailure("Invalid email or password"));
      return;
    }

    emit(AuthLoading());

    Future.delayed(Duration(seconds: 2), () {
      if (user.email == "test@gmail.com" && user.password == "123456") {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Incorrect credentials"));
      }
    });
  }

  void signUp(UserModel user) {
    if (!user.isValidSignUp) {
      emit(AuthFailure("Please fill all fields correctly"));
      return;
    }

    emit(AuthLoading());

    Future.delayed(Duration(seconds: 2), () {
      emit(AuthSuccess());
    });
  }

  void reset() => emit(AuthInitial());

  void togglePasswordVisibility() {
    if (state is AuthInitial) {
      final current = state as AuthInitial;
      emit(current.copyWith(isPasswordHidden: !current.isPasswordHidden));
    }
  }

  void toggleConfirmPasswordVisibility() {
    if (state is AuthInitial) {
      final current = state as AuthInitial;
      emit(current.copyWith(
          isConfirmPasswordHidden: !current.isConfirmPasswordHidden));
    }
  }

  void updateBirthDate(DateTime? date) {
    if (state is AuthInitial) {
      final current = state as AuthInitial;
      emit(current.copyWith(selectedBirthDate: date));
    }
  }
}
