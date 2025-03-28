import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/features/auth/controllers/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  void sendOtpToEmail(String email) async {
    emit(ResetPasswordLoading());
    try {
      // call your API to send OTP
      emit(ResetPasswordOtpSent());
    } catch (e) {
      emit(ResetPasswordFailure("Could not send OTP"));
    }
  }

  void verifyOtp(String otpCode) async {
    emit(ResetPasswordLoading());
    try {
      // call API to verify OTP
      emit(ResetPasswordOtpVerified());
    } catch (e) {
      emit(ResetPasswordFailure("Invalid OTP"));
    }
  }

  void resetPassword(String newPassword) async {
    emit(ResetPasswordLoading());
    try {
      // call API to reset password
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure("Could not reset password"));
    }
  }
}
