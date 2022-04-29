import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:odsa/model/user_modelpost1.dart';
import 'dart:convert';

import 'package:odsa/model/visitmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  final _prefs = SharedPreferences.getInstance();
  static String baseUrl = "http://44.195.125.80:5600/";

  //signUp
  Future<RegisterResponseModel> signUp(
    String name, String username,
    String isd, String phone,
    String email, String password,
    String confirmpassword, String deviceType,
    String deviceId,) async {
    final data = {
      'name': name,
      'username': username,
      'isd': isd,
      'phone_no': phone,
      'role': 'customer',
      'email': email,
      'password': password,
      'confirm_password': confirmpassword,
      'device_token': deviceId,
      'device_type': deviceType,
    };

    final url = Uri.parse("${baseUrl}api/v1/user/signup");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log(response.body);
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }

  Future<RegisterResponseModel> otpapi(
    String email,
    String otp,
  ) async {
    final data = {
      'email': email,
      'otp': otp,
    };

    final url = Uri.parse("${baseUrl}api/v1/user/forgot/verify_otp");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log(response.body);
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }

  Future<RegisterResponseModel> signinapi(
    String email,
    String password,
    String deviceType,
    String deviceId,
  ) async {
    final data = {
      'email': email,
      'password': password,
      'device_type': deviceType,
      'device_token': deviceId,
    };
    final url = Uri.parse("${baseUrl}api/v1/user/login");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log(response.body);
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }

  Future<RegisterResponseModel> forgotpasswordapi(
    String email,
  ) async {
    final data = {
      'email': email,
    };

    final url = Uri.parse("${baseUrl}api/v1/user/forgot_password");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log(response.body);
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }

  Future<RegisterResponseModel> resetpasswordapi(
    String email,
    String password,
    String confirmpassword,
  ) async {
    final data = {
      'email': email,
      'new_password': password,
      'confirm_password': confirmpassword,
    };

    final url = Uri.parse("${baseUrl}api/v1/user/forgot/reset_password");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log(response.body);
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }

  Future<RegisterResponseModel> logoutapi() async {
    final response = await http
        .get(Uri.parse("${baseUrl}dev/on_demand_service/api/v1/logout"));
    if (response.statusCode == 200) {
      return RegisterResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed');
    }
  }

  Future<RegisterResponseModel> resendapi(String email,) async {
    final data = {
      'email': email,
    };

    final url = Uri.parse("${baseUrl}api/v1/user/resend_otp");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log(response.body);
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }

  Future<VisitResponseModel> visitAipCall(
      String name,
      String isd,
      String phone,
      String address,
      String service
      ) async {
    final data = {
      'name':name,
      'isd': isd,
      'phone_no':phone,
      'address':address,
      "service": service
    };
    log(name);
    log(isd);
    log(phone);
    log(address);
    log(service);
    SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token');
    final url = Uri.parse("${baseUrl}api/v1/user/create-visit");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log("${response.body.toString()}");
      return VisitResponseModel.fromJson(jsonDecode(response.body));
    } else {
      log("${response.body.toString()}");
      return VisitResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }


  Future<VisitResponseModel> bookingApiCall(
      String name,
      String isd,
      String phone,
      String address,
      String service
      ) async {
    final data = {
      'name':name,
      'isd': isd,
      'phone_no':phone,
      'address':address,
      "service": service
    };
    log(name);
    log(isd);
    log(phone);
    log(address);
    log(service);
    SharedPreferences prefs = await _prefs;
    final token = prefs.getString('token');
    final url = Uri.parse("${baseUrl}api/v1/user/create-visit");
    final response = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      log("${response.body.toString()}");
      return VisitResponseModel.fromJson(jsonDecode(response.body));
    } else {
      log("${response.body.toString()}");
      return VisitResponseModel.fromJson(jsonDecode(response.body));
      // User.fromJson({'error':'Server error'});
    }
  }



}

