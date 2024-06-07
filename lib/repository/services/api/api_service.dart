// ignore_for_file: avoid_dynamic_calls, depend_on_referenced_packages, strict_raw_type, inference_failure_on_function_invocation

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:enuaniculturalforummobile/repository/exceptions/custom_exception.dart';
import 'package:enuaniculturalforummobile/repository/network/api_constants.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

class ApiService extends ApiConstants with RetryFunc {
  // final logger = getLogger('Logger');
  // final client = http.Client();

  final dio = Dio();

  Future<dynamic> postMth(
    Uri uri, {
    bool isSearch = false,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    bool canShowToast = true,
    bool showSuccessToast = false,
  }) async {
    logger.i('Making request to $uri');
    logger.i(body);

    final options = Options(headers: headers, responseType: ResponseType.json);
    try {
      final response = await dio
          .post(
            uri.toString(),
            data: jsonEncode(body),
            options: options,
          )
          .timeout(
            const Duration(seconds: 30),
          );



      return _dioResponse(response, canShowToast: canShowToast);
    } on SocketException catch (e) {
      logger.e(e);
      showToast(
        msg: 'Connection error\nCheck internet and try again',
        isError: true,
      );
      throw InternetException(e.toString());
    } on DioException catch (error) {
      logger.e(error.response!.statusCode);
      logger.e(error.response!.data);
      showToast(
        msg: UtilFunctions.capitalizeAllWord(
            error.response!.data['message'] ?? "Something went wrong"),
        isError: true,
      );
    } on FormatException catch (error) {
      logger.e('FormatException: ${error.message}');
      showToast(
        msg: error.message.toString(),
        isError: true,
      );
      // throw HttpException('Bad response format: ${error.message}');
      debugPrint(error.message);
    } on TimeoutException {
      showToast(
        msg: 'Server connection time out',
        isError: true,
      );
      throw RequestTimeoutException('Request Timed out');
    } catch (error) {

      logger.e(error);

      throw HttpException('Something went wrong, $error');
    }
  }

