class BankAccountValidatedResponse {
  String? accountNumber;
  String? accountName;
  String? bankCode;

  BankAccountValidatedResponse({
    this.accountNumber,
    this.accountName,
    this.bankCode,
  });

  BankAccountValidatedResponse copyWith({
    String? accountNumber,
    String? accountName,
    String? bankCode,
  }) {
    return BankAccountValidatedResponse(
      accountNumber: accountNumber ?? this.accountNumber,
      accountName: accountName ?? this.accountName,
      bankCode: bankCode ?? this.bankCode,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'accountName': accountName,
      'bankCode': bankCode,
    };
  }

  factory BankAccountValidatedResponse.fromJson(Map<String, dynamic> json) {
    return BankAccountValidatedResponse(
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
      bankCode: json['bankCode'] as String?,
    );
  }

  @override
  String toString() =>
      "BankAccountValidatedResponse(accountNumber: $accountNumber,accountName: $accountName,bankCode: $bankCode)";

  @override
  int get hashCode => Object.hash(accountNumber, accountName, bankCode);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BankAccountValidatedResponse &&
          runtimeType == other.runtimeType &&
          accountNumber == other.accountNumber &&
          accountName == other.accountName &&
          bankCode == other.bankCode;
}
