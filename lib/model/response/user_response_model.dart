/// userId : "94dbe9ec-654f-4683-8985-812e7406fb38"
/// xampId : "XAMP25047"
/// firstName : "Josh"
/// lastName : "Emmanuel"
/// middleName : null
/// gender : null
/// verifyStatus : 1
/// accountStatus : 1
/// role : 3
/// tenantVerified : false
/// landlordVerified : false
/// phoneNumber : null
/// email : "vicemmanuel7@gmail.com"
/// profileImage : "https://res.cloudinary.com/taliot/image/upload/v1697199168/assets/landing_page/rbcmrygjs9edq5qbnh9p.png"
/// permissions : null
/// createdAt : "2024-03-10T10:47:41.572Z"
/// deletedAt : null

class UserResponseModel {
  UserResponseModel({
      this.userId, 
      this.xampId, 
      this.firstName, 
      this.lastName, 
      this.middleName, 
      this.gender, 
      this.verifyStatus, 
      this.accountStatus, 
      this.role, 
      this.tenantVerified, 
      this.landlordVerified, 
      this.phoneNumber, 
      this.email, 
      this.profileImage, 
      this.permissions, 
      this.createdAt, 
      this.deletedAt,});

  UserResponseModel.fromJson(dynamic json) {
    userId = json['userId'];
    xampId = json['xampId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    middleName = json['middleName'];
    gender = json['gender'];
    verifyStatus = json['verifyStatus'];
    accountStatus = json['accountStatus'];
    role = json['role'];
    tenantVerified = json['tenantVerified'];
    landlordVerified = json['landlordVerified'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    profileImage = json['profileImage'];
    permissions = json['permissions'];
    createdAt = json['createdAt'];
    deletedAt = json['deletedAt'];
  }
  String? userId;
  String? xampId;
  String? firstName;
  String? lastName;
  dynamic middleName;
  dynamic gender;
  num? verifyStatus;
  num? accountStatus;
  num? role;
  bool? tenantVerified;
  bool? landlordVerified;
  dynamic phoneNumber;
  String? email;
  String? profileImage;
  dynamic permissions;
  String? createdAt;
  dynamic deletedAt;
UserResponseModel copyWith({  String? userId,
  String? xampId,
  String? firstName,
  String? lastName,
  dynamic middleName,
  dynamic gender,
  num? verifyStatus,
  num? accountStatus,
  num? role,
  bool? tenantVerified,
  bool? landlordVerified,
  dynamic phoneNumber,
  String? email,
  String? profileImage,
  dynamic permissions,
  String? createdAt,
  dynamic deletedAt,
}) => UserResponseModel(  userId: userId ?? this.userId,
  xampId: xampId ?? this.xampId,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  middleName: middleName ?? this.middleName,
  gender: gender ?? this.gender,
  verifyStatus: verifyStatus ?? this.verifyStatus,
  accountStatus: accountStatus ?? this.accountStatus,
  role: role ?? this.role,
  tenantVerified: tenantVerified ?? this.tenantVerified,
  landlordVerified: landlordVerified ?? this.landlordVerified,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  email: email ?? this.email,
  profileImage: profileImage ?? this.profileImage,
  permissions: permissions ?? this.permissions,
  createdAt: createdAt ?? this.createdAt,
  deletedAt: deletedAt ?? this.deletedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['xampId'] = xampId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['middleName'] = middleName;
    map['gender'] = gender;
    map['verifyStatus'] = verifyStatus;
    map['accountStatus'] = accountStatus;
    map['role'] = role;
    map['tenantVerified'] = tenantVerified;
    map['landlordVerified'] = landlordVerified;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['profileImage'] = profileImage;
    map['permissions'] = permissions;
    map['createdAt'] = createdAt;
    map['deletedAt'] = deletedAt;
    return map;
  }

}