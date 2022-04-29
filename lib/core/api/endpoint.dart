import 'response_data.dart';

typedef void CallBack(ResponseData response);
typedef void onFailure(String message);

const String baseUrl = "http://44.195.125.80:5600";
const String login = "/api/v1/user/login";
const String changePassword = "/api/v1/user/change_password";
const String getalltask = "/api/v1/employee/get-all-tasks";
const String acceptdecline = "/api/v1/employee/task";
const String getsingletask = "/api/v1/user/get-visit/";
const String update_completion_photos =
    "/api/v1/employee/update-completion-photos";
const String update_status = "/api/v1/employee/update-status";
const String acceptedTask = "/api/v1/employee/get-acceptedTask";
const String completedTask = "/api/v1/employee/get-completedTask";

const String update_profile = "/api/v1/user/update_profile";
const String getprofile = "/api/v1/user/profile";
