import 'dart:io';

import 'package:enuaniculturalforummobile/repository/services/api/api_service.dart';

class TransactionBackend extends ApiService {


  Future<dynamic> fetchTransactions({required int userType,  int? page = 1,}) async {
    return getMth(
      trxHistoryUri(userType: userType, page: page.toString()  ),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchAcctBalance({required int userType}) async {
    return getMth(
      walletBalanceUri(userType: userType ),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> setTransactionPin({
    required String pin,
  }) async {
    return postMth(
      setTransactionPinUri,
      headers: apiHeaderWithToken,
      body: {
        'pin': pin,
      },
    );
  }

  Future<dynamic> createTrxRecord({
    required String amount,
    required String paymentReference,
  }) async {
    return postMth(
      createTrxRecordUri,
      headers: apiHeaderWithToken,
      body: {
        "amount": amount,
        "paymentReference": paymentReference
      },
    );
  }

  Future<dynamic> resetTransactionPin({
    required String newPin,
    required String otp,
  }) async {
    return postMth(
      resetTransactionPinUri,
      headers: apiHeaderWithToken,
      body: {
        'newPin': newPin,
        'otp': otp,
      },
    );
  }

  Future<dynamic> checkTransactionPinState() async {
    return postMth(
      checkTransactionPinStateUri,
      headers: apiHeaderWithToken,
      body: {
        // 'newPin': '1234',
        // 'otp': otp,
      },
    );
  }


  Future<dynamic> createWithdrawalRequest({
    required String amount,
  }) async {
    return postMth(
      createWithdrawalRequestUri,
      headers: apiHeaderWithToken,
      body: {
        "amount": amount,
      },
    );
  }


  Future<dynamic> sendFundToAnotherWallet({
    required String amount,
    required String receiverId,
    required String listingId,
    required String accessToken,required String transactionPin,
  }) async {
    return postMth(
      sendFundToAnotherWalletUri,
      headers:{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: '*/*',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        'x-transaction-pin':transactionPin

    },
      body: {
        "amount": amount,
        "receiverId": receiverId,
        "listingId": listingId

      },
    );
  }


  Future<dynamic> rentAProperty({
    // required String tenantId,
    // required String landlordId,
    required String listingId,
    required String numberOfUnits,
    required String transactionType,
    required String renewalDate,
    required String accessToken,
    required String transactionPin
  }) async {
    return postMth(
      rentAPropertyUri,
      headers:{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: '*/*',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
        'x-transaction-pin':transactionPin

      },
      body: {
        // "tenantId": tenantId,

        // "landlordId": landlordId,
        "listingId": listingId,
        "numberOfUnits": 1,
        "transactionType": transactionType,
        "renewalDate": renewalDate
    // "renewalDate": "2025-02-03"

      },
    );
  }


}
