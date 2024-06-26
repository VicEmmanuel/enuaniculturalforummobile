class UserResponseModel {
  UserResponseModel({
      this.status, 
      this.message, 
      this.data,});

  UserResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;
UserResponseModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => UserResponseModel(  status: status ?? this.status,
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
      this.user, 
      this.token,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;
Data copyWith({  User? user,
  String? token,
}) => Data(  user: user ?? this.user,
  token: token ?? this.token,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt, 
      this.role,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    role = json['role'];
  }
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  num? role;
User copyWith({  num? id,
  String? name,
  String? email,
  dynamic emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
  num? role,
}) => User(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  role: role ?? this.role,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['role'] = role;
    return map;
  }

}