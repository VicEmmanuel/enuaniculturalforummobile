class TenantsResponseModel {
  TenantsResponseModel({
      this.status,
      this.message,
      this.data,});

  TenantsResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? TenantData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  TenantData? data;
TenantsResponseModel copyWith({  bool? status,
  String? message,
  TenantData? data,
}) => TenantsResponseModel(  status: status ?? this.status,
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

class TenantData {
  TenantData({
      this.tenants,
      this.transactionData,});

  TenantData.fromJson(dynamic json) {
    if (json['tenants'] != null) {
      tenants = [];
      json['tenants'].forEach((v) {
        tenants?.add(Tenants.fromJson(v));
      });
    }
    if (json['transactionData'] != null) {
      transactionData = [];
      json['transactionData'].forEach((v) {
        transactionData?.add(TransactionData.fromJson(v));
      });
    }
  }
  List<Tenants>? tenants;
  List<TransactionData>? transactionData;
  TenantData copyWith({  List<Tenants>? tenants,
  List<TransactionData>? transactionData,
}) => TenantData(  tenants: tenants ?? this.tenants,
  transactionData: transactionData ?? this.transactionData,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tenants != null) {
      map['tenants'] = tenants?.map((v) => v.toJson()).toList();
    }
    if (transactionData != null) {
      map['transactionData'] = transactionData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TransactionData {
  TransactionData({
      this.tenantId,
      this.createdAt,
      this.renewalDate,});

  TransactionData.fromJson(dynamic json) {
    tenantId = json['tenantId'];
    createdAt = json['createdAt'];
    renewalDate = json['renewalDate'];
  }
  String? tenantId;
  String? createdAt;
  String? renewalDate;
TransactionData copyWith({  String? tenantId,
  String? createdAt,
  String? renewalDate,
}) => TransactionData(  tenantId: tenantId ?? this.tenantId,
  createdAt: createdAt ?? this.createdAt,
  renewalDate: renewalDate ?? this.renewalDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tenantId'] = tenantId;
    map['createdAt'] = createdAt;
    map['renewalDate'] = renewalDate;
    return map;
  }

}

class Tenants {
  Tenants({
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.profileImage,
      this.xampId,});

  Tenants.fromJson(dynamic json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    profileImage = json['profileImage'];
    xampId = json['xampId'];
  }
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;
  String? xampId;
Tenants copyWith({  String? userId,
  String? firstName,
  String? lastName,
  String? email,
  String? profileImage,
  String? xampId,
}) => Tenants(  userId: userId ?? this.userId,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  email: email ?? this.email,
  profileImage: profileImage ?? this.profileImage,
  xampId: xampId ?? this.xampId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['profileImage'] = profileImage;
    map['xampId'] = xampId;
    return map;
  }

}