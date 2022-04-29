class HistoryGetModel {
  bool? status;
  String? message;
  List<Result>? result;

  HistoryGetModel({this.status, this.message, this.result});

  HistoryGetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? name;
  String? email;
  String? isd;
  String? phoneNo;
  String? photo;
  String? squareFoot;
  String? address;
  String? employee;
  String? orderRacking;
  List<String>? completionPhotos;
  String? sId;
  String? product;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? orderTracking;
  String? service;

  Result(
      {this.name,
      this.email,
      this.isd,
      this.phoneNo,
      this.photo,
      this.squareFoot,
      this.address,
      this.employee,
      this.orderRacking,
      this.completionPhotos,
      this.sId,
      this.product,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.orderTracking,
      this.service});

  Result.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    isd = json['isd'];
    phoneNo = json['phone_no'];
    photo = json['photo'];
    squareFoot = json['squareFoot'];
    address = json['address'];
    employee = json['employee'];
    orderRacking = json['order_racking'];
    completionPhotos = json['completion_photos'].cast<String>();
    sId = json['_id'];
    product = json['product'];
    user = json['user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
    orderTracking = json['order_tracking'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['isd'] = this.isd;
    data['phone_no'] = this.phoneNo;
    data['photo'] = this.photo;
    data['squareFoot'] = this.squareFoot;
    data['address'] = this.address;
    data['employee'] = this.employee;
    data['order_racking'] = this.orderRacking;
    data['completion_photos'] = this.completionPhotos;
    data['_id'] = this.sId;
    data['product'] = this.product;
    data['user'] = this.user;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['__v'] = this.iV;
    data['order_tracking'] = this.orderTracking;
    data['service'] = this.service;
    return data;
  }
}
