class RegisterResponseModel {
  bool? status;
  String? message;
  Result? result;

  RegisterResponseModel({this.status, this.message, this.result});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? userId;
  String? username;
  String? name;
  String? email;
  String? isd;
  String? phoneNo;
  bool? userEmailVerified;
  String? role;
  String? token;

  Result(
      {this.userId,
      this.username,
      this.name,
      this.email,
      this.isd,
      this.phoneNo,
      this.userEmailVerified,
      this.role,
      this.token});

  Result.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    isd = json['isd'];
    phoneNo = json['phone_no'];
    userEmailVerified = json['user_email_verified'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['name'] = this.name;
    data['email'] = this.email;
    data['isd'] = this.isd;
    data['phone_no'] = this.phoneNo;
    data['user_email_verified'] = this.userEmailVerified;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
