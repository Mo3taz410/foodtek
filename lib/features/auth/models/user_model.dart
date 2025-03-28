class UserModel {
  final String? fullName;
  final String? email;
  final String? password;
  final DateTime? birthDate;
  final String? phoneNumber;

  UserModel({
    this.fullName,
    this.email,
    this.password,
    this.birthDate,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'password': password,
      'birth_date': birthDate?.toIso8601String(),
      'phone_number': phoneNumber,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      birthDate: json['birth_date'] != null
          ? DateTime.tryParse(json['birth_date'])
          : null,
      phoneNumber: json['phone_number'] as String?,
    );
  }

  bool get isValidFullName {
    final regex = RegExp(r"^[\p{L} ]+$", unicode: true);
    return fullName != null && regex.hasMatch(fullName!.trim());
  }

  bool get isValidEmail {
    if (email == null) return false;
    final domainRegex = RegExp(r'@(gmail|yahoo|hotmail|outlook)\.com$');
    final emailRegex = RegExp(r"^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$");
    return emailRegex.hasMatch(email!) && domainRegex.hasMatch(email!);
  }

  bool get isValidPhoneNumber {
    final phoneRegex = RegExp(r"^\+?\d{9,15}$");
    return phoneNumber != null && phoneRegex.hasMatch(phoneNumber!);
  }

  bool get isValidBirthDate {
    if (birthDate == null) return false;
    final minAllowed = DateTime.now().subtract(const Duration(days: 365 * 16));
    return birthDate!.isBefore(minAllowed);
  }

  bool get isValidPassword {
    if (password == null || password!.length < 6) return false;
    final hasUpper = RegExp(r'[A-Z]').hasMatch(password!);
    final hasLower = RegExp(r'[a-z]').hasMatch(password!);
    final hasDigit = RegExp(r'\d').hasMatch(password!);
    final hasSymbol =
        RegExp(r'[!@#\$&*~%^()\[\]{}<>,.?":;|\\/_+=-]').hasMatch(password!);
    return hasUpper && hasLower && hasDigit && hasSymbol;
  }

  bool get isValidLogin =>
      isValidEmail && password != null && password!.isNotEmpty;

  bool get isValidSignUp =>
      isValidFullName &&
      isValidEmail &&
      isValidPhoneNumber &&
      isValidBirthDate &&
      isValidPassword;
}
