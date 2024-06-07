class KycResponseStatus {
  KycResponseStatus({
      this.status, 
      this.message, 
      this.data,});

  KycResponseStatus.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? KYCData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  KYCData? data;
KycResponseStatus copyWith({  bool? status,
  String? message,
    KYCData? data,
}) => KycResponseStatus(  status: status ?? this.status,
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

class KYCData {
  KYCData({
      this.kycId, 
      this.userId, 
      this.fullName, 
      this.documentType, 
      this.approverId, 
      this.status,});

  KYCData.fromJson(dynamic json) {
    kycId = json['kycId'];
    userId = json['userId'];
    fullName = json['fullName'];
    documentType = json['documentType'];
    approverId = json['approverId'];
    status = json['status'];
  }
  String? kycId;
  String? userId;
  String? fullName;
  String? documentType;
  dynamic approverId;
  String? status;
KYCData copyWith({
    String? kycId,
  String? userId,
  String? fullName,
  String? documentType,
  dynamic approverId,
  String? status,
}) =>
      KYCData(
        kycId: kycId ?? this.kycId,
  userId: userId ?? this.userId,
  fullName: fullName ?? this.fullName,
  documentType: documentType ?? this.documentType,
  approverId: approverId ?? this.approverId,
  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kycId'] = kycId;
    map['userId'] = userId;
    map['fullName'] = fullName;
    map['documentType'] = documentType;
    map['approverId'] = approverId;
    map['status'] = status;
    return map;
  }

}