part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  final DateTime? selectedBirthDate;

  AuthInitial({
    this.isPasswordHidden = true,
    this.isConfirmPasswordHidden = true,
    this.selectedBirthDate,
  });

  AuthInitial copyWith({
    bool? isPasswordHidden,
    bool? isConfirmPasswordHidden,
    DateTime? selectedBirthDate,
  }) {
    return AuthInitial(
      isPasswordHidden: isPasswordHidden ?? this.isPasswordHidden,
      isConfirmPasswordHidden:
          isConfirmPasswordHidden ?? this.isConfirmPasswordHidden,
      selectedBirthDate: selectedBirthDate ?? this.selectedBirthDate,
    );
  }
}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure(this.errorMessage);
}
