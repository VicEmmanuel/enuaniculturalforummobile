/// status : true
/// message : "Transaction history fetched successfully"
/// data : {"total":3,"transactions":[{"transactionId":"d3dc435d-293a-476b-936d-695baeba8dc7","senderId":"ec1e4877-67b8-411c-a43f-8edaee432ed1","transactionType":"credit","transactionReference":"403c1d70-5fa1-48c1-97a5-e769996dfe12","paymentReference":"INTERNAL_TRANSFER-3827102c","paymentMethod":"wallet","paymentDescription":"Payment received for listing 3044b44c-d424-401d-8465-60ef10a60fd2","status":"success","amount":650000,"receiverId":"94dbe9ec-654f-4683-8985-812e7406fb38","listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","createdAt":"2024-03-10T19:55:25.239Z","sender":{"firstName":"Chukwuebuka","lastName":"BM","xampId":"XAMP53141"},"receiver":{"firstName":"Josh","lastName":"Emmanuel","xampId":"XAMP25047"}},{"transactionId":"410c5092-ab19-4780-b59e-1b09c6ea3ae5","senderId":"9eb09d51-0ffd-426f-95ba-5d80f6fb619d","transactionType":"credit","transactionReference":"8e508969-e797-4b20-a37a-fdbca72f282c","paymentReference":"INTERNAL_TRANSFER-d5d67b6c","paymentMethod":"wallet","paymentDescription":"Payment received for listing 3044b44c-d424-401d-8465-60ef10a60fd2","status":"success","amount":650000,"receiverId":"94dbe9ec-654f-4683-8985-812e7406fb38","listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","createdAt":"2024-03-15T08:57:38.943Z","sender":{"firstName":"Obodoagwu","lastName":"Victory","xampId":"XAMP22185"},"receiver":{"firstName":"Josh","lastName":"Emmanuel","xampId":"XAMP25047"}},{"transactionId":"c7c17f87-9fbd-475a-8d8b-8fc5bc306afe","senderId":"9eb09d51-0ffd-426f-95ba-5d80f6fb619d","transactionType":"credit","transactionReference":"96d66919-34ad-4428-8d28-e93c5287fd28","paymentReference":"INTERNAL_TRANSFER-1ab17919","paymentMethod":"wallet","paymentDescription":"Payment received for listing 3044b44c-d424-401d-8465-60ef10a60fd2","status":"success","amount":650000,"receiverId":"94dbe9ec-654f-4683-8985-812e7406fb38","listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","createdAt":"2024-03-15T14:59:20.430Z","sender":{"firstName":"Obodoagwu","lastName":"Victory","xampId":"XAMP22185"},"receiver":{"firstName":"Josh","lastName":"Emmanuel","xampId":"XAMP25047"}}],"page":1,"lastPage":1}

class TrxHistoryResponse {
  TrxHistoryResponse({
      this.status, 
      this.message, 
      this.data,});

  TrxHistoryResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;
TrxHistoryResponse copyWith({  bool? status,
  String? message,
  Data? data,
}) => TrxHistoryResponse(  status: status ?? this.status,
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

/// total : 3
/// transactions : [{"transactionId":"d3dc435d-293a-476b-936d-695baeba8dc7","senderId":"ec1e4877-67b8-411c-a43f-8edaee432ed1","transactionType":"credit","transactionReference":"403c1d70-5fa1-48c1-97a5-e769996dfe12","paymentReference":"INTERNAL_TRANSFER-3827102c","paymentMethod":"wallet","paymentDescription":"Payment received for listing 3044b44c-d424-401d-8465-60ef10a60fd2","status":"success","amount":650000,"receiverId":"94dbe9ec-654f-4683-8985-812e7406fb38","listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","createdAt":"2024-03-10T19:55:25.239Z","sender":{"firstName":"Chukwuebuka","lastName":"BM","xampId":"XAMP53141"},"receiver":{"firstName":"Josh","lastName":"Emmanuel","xampId":"XAMP25047"}},{"transactionId":"410c5092-ab19-4780-b59e-1b09c6ea3ae5","senderId":"9eb09d51-0ffd-426f-95ba-5d80f6fb619d","transactionType":"credit","transactionReference":"8e508969-e797-4b20-a37a-fdbca72f282c","paymentReference":"INTERNAL_TRANSFER-d5d67b6c","paymentMethod":"wallet","paymentDescription":"Payment received for listing 3044b44c-d424-401d-8465-60ef10a60fd2","status":"success","amount":650000,"receiverId":"94dbe9ec-654f-4683-8985-812e7406fb38","listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","createdAt":"2024-03-15T08:57:38.943Z","sender":{"firstName":"Obodoagwu","lastName":"Victory","xampId":"XAMP22185"},"receiver":{"firstName":"Josh","lastName":"Emmanuel","xampId":"XAMP25047"}},{"transactionId":"c7c17f87-9fbd-475a-8d8b-8fc5bc306afe","senderId":"9eb09d51-0ffd-426f-95ba-5d80f6fb619d","transactionType":"credit","transactionReference":"96d66919-34ad-4428-8d28-e93c5287fd28","paymentReference":"INTERNAL_TRANSFER-1ab17919","paymentMethod":"wallet","paymentDescription":"Payment received for listing 3044b44c-d424-401d-8465-60ef10a60fd2","status":"success","amount":650000,"receiverId":"94dbe9ec-654f-4683-8985-812e7406fb38","listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","createdAt":"2024-03-15T14:59:20.430Z","sender":{"firstName":"Obodoagwu","lastName":"Victory","xampId":"XAMP22185"},"receiver":{"firstName":"Josh","lastName":"Emmanuel","xampId":"XAMP25047"}}]
/// page : 1
/// lastPage : 1

class Data {
  Data({
      this.total, 
      this.transactions, 
      this.page, 
      this.lastPage,});

  Data.fromJson(dynamic json) {
    total = json['total'];
    if (json['transactions'] != null) {
      transactions = [];
      json['transactions'].forEach((v) {
        transactions?.add(Transactions.fromJson(v));
      });
    }
    page = json['page'];
    lastPage = json['lastPage'];
  }
  num? total;
  List<Transactions>? transactions;
  num? page;
  num? lastPage;
Data copyWith({  num? total,
  List<Transactions>? transactions,
  num? page,
  num? lastPage,
}) => Data(  total: total ?? this.total,
  transactions: transactions ?? this.transactions,
  page: page ?? this.page,
  lastPage: lastPage ?? this.lastPage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    if (transactions != null) {
      map['transactions'] = transactions?.map((v) => v.toJson()).toList();
    }
    map['page'] = page;
    map['lastPage'] = lastPage;
    return map;
  }

}

/// transactionId : "d3dc435d-293a-476b-936d-695baeba8dc7"
/// senderId : "ec1e4877-67b8-411c-a43f-8edaee432ed1"
/// transactionType : "credit"
/// transactionReference : "403c1d70-5fa1-48c1-97a5-e769996dfe12"
/// paymentReference : "INTERNAL_TRANSFER-3827102c"
/// paymentMethod : "wallet"
/// paymentDescription : "Payment received for listing 3044b44c-d424-401d-8465-60ef10a60fd2"
/// status : "success"
/// amount : 650000
/// receiverId : "94dbe9ec-654f-4683-8985-812e7406fb38"
/// listingId : "3044b44c-d424-401d-8465-60ef10a60fd2"
/// createdAt : "2024-03-10T19:55:25.239Z"
/// sender : {"firstName":"Chukwuebuka","lastName":"BM","xampId":"XAMP53141"}
/// receiver : {"firstName":"Josh","lastName":"Emmanuel","xampId":"XAMP25047"}

class Transactions {
  Transactions({
      this.transactionId, 
      this.senderId, 
      this.transactionType, 
      this.transactionReference, 
      this.paymentReference, 
      this.paymentMethod, 
      this.paymentDescription, 
      this.status, 
      this.amount, 
      this.receiverId, 
      this.listingId, 
      this.createdAt, 
      this.sender, 
      this.receiver,});

  Transactions.fromJson(dynamic json) {
    transactionId = json['transactionId'];
    senderId = json['senderId'];
    transactionType = json['transactionType'];
    transactionReference = json['transactionReference'];
    paymentReference = json['paymentReference'];
    paymentMethod = json['paymentMethod'];
    paymentDescription = json['paymentDescription'];
    status = json['status'];
    amount = json['amount'];
    receiverId = json['receiverId'];
    listingId = json['listingId'];
    createdAt = json['createdAt'];
    sender = json['sender'] != null ? Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null ? Receiver.fromJson(json['receiver']) : null;
  }
  String? transactionId;
  String? senderId;
  String? transactionType;
  String? transactionReference;
  String? paymentReference;
  String? paymentMethod;
  String? paymentDescription;
  String? status;
  num? amount;
  String? receiverId;
  String? listingId;
  String? createdAt;
  Sender? sender;
  Receiver? receiver;
Transactions copyWith({  String? transactionId,
  String? senderId,
  String? transactionType,
  String? transactionReference,
  String? paymentReference,
  String? paymentMethod,
  String? paymentDescription,
  String? status,
  num? amount,
  String? receiverId,
  String? listingId,
  String? createdAt,
  Sender? sender,
  Receiver? receiver,
}) => Transactions(  transactionId: transactionId ?? this.transactionId,
  senderId: senderId ?? this.senderId,
  transactionType: transactionType ?? this.transactionType,
  transactionReference: transactionReference ?? this.transactionReference,
  paymentReference: paymentReference ?? this.paymentReference,
  paymentMethod: paymentMethod ?? this.paymentMethod,
  paymentDescription: paymentDescription ?? this.paymentDescription,
  status: status ?? this.status,
  amount: amount ?? this.amount,
  receiverId: receiverId ?? this.receiverId,
  listingId: listingId ?? this.listingId,
  createdAt: createdAt ?? this.createdAt,
  sender: sender ?? this.sender,
  receiver: receiver ?? this.receiver,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['transactionId'] = transactionId;
    map['senderId'] = senderId;
    map['transactionType'] = transactionType;
    map['transactionReference'] = transactionReference;
    map['paymentReference'] = paymentReference;
    map['paymentMethod'] = paymentMethod;
    map['paymentDescription'] = paymentDescription;
    map['status'] = status;
    map['amount'] = amount;
    map['receiverId'] = receiverId;
    map['listingId'] = listingId;
    map['createdAt'] = createdAt;
    if (sender != null) {
      map['sender'] = sender?.toJson();
    }
    if (receiver != null) {
      map['receiver'] = receiver?.toJson();
    }
    return map;
  }

}

/// firstName : "Josh"
/// lastName : "Emmanuel"
/// xampId : "XAMP25047"

class Receiver {
  Receiver({
      this.firstName, 
      this.lastName, 
      this.xampId,});

  Receiver.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    xampId = json['xampId'];
  }
  String? firstName;
  String? lastName;
  String? xampId;
Receiver copyWith({  String? firstName,
  String? lastName,
  String? xampId,
}) => Receiver(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  xampId: xampId ?? this.xampId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['xampId'] = xampId;
    return map;
  }

}

/// firstName : "Chukwuebuka"
/// lastName : "BM"
/// xampId : "XAMP53141"

class Sender {
  Sender({
      this.firstName, 
      this.lastName, 
      this.xampId,});

  Sender.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    xampId = json['xampId'];
  }
  String? firstName;
  String? lastName;
  String? xampId;
Sender copyWith({  String? firstName,
  String? lastName,
  String? xampId,
}) => Sender(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  xampId: xampId ?? this.xampId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['xampId'] = xampId;
    return map;
  }

}