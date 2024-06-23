// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:enuaniculturalforummobile/repository/services/api/api_service.dart';

class AuthBackend extends ApiService {
  Future<dynamic> signInAdmin({
    required String email,
    required String password,
  }) async {
    return postMth(
      loginUri,
      headers: apiHeader,
      body: {'email': email, 'password': password},
    );
  }

  Future<dynamic> signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    return postMth(
      signUpUri,
      headers: apiHeader,
      body: {
        'name': fullName,
        'email': email,
        'password': password,
      },
    );
  }

  Future<dynamic> verifyEmail({
    required String email,
    required String otp,
  }) async {
    return postMth(
      verifyEmailUri,
      headers: apiHeader,
      body: {
        'email': email,
        "otp": otp,
      },
    );
  }

  Future<dynamic> sendAndResendOTP({
    required String email,
  }) async {
    return postMth(
      sendOTPUri,
      headers: apiHeader,
      body: {
        'email': email,
      },
    );
  }

  Future<dynamic> resetPassword({
    required String email,
    required String otp,
    required String password,
  }) async {
    return postMth(
      resetPasswordUri,
      headers: apiHeader,
      body: {'email': email, "otp": otp, "password": password},
    );
  }

  Future<dynamic> switchUserRole({
    required int role,
    required String accessToken,
  }) async {
    return postMth(
      switchUserRoleUri,
      headers:{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: '*/*',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      },
      body: {"role": role},
    );
  }



  Future<dynamic> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return postMth(
      changePasswordUri,
      headers: apiHeaderWithToken,
      body: {'password': newPassword, "oldPassword": oldPassword,},
    );
  }
  //
  // Future<dynamic> changePassword({
  //       required String oldPassword,
  //       required String password,
  //     }) async {
  //   return postMth(
  //      changePasswordUri,
  //     headers: apiHeader,
  //     body: {
  //       "password": password,
  //       "oldPassword": oldPassword
  //     },
  //   );
  // }
}
