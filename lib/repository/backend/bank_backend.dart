import 'package:enuaniculturalforummobile/repository/services/api/api_service.dart';

class BankBackend extends ApiService {
  Future<dynamic> validateCustomerBankAccount({
    required String accountNumber,
    required String bankCode,
  }) async {
    return postMth(
      validateCustomerBankAccountUri,
      body: {
        "accountNumber": accountNumber,
        "bankCode": bankCode,
      },
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchLandlordsBanks() async {
    return getMth(
      fetchLandlordsBankAccountDetailsUri,
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchAllBanks() async {
    return getMth(
      fetchAllBanksUri,
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> addBankAccountNumber({
    required String accountNumber,
    required String accountName,
    required String bankName,
    required String bankCode,
  }) async {
    return postMth(
      addBankAccountNumberUri,
      headers: apiHeaderWithToken,
      body: {
        "accountNumber": accountNumber,
        "accountName": accountName,
        "bankCode": bankCode,
        "bankName": bankName,
      },
    );
  }

  Future<dynamic> deleteBankAccountNumber() async {
    return deleteMth(
      deleteBankAccountNumberUri,
      headers: apiHeaderWithToken,
    );
  }
}
