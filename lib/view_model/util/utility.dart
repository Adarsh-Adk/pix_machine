import 'dart:io';

import 'package:http/http.dart';
import 'package:path/path.dart';

class Utility {
  static final Utility _singleton = Utility._internal();

  factory Utility() => _singleton;

  Utility._internal();

  static bool isValidUsername(String? username) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(username ?? " ");
  }

  static bool isValidEmail(String? email) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$');
    return regex.hasMatch(email ?? " ");
  }

  static bool isValidPassword(String? password) {
    RegExp regex = RegExp(
        r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@!_?])[a-zA-Z0-9@!_?]{5,}$');
    return regex.hasMatch(password ?? " ");
  }

  static bool isValidPhone(int? phone) {
    RegExp regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch((phone ?? "").toString());
  }

  static bool isValidLandline(int? phone) {
    RegExp regex = RegExp(r'^[0-9]{11}$');
    return regex.hasMatch((phone ?? "").toString());
  }

  static String formattedDate(String? date) {
    DateTime? newDate =
        DateTime.tryParse(date ?? DateTime.now().toUtc().toString());
    return "${newDate?.day ?? ""} / ${newDate?.month} / ${newDate?.year ?? ""}";
  }

  static Future<MultipartFile> fileToMultipart(
      {required File file, required String fieldName}) async {
    return await MultipartFile.fromPath(fieldName, file.path,
        filename: basename(file.path));
  }
}
