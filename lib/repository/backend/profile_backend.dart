// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:flutter/services.dart';
import 'package:enuaniculturalforummobile/repository/services/api/api_service.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

class ProfileBackend extends ApiService {



  Future<dynamic> getProfileData() async {
    return getMth(getProfileUri, headers: apiHeaderWithToken);
  }


  Future<dynamic> updateUserProfile(
      {required String firstname, required String lastName, required String phoneNumber, required String gender}) async {
    return putMth(
      updateUserProfileUri,
      headers: apiHeaderWithToken,
      body: {'firstName': firstname, 'lastName': lastName,
        'phoneNumber': phoneNumber, 'gender': "Male"},
    );
  }

  Future<dynamic> submitKYC({
    required String fullName,
    required String documentType,
    required String documentNumber,
    List<File?>? attachments,
  }) async {
    List<MultipartFile>? fileItems = [];

    if (attachments != null) {
      for (File? file in attachments) {
        if (file != null) {
          String fileName = file.path.split('/').last;
          fileItems.add(await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ));
        }
      }
    }
    return uploadMth(
      submitKYCUri,
      data: FormData.fromMap({
        'fullName': fullName,
        'documentType': documentType,
        'documentNumber': documentNumber,
        'attachments': fileItems,
      }),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchKYCStatus() async {
    return getMth(
      fetchKYCStatusUri,
      headers: apiHeaderWithToken,
    );
  }


  Future<dynamic> uploadProfileAvatar(
      BuildContext context, {
        required void Function(int, int) onSendProgress,
      }) async {
    dynamic uploadResponse;
    await UtilFunctions.pickImage().then((value) async {
      // selected image file
      final imageFile = value;

      Uint8List? uint8List;

      await imageFile!.readAsBytes().then((value) => uint8List = value);

      final intList = uint8List!.toList();

      //format image file
      final formData = FormData.fromMap({
        'profileImage': MultipartFile.fromBytes(
          intList,
          filename: imageFile.name,
          contentType: MediaType('image', 'png'),
        ),
      });

      await putUploadMth(
        updateUserProfileUri,
        // context: context,
        data: formData,
        onSendProgress: onSendProgress,
        headers: apiHeaderWithToken,
      ).then((value) {
        if (value != null) {
          uploadResponse = value;
        }
      });
    });
    return uploadResponse;
  }
  Future<dynamic> deleteProfile() async {
    return deleteMth(
      deleteUserProfileUri,
      headers: apiHeaderWithToken,
    );
  }
}
