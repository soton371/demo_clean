import 'dart:convert';
import 'package:demo_clean/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../errors/exceptions.dart';

class ApiClient {

  static Future<Map<String, dynamic>> post(String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (kDebugMode) {
      print("#"*50);
      print("post url => $url");
      print("post body => $body");
      print("post response.statusCode => ${response.statusCode}");
      print("post response.body => ${response.body}");
      print("#"*50);
    }

    final responseData = jsonDecode(response.body);

    if (responseData['success'] == true) {
      return responseData;
    } else {
      throw ServerException(responseData['message'] ?? AppConstants.serverError);
    }
  }
}


