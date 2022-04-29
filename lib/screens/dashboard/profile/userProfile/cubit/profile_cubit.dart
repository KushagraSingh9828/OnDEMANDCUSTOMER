import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/api/common_response_model.dart';
import '../../../../../core/api/endpoint.dart';
import '../../../../../core/api/request_body.dart';
import '../../../../../core/base/NetworkException.dart';
import '../../../../../core/constant/msg_constant.dart';
import '../repositories/UserProfileResponse.dart';
import '../repositories/profile_repositories.dart';
import '../state/profile_state.dart';
import 'package:http/http.dart' as http;

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRequest request = ProfileRequest();
  ProfileCubit() : super(ProfileInitialState(connecting)) {
    getUserProfile();
  }

  Future getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    log(token.toString());

    ProfileRepository repositories = ProfileRepository(
        RequestBody(url: baseUrl + getprofile, body: "", token: token));
    try {
      emit(ProfileLoadingState(loading));
      final response = await repositories.getProfile();
      var code = response.code ?? 0;
      final jsonResponse = json.decode(response.json ?? "");

      if (code == 200) {
        emit(ProfileLoadedState(
            response: UserProfileResponse.fromJson(jsonResponse)));
      } else if (code == 500) {
        emit(ProfileErrorState(serverError));
      } else {
        emit(ProfileErrorState(
            CommonResponseModel.fromJson(jsonResponse).message));
      }
    } on NetworkException {
      emit(ProfileErrorState(serverError));
    }
  }

  Future updateProfile() async {
    try {
      emit(ProfileLoadingState(loading));
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      var uuid = Uuid();

      String boundry = uuid.toString();
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data; boundary=' + boundry,
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var filePath = request.filePath ?? "";
      var httpRequest = http.MultipartRequest(
        'PUT',
        Uri.parse(baseUrl + update_profile),
      );

      if (filePath.isNotEmpty) {
        log("filePath is isNotEmpty");
        httpRequest.files.add(http.MultipartFile(
            'profile_picture',
            File(filePath).readAsBytes().asStream(),
            File(filePath).lengthSync(),
            filename: filePath.split("/").last));
      } else {
        log("filePath is empty");
      }

      httpRequest.headers.addAll(headers);

      log(request.name ?? "");
      log(request.mobile ?? "");
      log(request.isd ?? "");
      log(request.address ?? "");

      // param name
      httpRequest.fields['name'] = request.name ?? "";
      httpRequest.fields['phone_no'] = request.mobile ?? "";
      httpRequest.fields['isd'] = request.isd ?? "";
      httpRequest.fields['address'] = request.address ?? "";

      var streamResponse = await httpRequest.send();
      var response = await http.Response.fromStream(streamResponse);

      var jsonBody = response.body;
      log(jsonBody);
      final jsonResponse = json.decode(jsonBody);
      var code = response.statusCode;

      CommonResponseModel responseModel =
          CommonResponseModel.fromJson(jsonResponse);
      if (code == 200) {
        emit(ProfileLoadedState(commonResponseModel: responseModel));
      } else if (code == 500) {
        emit(ProfileErrorState(serverError));
      } else {
        emit(ProfileErrorState(
            CommonResponseModel.fromJson(jsonResponse).message)

        );
      }
    } on NetworkException {
      emit(ProfileErrorState(serverError));
    }
  }

}
class ProfileRequest {
  String? name;
  String? isd;
  String? mobile;
  String? address;
  String? filePath;
  String? email;
}