import 'dart:io';

import 'package:enuaniculturalforummobile/config/app_configs.dart';
import 'package:enuaniculturalforummobile/model/local/dummy_data.dart';

// https://musicalminds-be.onrender.com
class ApiConstants {
  // final persist = Persist();
  final String scheme = 'https';
  final String host = apiUrlHost!;
  final int receiveTimeout = 3000;
  final int sendTimeout = 2000;
  final String googlePlacesApiKey = "AIzaSyBmmJDKJshf79zx5eh71HwC7DaXep7s1LI";
  // final String apiVersion = '/v1';

  // final api = 'api';
  final version = 'v1';
  final authPath = 'auth';
  final userPath = 'user';

  Uri get signUpUri => Uri(
      scheme: scheme, host: host, path: 'api/register');

  Uri get loginUri => Uri(
      scheme: scheme, host: host, path: '/api/login');
  // Uri get loginUri => Uri(
  //     scheme: scheme, host: host, path: '$version/$authPath/$userPath/signin');

  Uri get sendOTPUri => Uri(
      scheme: scheme,
      host: host,
      path: '$version/$authPath/$userPath/send-otp');

  // Uri get changePasswordUri =>
  //     Uri(scheme: scheme, host: host, path: '$version/$authPath/$userPath/change-password');

  Uri get verifyEmailUri => Uri(
      scheme: scheme,
      host: host,
      path: '$version/$authPath/$userPath/verify-email');

  Uri get resetPasswordUri => Uri(
      scheme: scheme,
      host: host,
      path: '$version/$authPath/$userPath/reset-password');
  Uri get changePasswordUri => Uri(
      scheme: scheme,
      host: host,
      path: '$version/$authPath/$userPath/change-password');

  Uri get getProfileUri =>
      Uri(scheme: scheme, host: host, path: '$version/profile/user');

  // Uri get fetchListingsUri => Uri(scheme: scheme, host: host, path: '$version/listing/user');
  //
  //

