import '../../domain/entities/user.dart';

class AuthResponseModel extends User {
  final String accessToken;
  final String tokenType;
  final int role;

  AuthResponseModel({
    required super.name,
    required this.accessToken,
    required this.tokenType,
    required this.role,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      name: json['data']['name'],
      accessToken: json['data']['access_token'],
      tokenType: json['data']['token_type'],
      role: json['data']['role'],
    );
  }
}
