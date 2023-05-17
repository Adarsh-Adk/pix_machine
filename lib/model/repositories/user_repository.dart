import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../view/core/app_constants.dart';
import '../entities/data_response.dart';
import '../entities/user_input.dart';

class UserRepository {
  Future<DataResponse> login(UserInput user) async {
    try {
      final uri = Uri.parse("${AppConstants.baseUrl}login");
      Map<String, String> headers = {
        "Accept": "Application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      };
      Map<String, dynamic> body = user.toJson();
      http.Response response =
          await http.post(uri, body: body, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String token = data["data"]["access_token"] ?? "";
        return DataResponse(data: token);
      } else {
        return DataResponse(error: "Error Occurred");
      }
    } catch (e) {
      return DataResponse(error: "$e");
    }
  }
}