  Uri fetchListingsUri({
    required String page,
    String? listingType,
    String? minPrice,
    String? maxPrice,
    String? minBathrooms,
    String? maxBathrooms,
    String? maxBedrooms,
    String? minBedrooms,
    String? propertyType,
    String? city,
    String? address,
    String? state,
    String? title,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/listing/user',
        queryParameters: {
          'limit': '5',
          'page': page,
          'listingType': listingType,
          'minPrice': minPrice ?? '',
          'maxPrice': maxPrice ?? '',
          'minBathrooms': minBathrooms ?? '',
          'maxBathrooms': maxBathrooms ?? '',
          'maxBedrooms': maxBedrooms ?? '',
          'minBedrooms': minBedrooms ?? '',
          'propertyType': propertyType ?? '',
          'city': city ?? '',
          'address': address ?? '',
          'state': state ?? '',
          'title': title ?? '',
        },
      );

  // Uri fetchSearchListingsUri({
  //   required String page,
  //   required String listingType,
  // }) =>
  //     Uri(
  //       scheme: scheme,
  //       host: host,
  //       path: '$version/listing/user',
  //       queryParameters: {
  //         'limit': '10',
  //         'page': page,
  //         'listingType': listingType,
  //       },
  //     );


  Uri fetchPersonalListingUri({
    required String page,
  }) =>
      Uri(
        scheme: scheme, host: host, path: '$version/listing/user/my-listings',
        queryParameters: {
          'limit': '10',
          'page': page,
        },);



  Uri get createNewListingUri =>
      Uri(scheme: scheme, host: host, path: '$version/listing/user');

  Uri get submitKYCUri =>
      Uri(scheme: scheme, host: host, path: '$version/kyc/$userPath/submit');

  Uri get fetchKYCStatusUri =>
      Uri(scheme: scheme, host: host, path: '$version/kyc/$userPath/status');

  Uri get createTrxRecordUri => Uri(
      scheme: scheme,
      host: host,
      path: '$version/transaction/tenant/create-record');

  Uri get updateUserProfileUri =>
      Uri(scheme: scheme, host: host, path: '$version/profile/user');
  Uri get deleteUserProfileUri =>
      Uri(scheme: scheme, host: host, path: '$version/profile/user');
  Uri get setTransactionPinUri => Uri(
      scheme: scheme, host: host, path: '$version/$authPath/$userPath/set-pin');
  Uri get resetTransactionPinUri => Uri(
      scheme: scheme,
      host: host,
      path: '$version/$authPath/$userPath/reset-pin');
  Uri get switchUserRoleUri => Uri(
      scheme: scheme,
      host: host,
      path: '$version/$authPath/$userPath/switch-role');

  Uri get addBankAccountNumberUri =>
      Uri(scheme: scheme, host: host, path: '$version/payment/user/add-bank');

  Uri get fetchAllBanksUri =>
      Uri(scheme: scheme, host: host, path: '$version/payment/user/banks');
  Uri get checkTransactionPinStateUri =>
      Uri(scheme: scheme, host: host, path: '$version/auth/user/is-pin-set');

  Uri get validateCustomerBankAccountUri => Uri(
      scheme: scheme, host: host, path: '$version/payment/user/validate-bank');

  Uri get fetchAllPostsUri => Uri(
      scheme: scheme, host: host, path: '/api/get-all-posts');
  Uri get fetchAllCategoryUri => Uri(
      scheme: scheme, host: host, path: '/api/get-categories');
  Uri get createNewPostUri =>
      Uri(scheme: scheme, host: host, path: '/api/create-post');
  // Uri get sendFundToAnotherWalletUri => Uri(scheme: scheme, host: host, path: '$version/transaction/tenant/transfer');

  Uri get deleteBankAccountNumberUri => Uri(
      scheme: scheme, host: host, path: '$version/payment/user/delete-bank');
  Uri get createWithdrawalRequestUri =>
      Uri(scheme: scheme, host: host, path: '$version/withdrawal/landlord');
  Uri get sendFundToAnotherWalletUri => Uri(
      scheme: scheme, host: host, path: '$version/transaction/tenant/transfer');
  Uri get rentAPropertyUri =>
      Uri(scheme: scheme, host: host, path: '$version/transaction/listing');
  Uri get viewTenantsUri =>
      Uri(scheme: scheme, host: host, path: '$version/misc/landlord/view-tenants');

  Uri get approveOrRejectListingTransactionRequestUri => Uri(
      scheme: scheme, host: host, path: '$version/transaction/landlord/listing/approve-reject');
  Uri get requestAccessToListingUri => Uri(
      scheme: scheme, host: host, path: '$version/transaction/listing/request-access');

  Uri walletBalanceUri({
    required int userType,
  }) =>
      Uri(
          scheme: scheme,
          host: host,
          path:
              '$version/wallet/${userType == 1 ? 'guest' : userType == 2 ? 'tenant' : 'landlord'}/balance');

  Uri trxHistoryUri({
    required int userType,
    required String page,
  }) =>
      Uri(
          scheme: scheme,
          host: host,
          path: '$version/transaction/${userType == 1 ? 'guest' : userType == 2 ? 'tenant' : 'landlord'}/history',
        queryParameters: {
          'limit': '20',
          'page': page,
        },);

  Uri fetchSingleListingUri({
    required String id,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/listing/user/$id',
      );

  Uri fetchSingleListingWithCodeUri({
    required String code,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/listing/user/code/$code',
      );

  Uri viewTenantsByListingIdUri({
    required String id,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/misc/landlord/view-tenants/$id',
      );

  Uri fetchListingRentalRequestUri({
    required String id,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/transaction/landlord/listing/$id',
      );
  Uri fetchListingAccessRequestUri({
    required String id,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/transaction/landlord/listing/access-requests/$id',
      );

  Uri updateListingUri({
    required String id,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/listing/user/$id',
      );

  Uri deleteListingUri({
    required String id,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: '$version/listing/user/$id',
      );

  //
  // Uri  getEmployersUri ({ required String page, required String searchString}) => Uri(
  //   scheme: scheme,
  //   host: host,
  //   path: 'ew-admin/organization',
  //   queryParameters: {'limit': '20', 'page': page, 'search': searchString},
  // );
  //

  // static final token = Provider((ref) => ref.watch(regViewModelProvider).token);
//*! can be modified
  Map<String, String> apiHeader = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: '*/*',
  };

  Map<String, String> apiHeaderWithToken = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.authorizationHeader: 'Bearer ${DummyData.accessToken}',
    // 'Content-Type': 'multipart/form-data'
  };
  Map<String, String> apiHeaderWithFormData = {
    
    'Content-Type': 'multipart/form-data',
    'Authorization': 'Bearer 7|G0oRsDb8iXRRKgRb4V9OJhRPYTla6Ryk1LPRb4yWf1156a00',
    // 'Content-Type': 'multipart/form-data'
  };


  var termsOfSServicesUrl = 'https://getxamp.com/terms-of-service';
  var privacyPolicyUrl = 'https://getxamp.com/privacy-policy';
  var faqsUrl = 'https://getxamp.com/faqs';
  var aboutUrl = 'https://getxamp.com/about';

  // Map<String, String> apiHeaderWithToken(String token) {
  //   return {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  // }
}