  Future<dynamic> patchMth(
    Uri uri, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool canShowToast = true,
    bool showSuccessToast = false,
  }) async {
    logger.i('Making request to $uri');
    final options = Options(headers: headers, responseType: ResponseType.plain);
    try {
      final response = await dio
          .patch(
            uri.toString(),
            data: FormData.fromMap(body!),
            options: options,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return _dioResponse(
        response,
        canShowToast: canShowToast,
        canShowSuccessToast: showSuccessToast,
      );
    } on SocketException catch (e) {
      logger.e(e);
      showToast(
        msg: 'Connection error\nCheck internet and try again',
        isError: true,
      );
      throw InternetException(e.toString());
    } on FormatException catch (error) {
      logger.e('FormatException: $error');
      throw HttpException('Bad response format: $error');
    } on TimeoutException {
      showToast(
        msg: 'Server connection time out',
        isError: true,
      );
      throw RequestTimeoutException('Request Timed out');
    } catch (error) {
      throw HttpException('Something went wrong, $error');
    }
  }

  Future<dynamic> putMth(
    Uri uri, {
    bool isSearch = false,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    bool canShowToast = true,
    bool showSuccessToast = false,
  }) async {
    logger.i('Making request to $uri');
    final options = Options(headers: headers, responseType: ResponseType.plain);
    try {
      final response = await dio
          .put(
            uri.toString(),
            data: FormData.fromMap(body!),
            options: options,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return _dioResponse(response, canShowToast: canShowToast);
    } on SocketException catch (e) {
      logger.e(e);
      //showToast(
      //   msg: 'Connection error\nCheck internet and try again',
      //   isError: true,
      // );
      throw InternetException(e.toString());
    } on FormatException catch (error) {
      logger.e('FormatException: ${error.message}');
      // throw HttpException('Bad response format: ${error.message}');
      debugPrint(error.message);
    } on TimeoutException {
      //showToast(
      //   msg: 'Server connection time out',
      //   isError: true,
      // );
      throw RequestTimeoutException('Request Timed out');
    } catch (error) {
      throw HttpException('Something went wrong, $error');
    }
  }

  Future<dynamic> getMth(
    Uri uri, {
    Map<String, String>? headers,
    bool canShowToast = false,
  }) async {
    logger.i('Making request to $uri');
    final options = Options(headers: headers, responseType: ResponseType.plain);
    try {
      final response = await dio
          .get(
            uri.toString(),
            options: options,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      log(response.requestOptions.path);
      log(response.data);
      return _dioResponse(
        response,
      );

    } on SocketException catch (e) {
      logger.e(e);
      //showToast(
      //   msg: 'Connection error\nCheck internet and try again',
      //   isError: true,
      // );
      throw InternetException(e.toString());
    } on DioException catch (error) {
      logger.e(error.response!.statusCode);
      logger.e(error.response!.data.toString() + error.requestOptions.path.toString());
      var decodedRes = jsonDecode(error.response!.data);

      if(canShowToast){
        showToast(
          msg: UtilFunctions.capitalizeAllWord(
              decodedRes['message'] ?? error.response!.data['message'] ??  "Something went wrong"),
          isError: true,
        );
      }

    } on FormatException catch (error) {
      logger.e('FormatException: $error');
      throw HttpException('Bad response format: $error');
    } on TimeoutException {
      //showToast(
      //   msg: 'Server connection time out',
      //   isError: true,
      // );
      throw RequestTimeoutException('Request Timed out');
    } catch (error) {
      throw HttpException('Something went wrong, $error');
    }
  }

  Future<dynamic> deleteMth(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    logger.i('Making request to $uri');
    final options = Options(headers: headers, responseType: ResponseType.plain);
    try {
      final response = await dio
          .delete(
            uri.toString(),
            options: options,
          )
          .timeout(
            const Duration(seconds: 30),
          );

      return _dioResponse(
        response,
      );
    } on SocketException catch (e) {
      logger.e(e);
      //showToast(
      //   msg: 'Connection error\nCheck internet and try again',
      //   isError: true,
      // );
      throw InternetException(e.toString());
    } on FormatException catch (error) {
      logger.e('FormatException: $error');
      throw HttpException('Bad response format: $error');
    } on TimeoutException {
      //showToast(
      //   msg: 'Server connection time out',
      //   isError: true,
      // );
      throw RequestTimeoutException('Request Timed out');
    } catch (error) {
      throw HttpException('Something went wrong, $error');
    }
  }


  Future<dynamic> uploadMth(
    Uri uri, {
    required FormData data,
    required Map<String, dynamic>? headers,
    bool canShowToast =true,
    // bool showSuccessToast =false,
  }) async {
    logger.i('Making request to $uri');
    logger.i(data.fields);
    final options = Options(headers: headers, responseType: ResponseType.plain);
    try {
      final response = await dio.post(
        uri.toString(),
        data: data,
        options: options,
        // onSendProgress: (int sent, int total) {
        //   logger.i(
        //     'sent$sent total$total',
        //   );
        // },
      );
      return _dioResponse(response, canShowToast: canShowToast);
    }  on SocketException catch (e) {
      logger.e(e);
      showToast(
        msg: 'Connection error\nCheck internet and try again',
        isError: true,
      );
      throw InternetException(e.toString());
    } on DioException catch (error) {
      logger.e(error.response!.statusCode);
      logger.e(error.response!.requestOptions);

      var decodedRes = jsonDecode(error.response!.data);
      showToast(
        msg: UtilFunctions.capitalizeAllWord(
            decodedRes['message'] ?? "Something went wrong"),
        isError: true,
      );
      logger.e(decodedRes['message']);
    } on FormatException catch (error) {
      logger.e('FormatException: ${error.message}');
      showToast(
        msg: error.message.toString(),
        isError: true,
      );
      // throw HttpException('Bad response format: ${error.message}');
      debugPrint(error.message);
    } on TimeoutException {
      showToast(
        msg: 'Server connection time out',
        isError: true,
      );
      throw RequestTimeoutException('Request Timed out');
    } catch (error) {

      logger.e(error);

      throw HttpException('Something went wrong, $error');
    }
  }



  Future<dynamic> putUploadMth(
      Uri uri, {
        required FormData data,
        required Map<String, dynamic>? headers,
        bool canShowToast =true,
        required void Function(int, int) onSendProgress,
        // bool showSuccessToast =false,
      }) async {
    logger.i('Making request to $uri');
    logger.i(data.fields);
    final options = Options(headers: headers, responseType: ResponseType.plain);
    try {
      final response = await dio.put(
        uri.toString(),
        data: data,
        options: options,
        onSendProgress: (int sent, int total) {
          onSendProgress(sent, total);
          logger.i(
            'sent$sent total$total',
          );
        },
      );
      return _dioResponse(response, canShowToast: canShowToast);
    }  on SocketException catch (e) {
      logger.e(e);
      showToast(
        msg: 'Connection error\nCheck internet and try again',
        isError: true,
      );
      throw InternetException(e.toString());
    } on DioException catch (error) {
      logger.e(error.response!.statusCode);
      logger.e(error.response!.requestOptions);

      var decodedRes = jsonDecode(error.response!.data);
      showToast(
        msg: UtilFunctions.capitalizeAllWord(
            decodedRes['message'] ?? "Something went wrong"),
        isError: true,
      );
    } on FormatException catch (error) {
      logger.e('FormatException: ${error.message}');
      showToast(
        msg: error.message.toString(),
        isError: true,
      );
      // throw HttpException('Bad response format: ${error.message}');
      debugPrint(error.message);
    } on TimeoutException {
      showToast(
        msg: 'Server connection time out',
        isError: true,
      );
      throw RequestTimeoutException('Request Timed out');
    } catch (error) {

      logger.e(error);

      throw HttpException('Something went wrong, $error');
    }
  }


  dynamic _dioResponse(
    Response response, {
    bool canShowToast = true,
    bool canShowSuccessToast = false,
  }) async {
    dynamic responseJson;
    String status;
    dynamic message;
    switch (response.statusCode) {
      case 200:

        ///* This is a catch block for when the server returns a 200 ok status.
        logger.i(response.statusCode);
        logger.i(response.data);
        // log(response.data);
        if (canShowSuccessToast) {
          responseJson = json.decode(response.data.toString());
          status = responseJson['status'] as String;
          message = responseJson['message'];
          if (message != null) {
            showToast(msg: '$status\n$message', isError: false);
          }
        }
        return response.data;
      case 201:

        ///* This is a catch block for when the server returns a 201 created status.
        logger.i(response.statusCode);
        logger.i(response.data);
        return response.data;
      case 400:

        ///* This is a catch block for when the server returns a 400 bad request status.
        logger.e(response.statusCode);
        logger.e(response.data);
        if (canShowToast) {
          responseJson = json.decode(response.data.toString());
          status = responseJson['status'] as String;
          message = responseJson['message'];
          if (message != null) {
            showToast(msg: '$status\n$message', isError: true);
          }
        }

        throw BadRequestException(response.data.toString());
      case 401:

        ///* This is a catch block for when the server returns a 401 unauthorised error.
        logger.e(response.statusCode);
        logger.e(response.data);
        if (canShowToast) {
          responseJson = json.decode(response.data.toString());
          status = responseJson['status'] as String;
          message = responseJson['message'];
          if (message != null) {
            showToast(msg: '$status\n$message', isError: true);
          }
        }

        /// This code block is attempting to delete all the boxes (key-value pairs) stored in the shared
        /// then restart the app
        try {

        } catch (e) {
          logger.e(e);
        }

        throw UnauthorisedException(response.data.toString());
      case 403:

        ///* This is a catch block for when the server returns a 403 access unauthorised error.
        logger.e(response.statusCode);
        logger.e(response.data);

        /**
            This code is used to refresh the access token when a 403
            Forbidden status code is returned from the server.
         */
        // await Restart.restartApp();

        throw ForbiddenRequestException(response.data.toString());

      case 408:

        ///* This is a catch block for when the server returns a 408 timeout error.
        logger.e(response.data);
        throw Exception(response.data);

      case 409:

        ///* This is a catch block for when the server returns a 409.
        logger.e(response.data);
        responseJson = json.decode(response.data.toString());
        status = responseJson['status'] as String;
        message = responseJson['message'];
        if (message != null) {
          showToast(msg: '$status\n$message', isError: true);
        }

        throw BadRequestException(response.data.toString());

      case 500:

        ///* This is a catch block for when the server returns a 500 error.
        showToast(
          msg: 'Uh oh... Server Error',
          isError: true,
        );
        logger.e(response.data);
        throw Exception(
          'Error occured while Communication with Server with StatusCode: ${response.statusCode}',
        );
      default:
        if (canShowToast) {
          responseJson = json.decode(response.data.toString());
          status = responseJson['status'] as String;
          message = responseJson['message'];
          if (message != null) {
            showToast(msg: '$status\n$message', isError: true);
          }
        }
        logger.e(response.data);
        throw Exception(
          'Something went wrong: ${response.statusCode}',
        );
    }
  }
}

typedef FutureGenerator<T> = Future<T> Function();

abstract mixin class RetryFunc {
  Future<T> retry<T>(
    int retries,
    FutureGenerator<T> aFuture, {
    Duration? delay,
  }) async {
    try {
      return await aFuture();
    } catch (e) {
      if (retries > 1) {
        if (delay != null) {
          await Future.delayed(delay, () {/*..nothing*/});
        }
        return retry(retries - 1, aFuture);
      }
      rethrow;
    }
  }
}
