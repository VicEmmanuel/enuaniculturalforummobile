class BankResponseModel {
  BankResponseModel({
      this.status, 
      this.message, 
      this.data,});

  BankResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;
BankResponseModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => BankResponseModel(  status: status ?? this.status,
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
      this.status, 
      this.banks, 
      this.message,});

  Data.fromJson(dynamic json) {
    status = json['status'];
    if (json['banks'] != null) {
      banks = [];
      json['banks'].forEach((v) {
        banks?.add(Banks.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<Banks>? banks;
  String? message;
Data copyWith({  bool? status,
  List<Banks>? banks,
  String? message,
}) => Data(  status: status ?? this.status,
  banks: banks ?? this.banks,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (banks != null) {
      map['banks'] = banks?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

class Banks {
  Banks({
      this.name, 
      this.code, 
      this.ussdTemplate, 
      this.baseUssdCode, 
      this.transferUssdTemplate, 
      this.bankId, 
      this.nipBankCode,});

  Banks.fromJson(dynamic json) {
    name = json['name'];
    code = json['code'];
    ussdTemplate = json['ussdTemplate'];
    baseUssdCode = json['baseUssdCode'];
    transferUssdTemplate = json['transferUssdTemplate'];
    bankId = json['bankId'];
    nipBankCode = json['nipBankCode'];
  }
  String? name;
  String? code;
  dynamic ussdTemplate;
  dynamic baseUssdCode;
  dynamic transferUssdTemplate;
  dynamic bankId;
  String? nipBankCode;
Banks copyWith({  String? name,
  String? code,
  dynamic ussdTemplate,
  dynamic baseUssdCode,
  dynamic transferUssdTemplate,
  dynamic bankId,
  String? nipBankCode,
}) => Banks(  name: name ?? this.name,
  code: code ?? this.code,
  ussdTemplate: ussdTemplate ?? this.ussdTemplate,
  baseUssdCode: baseUssdCode ?? this.baseUssdCode,
  transferUssdTemplate: transferUssdTemplate ?? this.transferUssdTemplate,
  bankId: bankId ?? this.bankId,
  nipBankCode: nipBankCode ?? this.nipBankCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['code'] = code;
    map['ussdTemplate'] = ussdTemplate;
    map['baseUssdCode'] = baseUssdCode;
    map['transferUssdTemplate'] = transferUssdTemplate;
    map['bankId'] = bankId;
    map['nipBankCode'] = nipBankCode;
    return map;
  }

}