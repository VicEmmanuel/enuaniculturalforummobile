// // ignore_for_file: avoid_dynamic_calls, strict_raw_type
//
// import 'dart:convert';
// import 'package:dio/dio.dart';
//
// import 'package:flutter/cupertino.dart';
// import 'package:xamp/src/utils.dart';
//
// final log = getLogger('Employer Reg');
//
// dynamic dioResponse(BuildContext context, Response response) async {
//   dynamic responseJson;
//   dynamic message;
//   switch (response.statusCode) {
//     case 200:
//
//       ///* This is a catch block for when the server returns a 200 ok status.
//       log.i(response.statusCode);
//       log.i(response.data);
//       return response.data;
//     case 201:
//
//       ///* This is a catch block for when the server returns a 201 created status.
//       log.i(response.statusCode);
//       log.i(response.data);
//       return response.data;
//     case 400:
//
//       ///* This is a catch block for when the server returns a 400 bad request status.
//       log.e(response.statusCode);
//       log.e(response.data);
//       responseJson = json.decode(response.data.toString());
//       message = responseJson['response']['details']['error'];
//       showToast(
//         msg: message.toString(),
//         isError: true,
//       );
//       throw Exception(response.data);
//     case 401:
//
//       ///* This is a catch block for when the server returns a 401 unauthorised error.
//       log.e(response.statusCode);
//       log.e(response.data);
//       responseJson = json.decode(response.data.toString());
//       final message = responseJson['response']['details']['error'];
//
//       showToast(
//         msg: message.toString(),
//         isError: true,
//       );
//
//       throw Exception(response.data);
//     case 403:
//
//       ///* This is a catch block for when the server returns a 403 unauthorised error.
//       log.e(response.data);
//       throw Exception(response.data);
//     case 408:
//
//       ///* This is a catch block for when the server returns a 408 timeout error.
//       log.e(response.data);
//
//       showToast(
//         msg: 'Server connection time out\nStatusCode: ${response.statusCode}',
//         isError: true,
//       );
//
//       throw Exception(response.data);
//
//     case 409:
//
//     ///* This is a catch block for when the server returns a 409 timeout error.
//       log.e(response.statusCode);
//       log.e(response.data);
//       responseJson = json.decode(response.data.toString());
//       final message = responseJson['response']['details']['error'];
//       showToast(
//         msg: message.toString(),
//         isError: true,
//       );
//       throw Exception(response.data);
//
//     case 422:
//       //
//       // ///* This is a catch block for when the server returns a 403 unauthorised error.
//       // log.e(response.data);
//       // try {
//       //   final box = Boxes.getUserBox();
//       //   final notifBox = Boxes.getNotificationBox();
//       //   showToast(msg: 'Unauthorised: login and try again', isError: true);
//       //   await box.deleteFromDisk();
//       //   await notifBox.deleteFromDisk();
//       //   if (Platform.isIOS) {
//       //     exit(0);
//       //   } else {
//       //     await Restart.restartApp();
//       //   }
//       // } catch (e) {
//       //   showToast(msg: 'Please try again', isError: true);
//       // }
//       throw Exception(response.data);
//     case 500:
//     default:
//
//       ///* This is a catch block for when the server returns a 500 error.
//     showToast(
//       msg:
//       'Error occured while Communicating with Server with\nStatusCode: ${response.statusCode}',
//       isError: true,
//     );
//
//       throw Exception(
//         'Error occured while Communication with Server with StatusCode: ${response.statusCode}',
//       );
//   }
// }
