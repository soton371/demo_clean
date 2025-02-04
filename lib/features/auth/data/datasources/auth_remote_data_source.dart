import 'package:demo_clean/core/constants/app_urls.dart';
import '../../../../core/network/api_client.dart';
import '../models/auth_response_model.dart';

// abstract class AuthRemoteDataSource {
//   Future<AuthResponseModel> login(String email, String password);
// }

class AuthRemoteDataSource {
  static Future<AuthResponseModel> login(String email, String password) async {
    final response = await ApiClient.post(AppUrls.login, {
      'email': email,
      'password': password,
    });
    return AuthResponseModel.fromJson(response);
  }
}
