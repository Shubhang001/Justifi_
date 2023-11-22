class UserEmailModel {
  final bool success;
  final String message;
  final int id;
  final String email;
  final int role;
  final String token;
  final bool isVerified;
  final String phone_number;
  final String city;
  final String dob;
  final String first_name;
  final String last_name;
  final String gender;

  UserEmailModel({
    required this.success,
    required this.message,
    required this.id,
    required this.email,
    required this.role,
    required this.token,
    required this.isVerified,
    required this.phone_number,
    required this.city,
    required this.dob,
    required this.first_name,
    required this.last_name,
    required this.gender,
  });

  factory UserEmailModel.fromJson(Map<String, dynamic> json) {
    return UserEmailModel(
      success: json['success'],
      message: json['message'],
      id: json['data']['id'],
      email: json['data']['email'],
      role: json['data']['role'],
      token: json['data']['token'],
      isVerified: json['data']['is_verified'],
      phone_number: json['data']['phone_number'],
      city: json['data']['city'],
      dob: json['data']['dob'],
      first_name: json['data']['first_name'],
      last_name: json['data']['last_name'],
      gender: json['data']['gender'],
    );
  }
}

class UserPhoneModel {
  final bool success;
  final String message;
  final int id;
  final String phone;
  final int role;
  final String token;
  final bool isVerified;
  final String phone_number;
  final String city;
  final String dob;
  final String first_name;
  final String last_name;
  final String gender;

  UserPhoneModel({
    required this.success,
    required this.message,
    required this.id,
    required this.phone,
    required this.role,
    required this.token,
    required this.isVerified,
    required this.phone_number,
    required this.city,
    required this.dob,
    required this.first_name,
    required this.last_name,
    required this.gender,
  });

  factory UserPhoneModel.fromJson(Map<String, dynamic> json) {
    return UserPhoneModel(
      success: json['success'],
      message: json['message'],
      id: json['data']['id'],
      phone: json['data']['phone'],
      role: json['data']['role'],
      token: json['data']['token'],
      isVerified: json['data']['is_verified'],
      phone_number: json['data']['phone_number'],
      city: json['data']['city'],
      dob: json['data']['dob'],
      first_name: json['data']['first_name'],
      last_name: json['data']['last_name'],
      gender: json['data']['gender'],
    );
  }
}
