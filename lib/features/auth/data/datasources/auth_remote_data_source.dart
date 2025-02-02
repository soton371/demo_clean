import 'package:demo_clean/core/constants/app_urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final response = await apiClient.post(AppUrls.login, {
      'email': email,
      'password': password,
    });
    return AuthResponseModel.fromJson(response);
  }
}
