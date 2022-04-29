import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/user_modelchngpswd.dart';

class ChangeApiProvider {
  final _prefs = SharedPreferences.getInstance();
  static String baseUrl = "http://44.195.125.80:5600/";

  Future<ChangeResponseModel> changePassword(
    String oldpassword,
    String newpassword,
    String confirmpassword,
  ) async {
    final data = {
      'old_password': oldpassword,
      'new_password': newpassword,
      'confirm_password': confirmpassword,
    };
    SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token');
    final url = Uri.parse("${baseUrl}api/v1/user/change_password");
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      print(response.body);
      return ChangeResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return ChangeResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }
}
