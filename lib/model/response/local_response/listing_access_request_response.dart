class ListingAccessRequestResponse {
  ListingAccessRequestResponse({
      this.status, 
      this.message, 
      this.data,});

  ListingAccessRequestResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? status;
  String? message;
  List<Data>? data;
ListingAccessRequestResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => ListingAccessRequestResponse(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.transactionId, 
      this.tenantId, 
      this.landlordId, 
      this.listingId, 
      this.transactionType, 
      this.amount, 
      this.numberOfUnits, 
      this.transactionDate, 
      this.renewalDate, 
      this.status, 
      this.tenant,});

  Data.fromJson(dynamic json) {
    transactionId = json['transactionId'];
    tenantId = json['tenantId'];
    landlordId = json['landlordId'];
    listingId = json['listingId'];
    transactionType = json['transactionType'];
    amount = json['amount'];
    numberOfUnits = json['numberOfUnits'];
    transactionDate = json['transactionDate'];
    renewalDate = json['renewalDate'];
    status = json['status'];
    tenant = json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null;
  }
  String? transactionId;
  String? tenantId;
  String? landlordId;
  String? listingId;
  String? transactionType;
  num? amount;
  num? numberOfUnits;
  String? transactionDate;
  String? renewalDate;
  String? status;
  Tenant? tenant;
Data copyWith({  String? transactionId,
  String? tenantId,
  String? landlordId,
  String? listingId,
  String? transactionType,
  num? amount,
  num? numberOfUnits,
  String? transactionDate,
  String? renewalDate,
  String? status,
  Tenant? tenant,
}) => Data(  transactionId: transactionId ?? this.transactionId,
  tenantId: tenantId ?? this.tenantId,
  landlordId: landlordId ?? this.landlordId,
  listingId: listingId ?? this.listingId,
  transactionType: transactionType ?? this.transactionType,
  amount: amount ?? this.amount,
  numberOfUnits: numberOfUnits ?? this.numberOfUnits,
  transactionDate: transactionDate ?? this.transactionDate,
  renewalDate: renewalDate ?? this.renewalDate,
  status: status ?? this.status,
  tenant: tenant ?? this.tenant,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transactionId'] = transactionId;
    map['tenantId'] = tenantId;
    map['landlordId'] = landlordId;
    map['listingId'] = listingId;
    map['transactionType'] = transactionType;
    map['amount'] = amount;
    map['numberOfUnits'] = numberOfUnits;
    map['transactionDate'] = transactionDate;
    map['renewalDate'] = renewalDate;
    map['status'] = status;
    if (tenant != null) {
      map['tenant'] = tenant?.toJson();
    }
    return map;
  }

}

class Tenant {
  Tenant({
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phoneNumber, 
      this.profileImage,});

  Tenant.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    profileImage = json['profileImage'];
  }
  String? firstName;
  String? lastName;
  String? email;
  dynamic phoneNumber;
  String? profileImage;
Tenant copyWith({  String? firstName,
  String? lastName,
  String? email,
  dynamic phoneNumber,
  String? profileImage,
}) => Tenant(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  email: email ?? this.email,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  profileImage: profileImage ?? this.profileImage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['profileImage'] = profileImage;
    return map;
  }

}