class TransactionPinStatus {
  TransactionPinStatus({
      this.status, 
      this.message, 
      this.data,});

  TransactionPinStatus.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }
  bool? status;
  String? message;
  bool? data;
TransactionPinStatus copyWith({  bool? status,
  String? message,
  bool? data,
}) => TransactionPinStatus(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}