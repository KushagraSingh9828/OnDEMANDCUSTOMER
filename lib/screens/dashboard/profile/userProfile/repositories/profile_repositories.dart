import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../../../core/api/request_body.dart';
import '../../../../../core/api/response_data.dart';

class ProfileRepository {
  RequestBody request;

  ProfileRepository(
    this.request,
  );

  Future<ResponseData> getProfile() async {
    var token = request.token ?? "";
    final response =
        await http.get(Uri.parse(request.url ?? ""), headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    log(response.body.toString());
    return ResponseData(code: response.statusCode, json: response.body);
  }

  Future<ResponseData> updateProfile() async {
    var token = request.token ?? "";
    final response = await http.post(Uri.parse(request.url ?? ""),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: request.body);

    return ResponseData(code: response.statusCode, json: response.body);
  }
}
