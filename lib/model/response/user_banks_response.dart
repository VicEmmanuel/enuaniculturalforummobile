class UserBanksResponse {
  bool? status;
  String? message;
  BankStatusData? data;

  UserBanksResponse({
    this.status,
    this.message,
    this.data,
  });

  UserBanksResponse copyWith({
    bool? status,
    String? message,
    BankStatusData? data,
  }) {
    return UserBanksResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory UserBanksResponse.fromJson(Map<String, dynamic> json) {
    return UserBanksResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : BankStatusData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() => "UserBanksResponse(status: $status,message: $message,data: $data)";

  @override
  int get hashCode => Object.hash(status, message, data);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserBanksResponse &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          message == other.message &&
          data == other.data;
}

class BankStatusData {
  bool? status;
  List<BankStatusData>? data;
  String? message;

  BankStatusData({
    this.status,
    this.data,
    this.message,
  });

  BankStatusData copyWith({
    bool? status,
    List<BankStatusData>? data,
    String? message,
  }) {
    return BankStatusData(
      status: status ?? this.status,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data,
      'message': message,
    };
  }

  factory BankStatusData.fromJson(Map<String, dynamic> json) {
    return BankStatusData(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BankStatusData.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );
  }

  @override
  String toString() => "Data(status: $status,data: $data,message: $message)";

  @override
  int get hashCode => Object.hash(status, data, message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankStatusData &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          data == other.data &&
          message == other.message;
}

class BanksData {
  String? name;
  String? code;
  String? ussdTemplate;
  String? baseUssdCode;
  String? transferUssdTemplate;
  String? bankId;
  String? nipBankCode;

  BanksData({
    this.name,
    this.code,
    this.ussdTemplate,
    this.baseUssdCode,
    this.transferUssdTemplate,
    this.bankId,
    this.nipBankCode,
  });

  BanksData copyWith({
    String? name,
    String? code,
    String? ussdTemplate,
    String? baseUssdCode,
    String? transferUssdTemplate,
    String? bankId,
    String? nipBankCode,
  }) {
    return BanksData(
      name: name ?? this.name,
      code: code ?? this.code,
      ussdTemplate: ussdTemplate ?? this.ussdTemplate,
      baseUssdCode: baseUssdCode ?? this.baseUssdCode,
      transferUssdTemplate: transferUssdTemplate ?? this.transferUssdTemplate,
      bankId: bankId ?? this.bankId,
      nipBankCode: nipBankCode ?? this.nipBankCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'ussdTemplate': ussdTemplate,
      'baseUssdCode': baseUssdCode,
      'transferUssdTemplate': transferUssdTemplate,
      'bankId': bankId,
      'nipBankCode': nipBankCode,
    };
  }

  factory BanksData.fromJson(Map<String, dynamic> json) {
    return BanksData(
      name: json['name'] as String?,
      code: json['code'] as String?,
      ussdTemplate: json['ussdTemplate'] as String?,
      baseUssdCode: json['baseUssdCode'] as String?,
      transferUssdTemplate: json['transferUssdTemplate'] as String?,
      bankId: json['bankId'] as String?,
      nipBankCode: json['nipBankCode'] as String?,
    );
  }

  @override
  String toString() =>
      "Data(name: $name,code: $code,ussdTemplate: $ussdTemplate,baseUssdCode: $baseUssdCode,transferUssdTemplate: $transferUssdTemplate,bankId: $bankId,nipBankCode: $nipBankCode)";

  @override
  int get hashCode => Object.hash(
      name, code, ussdTemplate, baseUssdCode, transferUssdTemplate, bankId, nipBankCode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BanksData &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          code == other.code &&
          ussdTemplate == other.ussdTemplate &&
          baseUssdCode == other.baseUssdCode &&
          transferUssdTemplate == other.transferUssdTemplate &&
          bankId == other.bankId &&
          nipBankCode == other.nipBankCode;
}
