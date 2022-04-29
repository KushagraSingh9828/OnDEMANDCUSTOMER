class UserProfileModel {
  bool? status;
  String? message;
  Result? result;

  UserProfileModel({this.status, this.message, this.result});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
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
  String? sId;
  String? name;
  String? username;
  String? address;
  String? email;
  String? isd;
  String? phoneNo;
  String? profilePicture;
  String? role;
  String? createdAt;
  String? updatedAt;

  Result(
      {this.sId,
      this.name,
      this.username,
      this.address,
      this.email,
      this.isd,
      this.phoneNo,
      this.profilePicture,
      this.role,
      this.createdAt,
      this.updatedAt});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    username = json['username'];
    address = json['address'];
    email = json['email'];
    isd = json['isd'];
    phoneNo = json['phone_no'];
    profilePicture = json['profile_picture'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['username'] = this.username;
    data['address'] = this.address;
    data['email'] = this.email;
    data['isd'] = this.isd;
    data['phone_no'] = this.phoneNo;
    data['profile_picture'] = this.profilePicture;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
