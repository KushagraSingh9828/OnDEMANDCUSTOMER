
class VisitResponseModel {
  bool? status;
  String? message;
  Result? result;

  VisitResponseModel({this.status, this.message, this.result});

  VisitResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String,dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? name;
  String? email;
  String? isd;
  String? phoneNo;
  String? squareFoot;
  String? address;
  String? service;

  Result(
      {
        this.name, this.isd, this.phoneNo, this.address, this.service});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email= json['email'];
    isd = json['isd'];
    phoneNo = json['phone_no'];
    squareFoot=json['squareFoot'];
    address = json['address'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['isd'] = isd;
    data['phone_no'] = phoneNo;
    data['address'] = address;
    data['service'] = service;
    return data;
  }
}