import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../view/core/app_constants.dart';
import '../../view_model/util/utility.dart';
import '../entities/data_response.dart';
import '../entities/employee_input.dart';
import '../entities/employee_response.dart';
import '../entities/server_response.dart';
import '../services/shared_preference.dart';

class EmployeeRepository {
  static final _client = http.Client();
  final Uri _uri = Uri.parse("${AppConstants.baseUrl}employees");

  Future<DataResponse> getEmployees() async {
    try {
      Map<String, String> headers = {
        "Authorization": SharedPreference.token,
        "Accept": "Application/json"
      };
      Map<String, dynamic> data = {};

      http.Response response = await _client.get(_uri, headers: headers);
      data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        ServerResponse serverResponse = ServerResponse.fromJson(data["data"]);
        List list = serverResponse.data ?? [];

        if (serverResponse.total != null) {
          for (int i = list.length; i <= serverResponse.total!; i++) {
            if (list.length != serverResponse.total &&
                serverResponse.nextPageUrl != null) {
              response = await _client.get(
                  Uri.parse(serverResponse.nextPageUrl!),
                  headers: headers);
              data = jsonDecode(response.body);
              if (response.statusCode == 200) {
                serverResponse = ServerResponse.fromJson(data["data"]);
                list.addAll(serverResponse.data);
              }
              if (response.statusCode == 401) {
                return DataResponse(error: "Unauthenticated");
              }
            }
          }
        }
        return DataResponse(
            data: list.map((e) => EmployeeResponse.fromJson(e)).toList());
      } else if (response.statusCode == 401) {
        return DataResponse(error: "Unauthenticated");
      } else {
        return DataResponse(error: "Error Occurred: ${data["message"]}");
      }
    } catch (e) {
      return DataResponse(error: "Exception in EmployeeRepo getEmployee:$e");
    }
  }

  Future<DataResponse> addEmployee({required EmployeeInput input}) async {
    // try {
    Map<String, String> headers = {
      "Authorization": SharedPreference.token,
      "Accept": "Application/json",
      "content-type": "application/json"
    };
    Map<String, String> body = {
      ...input.toJson(),
    };
    // body["profile_picture"] = await Utility.fileToMultipart(
    //     file: input.profilePicture!, fieldName: "profile_picture");
    // body["resume"] =
    //     await Utility.fileToMultipart(file: input.resume!, fieldName: "resume");
    var request = http.MultipartRequest('POST', _uri);
    request.headers.addAll(headers);
    request.files.add(await Utility.fileToMultipart(
        file: input.profilePicture!, fieldName: "profile_picture"));
    request.files.add(await Utility.fileToMultipart(
        file: input.resume!, fieldName: "resume"));
    request.fields.addAll(body);
    http.StreamedResponse responseStream = await request.send();

    var response = await http.Response.fromStream(responseStream);

    // http.Response response  = await _client.post(uri, headers: headers, body: jsonEncode(body));
    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      String message = data["message"] ?? "";
      return DataResponse(data: message);
    } else if (response.statusCode == 401) {
      return DataResponse(error: "Unauthenticated");
    } else {
      return DataResponse(
          error:
              "Error Occurred in EmployeeRepo addEmployee ${data["message"]}");
    }
    // } catch (e) {
    //   return DataResponse(error: "Exception in EmployeeRepo addEmployee:$e");
    // }
  }
}
