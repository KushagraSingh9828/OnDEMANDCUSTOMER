class CommonResponseModel {
  String message;

  CommonResponseModel({
    required this.message,
  });

  factory CommonResponseModel.fromJson(Map<String, dynamic> json) =>
      CommonResponseModel(
        message: json["message"],
      );
}
