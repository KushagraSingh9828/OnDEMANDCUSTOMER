import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'endpoint.dart';
import 'request_body.dart';
import 'response_data.dart';

class APIHandler {}

extension ApiRequest on APIHandler {
  Future<void> postRequest(RequestBody request, CallBack callback) async {
    var token = request.token;
    final response = await http.post(Uri.parse(request.url ?? ""),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: request.body);
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (kDebugMode) {
      print(response.body);
    }
    ResponseData resp =
        ResponseData(code: response.statusCode, json: response.body);
    callback(resp);
  }

  Future<void> putRequest(RequestBody request, CallBack callback) async {
    var token = request.token;
    final response = await http.put(Uri.parse(request.url ?? ""),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: request.body);
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (kDebugMode) {
      print(response.body);
    }
    ResponseData resp =
        ResponseData(code: response.statusCode, json: response.body);
    callback(resp);
  }

  Future<void> getRequest(RequestBody request, CallBack callback) async {
    var token = request.token;
    final response =
        await http.get(Uri.parse(request.url ?? ""), headers: <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (kDebugMode) {
      print(response.statusCode);
    }
    if (kDebugMode) {
      print(response.body);
    }
    ResponseData resp =
        ResponseData(code: response.statusCode, json: response.body);
    callback(resp);
  }
}

extension SearchRequest on APIHandler {
  Future<void> searchRequest(RequestBody request, CallBack callback) async {
    final response = await http.post(Uri.parse(request.url ?? ""),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: request.body);
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (kDebugMode) {
      print(response.body);
    }
    ResponseData resp =
        ResponseData(code: response.statusCode, json: response.body);
    callback(resp);
  }
}
