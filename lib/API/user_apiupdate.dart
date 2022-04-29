import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:odsa/model/user_modelupdatepost.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateApiProvider {
  final _prefs = SharedPreferences.getInstance();
  static String baseUrl = "http://44.195.125.80:5600/";

  Future<UpdateResponseModel> infoUpdate(

    String name,
    XFile profile_picture,
    String phone,
    String isd,
    String address,
  ) async {
    final data = {
      'name': name,
      'profile_picture':profile_picture,
      'phone_no': phone,
      'isd': isd,
      'address': address,
    };
    SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token');
    final url = Uri.parse("${baseUrl}api/v1/user/update_profile");
    final response = await http.put(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      print(response.body);
      return UpdateResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return UpdateResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }
}
