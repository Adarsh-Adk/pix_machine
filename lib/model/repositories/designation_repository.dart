import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../view/core/app_constants.dart';
import '../entities/data_response.dart';
import '../entities/designation.dart';
import '../entities/server_response.dart';
import '../services/shared_preference.dart';

class DesignationRepository {
  static final _client = http.Client();
  List<Designation> _list = [];
  List<Designation> get designationList => _list;

  Future<DataResponse> getDesignation() async {
    try {
      final uri = Uri.parse("${AppConstants.baseUrl}designations");
      Map<String, String> headers = {
        "Authorization": SharedPreference.token,
        "Accept": "Application/json"
      };
      http.Response response = await _client.get(uri, headers: headers);
      Map<String, dynamic> data = jsonDecode(response.body);
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
            }
          }
        }
        _list = list.map((e) => Designation.fromJson(e)).toList();
        return DataResponse(data: _list);
      } else {
        return DataResponse(error: "Error Occurred");
      }
    } catch (e) {
      return DataResponse(error: "Exception in designation:$e");
    }
  }
}
