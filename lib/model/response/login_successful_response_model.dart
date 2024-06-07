class LoginSuccessfulResponseModel {
  LoginSuccessfulResponseModel({
      this.status, 
      this.message, 
      this.data,});

  LoginSuccessfulResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? LoginData.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  LoginData? data;
LoginSuccessfulResponseModel copyWith({  String? status,
  String? message,
  LoginData? data,
}) => LoginSuccessfulResponseModel(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class LoginData {
  LoginData({
      this.accessToken,});

  LoginData.fromJson(dynamic json) {
    accessToken = json['accessToken'];
  }
  String? accessToken;
LoginData copyWith({  String? accessToken,
}) => LoginData(  accessToken: accessToken ?? this.accessToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accessToken'] = accessToken;
    return map;
  }

}