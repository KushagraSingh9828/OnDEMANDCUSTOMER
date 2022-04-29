class UserProfileResponse {
  UserProfileResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  bool status;
  String message;
  UserResult result;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) =>
      UserProfileResponse(
        status: json["status"],
        message: json["message"],
        result: UserResult.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "result": result.toJson(),
  };
}

class UserResult {
  UserResult({
    required this.id,
    required this.name,
    required this.username,
    required this.address,
    required this.email,
    required this.isd,
    required this.phoneNo,
    required this.profilePicture,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String username;
  String address;
  String email;
  String isd;
  String phoneNo;
  String profilePicture;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserResult.fromJson(Map<String, dynamic> json) => UserResult(
    id: json["_id"],
    name: json["name"],
    username: json["username"] ?? "",
    address: json["address"] ?? "",
    email: json["email"] ?? "",
    isd: json["isd"] ?? "",
    phoneNo: json["phone_no"] ?? "",
    profilePicture: json["profile_picture"] ?? "",
    role: json["role"] ?? "",
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "username": username,
    "address": address,
    "email": email,
    "isd": isd,
    "phone_no": phoneNo,
    "profile_picture": profilePicture,
    "role": role,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
