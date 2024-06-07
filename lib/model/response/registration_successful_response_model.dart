class RegistrationSuccessfulResponseModel {
  RegistrationSuccessfulResponseModel({
      this.status, 
      this.message, 
      this.data,});

  RegistrationSuccessfulResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? message;
  Data? data;
RegistrationSuccessfulResponseModel copyWith({  String? status,
  String? message,
  Data? data,
}) => RegistrationSuccessfulResponseModel(  status: status ?? this.status,
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

class Data {
  Data({
      this.email, 
      this.password, 
      this.accountConfirmed, 
      this.isAdmin, 
      this.isActive, 
      this.isVerified, 
      this.id, 
      this.v, 
      this.profile,});

  Data.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    accountConfirmed = json['accountConfirmed'];
    isAdmin = json['isAdmin'];
    isActive = json['isActive'];
    isVerified = json['isVerified'];
    id = json['_id'];
    v = json['__v'];
    profile = json['profile'];
  }
  String? email;
  String? password;
  bool? accountConfirmed;
  bool? isAdmin;
  bool? isActive;
  bool? isVerified;
  String? id;
  num? v;
  String? profile;
Data copyWith({  String? email,
  String? password,
  bool? accountConfirmed,
  bool? isAdmin,
  bool? isActive,
  bool? isVerified,
  String? id,
  num? v,
  String? profile,
}) => Data(  email: email ?? this.email,
  password: password ?? this.password,
  accountConfirmed: accountConfirmed ?? this.accountConfirmed,
  isAdmin: isAdmin ?? this.isAdmin,
  isActive: isActive ?? this.isActive,
  isVerified: isVerified ?? this.isVerified,
  id: id ?? this.id,
  v: v ?? this.v,
  profile: profile ?? this.profile,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['accountConfirmed'] = accountConfirmed;
    map['isAdmin'] = isAdmin;
    map['isActive'] = isActive;
    map['isVerified'] = isVerified;
    map['_id'] = id;
    map['__v'] = v;
    map['profile'] = profile;
    return map;
  }

}