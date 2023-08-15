class UserEmailModel {
  final bool success;
  final String message;
  final String id;
  final String email;
  final int role;
  final String token;
  final bool isVerified;

  UserEmailModel(
      {required this.success,
      required this.message,
      required this.id,
      required this.email,
      required this.role,
      required this.token,
      required this.isVerified});

  factory UserEmailModel.fromJson(Map<String, dynamic> json) {
    return UserEmailModel(
        success: json['success'],
        message: json['message'],
        id: json['data']['id'],
        email: json['data']['email'],
        role: json['data']['role'],
        token: json['data']['token'],
        isVerified: json['data']['is_verified']);
  }
}

class UserPhoneModel {
  final bool success;
  final String message;
  final String id;
  final String phone;
  final int role;
  final String token;
  final bool isVerified;

  UserPhoneModel(
      {required this.success,
      required this.message,
      required this.id,
      required this.phone,
      required this.role,
      required this.token,
      required this.isVerified});

  factory UserPhoneModel.fromJson(Map<String, dynamic> json) {
    return UserPhoneModel(
        success: json['success'],
        message: json['message'],
        id: json['data']['id'],
        phone: json['data']['phone'],
        role: json['data']['role'],
        token: json['data']['token'],
        isVerified: json['data']['is_verified']);
  }
}
