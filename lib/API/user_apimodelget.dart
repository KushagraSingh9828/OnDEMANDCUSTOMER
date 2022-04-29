import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:odsa/model/user_modelget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_modelhistoryget.dart';
import '../model/user_modelproducts.dart';



class ApiProviderGet {
  // final gettoken = SignIn();
  final _prefs = SharedPreferences.getInstance();

  static String baseUrl = "http://44.195.125.80:5600/";
  Future<UserProfileModel> fetchProfile() async {
    SharedPreferences prefs = await _prefs;

    final token = prefs.getString('token');
    final response =
        await http.get(Uri.parse('${baseUrl}api/v1/user/profile'), headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return UserProfileModel.fromJson(json.decode(response.body));
    } else {
      return UserProfileModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<ProductResponseModel> fetchProduct() async {
    final response = await http.get(Uri.parse('${baseUrl}api/v1/user/get-all-products'));
    if (response.statusCode == 200) {
      print(response.body);
      return ProductResponseModel.fromJson(json.decode(response.body));
    } else {
      return ProductResponseModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<ProductResponseModel> fetchService() async {
    final response =
        await http.get(Uri.parse('${baseUrl}api/v1/user/get-all-services'));
    if (response.statusCode == 200) {
      return ProductResponseModel.fromJson(json.decode(response.body));
    } else {
      return ProductResponseModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<HistoryGetModel> fetchHistory() async {
    SharedPreferences prefs = await _prefs;

    final token = prefs.getString('token');
    final response = await http
        .get(Uri.parse('${baseUrl}api/v1/user/get-history'), headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      return HistoryGetModel.fromJson(json.decode(response.body));
    } else {
      return HistoryGetModel.fromJson(jsonDecode(response.body));
    }
  }

}
