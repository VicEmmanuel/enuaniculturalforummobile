import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rebirth/rebirth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enuaniculturalforummobile/src/models.dart';
import 'package:enuaniculturalforummobile/src/repository.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

final profileViewModel = ChangeNotifierProvider((ref) => ProfileViewModel());

class ProfileViewModel extends ChangeNotifier {
  final profileService = ProfileBackend();
  // final banksService = BankBackend();

  List<File?> driversLicenseFrontAndBckImage = [];
  List<File?> imageFrontAndBckImage = [];
  List<LandlordBankData> _landLordWithdrawalBanks = [];
  List<LandlordBankData> get landLordWithdrawalBanks => _landLordWithdrawalBanks;
  bool _isFetchingBanks = false;

  CustomButtonState _buttonSaveBankDetailsState = CustomButtonState(
    buttonState: ButtonState.disabled,
    text: createAccount,
  );

  CustomButtonState get  buttonSaveBankDetailsState =>  _buttonSaveBankDetailsState;

  bool get isFetchingBanks => _isFetchingBanks;
  List<String> genderType = ['Male', "Female"];

  KycResponseStatus? kycResponseStatus;

  bool _isSubmittingKYC = false;
  bool get isSubmittingKYC => _isSubmittingKYC;

  bool isDeletingBankAccountDetails = false;
  CustomButtonState _buttonSubmitKYCState = CustomButtonState(
    buttonState: ButtonState.idle,
    text: login,
  );

  TextEditingController _documentNumberController = TextEditingController();
  final TextEditingController _driverLicenseController = TextEditingController();
  final TextEditingController _ninLicenseController = TextEditingController();
  TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _validatePasswordControllers = TextEditingController();
  TextEditingController get validatePasswordControllers => _validatePasswordControllers;
  final TextEditingController _firstNameController =
  TextEditingController(text: DummyData.firstName ?? '');
  final TextEditingController _lastNameController =
  TextEditingController(text: DummyData.lastName ?? '');
  final TextEditingController _emailAddressController =
  TextEditingController(text: DummyData.emailAddress ?? '');
  final TextEditingController _phoneNumberController =
  TextEditingController(text: DummyData.phoneNumber ?? '');

  final bvnFormKey = GlobalKey<FormState>();
  final driverFormKey = GlobalKey<FormState>();
  final ninFormKey = GlobalKey<FormState>();
  final intlPassportFormKey = GlobalKey<FormState>();

  final bool _validatePassword = true;
  bool get validatePassword => _validatePassword;
  bool _showBanks = false;
  bool get showBanks => _showBanks;
  bool _isLoadingVerifiedBanks = false;
  bool get isLoadingVerifiedBanks => _isLoadingVerifiedBanks;
  // String _accountName = accountNameText;
  String? _bankName;
  String? _bankCode;
  String? _gender;

  String? get gender => _gender;
  UserResponseModel? _profileData;

  UserResponseModel? get profileData => _profileData;
  File? driversLicenceImageFront;
  File? driversLicenceImageBack;

  File? ninImageFront;
  File? ninImageBack;

  File? intlPassportImageFront;
  File? intlPassportImageBack;

  // List<String> identificationType = [
  //   bvn,
  //   driversLicense,
  //   nin,
  //   internationalPassport,
  // ];

  // List<Map<String, dynamic>> identificationTypeNew = [
  //   {
  //     'title': bvn,
  //     'id': bvnCamelCase,
  //   },
  //   {
  //     'title': driversLicense,
  //     'id': driversLicenseCamelCase,
  //   },
  //   {
  //     'title': nin,
  //     'id': ninCamelCase,
  //   },
  //   {
  //     'title': internationalPassport,
  //     'id': intlPassportCamelCase,
  //   },
  // ];

  String? _documentType;
  String? get documentType => _documentType;
  // String get accountName => _accountName;
  String? get bankName => _bankName;
  String? get bankCode => _bankCode;
  TextEditingController get accountNumberController => _accountNumberController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get emailAddressController => _emailAddressController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get documentNumberController => _documentNumberController;
  TextEditingController get driverLicenseController => _driverLicenseController;
  TextEditingController get ninLicenseController => _ninLicenseController;
  CustomButtonState get buttonSubmitKYCState => _buttonSubmitKYCState;
  bool isBankAccountNumberAdded = false;
  BankAccountValidatedResponse? validatedUserResponse;
  BanksData? userBankData;

  bool _isUpdatingUserProfile = false;
  bool get isUpdatingUserProfile => _isUpdatingUserProfile;

  bool _isAddingBankDetails = false;
  bool get isAddBankDetails  => _isAddingBankDetails ;

  bool _isFetchingLandlordBanks = true;
  List<BanksData> _listOfBanks = [];
  List<BanksData> get bankList => _listOfBanks;

  double _uploadProgress = 0.0;
  bool _showUploadIndicator = false;

  double get uploadProgress => _uploadProgress;
  bool get showUploadIndicator => _showUploadIndicator;

  String? validateInput() {
    if (_documentNumberController.text.length >= 8) {
      return 'Must be 11 digits';
    } else {}

    notifyListeners();
    return null;
  }

  changeIdType(String? value) {
    _documentType = value!;
    validateInput();
    notifyListeners();
  }

  getGender(String? value) {
    _gender = value!;
    notifyListeners();
  }

  void newBankName(String newBankName) {
    _bankName = newBankName;

    notifyListeners();
  }

  void getBankCode(String bank) {
    for (int i = 0; i <= _listOfBanks.length - 1; i++) {
      if (bank == _listOfBanks[i].name) {
        _bankCode = _listOfBanks[i].code;
        notifyListeners();
      }
    }
  }

  void changeShowBanks(bool value) {
    _showBanks = value;
    logger.t(_showBanks);
    notifyListeners();
  }

  void copyToClipBoard(context, {required String value}) {
    Clipboard.setData(
      ClipboardData(text: value.toString()),
    );
    showToast(msg: "Copied '$value' to clipboard", isError: false);
  }

  ///Method to update user profile
  // Future<void> updateUserProfile(BuildContext context) async {
  //   _isUpdatingUserProfile = true;
  //   notifyListeners();
  //   try {
  //     await profileService
  //         .updateUserProfile(
  //       firstname: _firstNameController.text.toString(),
  //       lastName: _lastNameController.text.toString(),
  //       phoneNumber: _phoneNumberController.text.toString(),
  //       gender: UtilFunctions.capitalizeAllWord(_gender ?? profileData!.data!.gender.toString()),
  //     )
  //         .then((value) async {
  //       if (value != null) {
  //         final decodedResponse = jsonDecode(value.toString());
  //
  //         if (decodedResponse['status'].toString() == 'true') {
  //           showToast(
  //             msg: decodedResponse['message'].toString(),
  //             isError: false,
  //           );
  //           _isUpdatingUserProfile = false;
  //           notifyListeners();
  //         } else if (value['status'].toString() == 'false') {
  //           showToast(
  //             msg: value['message'].toString(),
  //             isError: false,
  //           );
  //           _isUpdatingUserProfile = false;
  //           notifyListeners();
  //         }
  //       }
  //     }).whenComplete(() {
  //       _isUpdatingUserProfile = false;
  //       notifyListeners();
  //     });
  //   } catch (e, s) {
  //     logger
  //       ..i(checkErrorLogs)
  //       ..e(s);
  //   }
  // }

//Method to delete user profile.
  Future<void> deleteUserProfile(BuildContext context) async {
    try {
      _isUpdatingUserProfile = true;
      notifyListeners();
      await profileService.deleteProfile().then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse['status'].toString() == 'true') {
            _validatePasswordControllers.clear();
            showToast(
              msg: decodedResponse['message'].toString(),
              isError: false,
            );
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove('Email');
            await prefs.remove('Password');
            await prefs.remove('accessToken');
            await Future.delayed(const Duration(seconds: 2));

            // ignore: use_build_context_synchronously
            WidgetRebirth.createRebirth(context: context);

            _isUpdatingUserProfile = false;
            notifyListeners();
          } else if (value['status'].toString() == 'false') {
            showToast(
              msg: value['message'].toString(),
              isError: false,
            );

            _isUpdatingUserProfile = false;
            notifyListeners();
          }
        }
      }).whenComplete(() {
        _isUpdatingUserProfile = false;
        notifyListeners();
      });
    } catch (e, s) {
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }



  ///Method for validating user banks.
  // Future<dynamic> validateUserBankAccount() async {
  //   _isLoadingVerifiedBanks = true;
  //   _buttonSaveBankDetailsState = CustomButtonState(
  //     buttonState: ButtonState.disabled,
  //     text: login,
  //   );
  //   notifyListeners();
  //   try {
  //     await banksService
  //         .validateCustomerBankAccount(
  //       accountNumber: _accountNumberController.text.toString(),
  //       bankCode: _bankCode ?? "",
  //     )
  //         .then((value) async {
  //       if (value != null) {
  //         if (value['data']['status'].toString() == 'true') {
  //           validatedUserResponse = BankAccountValidatedResponse.fromJson(value['data']['data']);
  //           _accountName = validatedUserResponse!.accountName!;
  //           _buttonSaveBankDetailsState = CustomButtonState(
  //             buttonState: ButtonState.idle,
  //             text: login,
  //           );
  //           notifyListeners();
  //           showToast(
  //             msg: value['data']['message'].toString(),
  //             isError: false,
  //           );
  //         } else if (value['data']['status'].toString() == 'false') {
  //           showToast(
  //             msg: value['data']['message'].toString(),
  //             isError: true,
  //           );
  //           _accountName = accountNameNotFound.toUpperCase();
  //           _buttonSaveBankDetailsState = CustomButtonState(
  //             buttonState: ButtonState.disabled,
  //             text: login,
  //           );
  //           notifyListeners();
  //         }
  //         _isLoadingVerifiedBanks = false;
  //         notifyListeners();
  //       }
  //     }).onError((error, stackTrace) => null);
  //   } catch (e) {
  //     logger.e(e);
  //   }
  // }




  ///Method for Picking Multiple Image
  pickImageAsList() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    notifyListeners();
    if (pickedFile != null) {
      // _image = File(pickedFile.path);
      driversLicenseFrontAndBckImage.add(File(pickedFile.path));
      notifyListeners();
      logger.i('Image Path $driversLicenseFrontAndBckImage');
    } else {}
  }

  /// Method to pick Single Image from gallery
  Future<File?> pickSingleImageOne() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    notifyListeners();

    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      notifyListeners();
      logger.f('Image Path $imageFile');
      final bytes = imageFile.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      logger.t("${kb}KB");
      logger.i("${kb}KB");

      return imageFile; // Return the picked file
    }

    return null; // Return null if no image is picked
  }

  Future<File?> updateDriverLicenceFrontImage() async {
    final pickedImage = await pickSingleImageOne();
    if (pickedImage != null) {
      driversLicenceImageFront = pickedImage;
      notifyListeners();
    }
    return null;
  }

  // Future<File?> updateDriverLicenceBackImage() async {
  //   final pickedImage = await pickSingleImageOne();
  //   if (pickedImage != null) {
  //     driversLicenceImageBack = pickedImage;
  //     notifyListeners();
  //   }
  //   return null;
  // }

  Future<File?> updateNinFrontImage() async {
    final pickedImage = await pickSingleImageOne();
    if (pickedImage != null) {
      ninImageFront = pickedImage;
      notifyListeners();
    }
    return null;
  }

  Future<File?> updateNinBackImage() async {
    final pickedImage = await pickSingleImageOne();
    if (pickedImage != null) {
      ninImageBack = pickedImage;
      notifyListeners();
    }
    return null;
  }

  Future<File?> updateIntlPassportFrontImage() async {
    final pickedImage = await pickSingleImageOne();
    if (pickedImage != null) {
      intlPassportImageFront = pickedImage;
      notifyListeners();
    }
    return null;
  }

  Future<File?> updateIntlPassportBackImage() async {
    final pickedImage = await pickSingleImageOne();
    if (pickedImage != null) {
      intlPassportImageBack = pickedImage;
      notifyListeners();
    }
    return null;
  }

  void updateDocumentType(String docType) {
    _documentType = docType;
    notifyListeners();
  }

  Future<void> updateDocumentNumberController() async {
    _documentNumberController = TextEditingController();
    notifyListeners();
  }

  void clearKYCData() {
    _documentNumberController = TextEditingController();
    driversLicenceImageFront = null;
    driversLicenceImageBack = null;

    ninImageFront = null;
    ninImageBack = null;

    intlPassportImageFront = null;
    intlPassportImageBack = null;
    notifyListeners();
  }

  void updateImageFrontAndBack(frontImage, backImage) {
    imageFrontAndBckImage = [frontImage, backImage];
    notifyListeners();
  }

  Future<void> updateProfilePhoto(BuildContext context) async {
    try {
      await profileService.uploadProfileAvatar(
        context,
        onSendProgress: (int sent, int total) {
          /// In the code snippet provided, `final progress = sent / total * 1;` is calculating the
          /// progress percentage of the file upload.
          final progress = (sent / total) * 0.1;
          //
          _showUploadIndicator = true;
          _uploadProgress = progress;
          notifyListeners();

          // logger.d(
          //   'progress: ${progress.toStringAsFixed(1)}% ($sent/$total)',
          // );
        },
      ).then((dynamic value) async {
        /// Once the file upload is complete, the response is decoded using `jsonDecode`.
        /// The `profileData` object is then updated with the new profile photo URL from the response. Finally, the `notifyListeners` method is called to notify any listeners that the profile data has changed.
        ///
        /// Overall, the `updateProfilePhoto` method handles the file upload, updates the profile data with the new photo URL, and notifies listeners of the change.

        // final decodeResponse = jsonDecode(value.toString());
        // profileData!.data!.profilePhoto =
        // decodeResponse['data']['profilePhoto'] as String;
        await loadData(context);
        notifyListeners();
      }).whenComplete(() {
        // hide progress indicator when
        //upload is complete
        _showUploadIndicator = false;
        // notifyListeners();
      });
    } catch (e) {
      logger.e(e);
    }
  }

  Future<UserResponseModel?> loadData(BuildContext context) async {
    try {
      await profileService.getProfileData().then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse['status'].toString() == 'true') {
            _profileData = UserResponseModel.fromJson(decodedResponse);
            DummyData.lastName = _profileData!.data!.user!.name.toString();
            // DummyData.firstName = _profileData!.data!.firstName.toString();
            logger.wtf(DummyData.firstName);
            // DummyData.phoneNumber = _profileData!.data!.phone ?? "";
            DummyData.emailAddress = _profileData!.data!.user!.email ?? "";
            notifyListeners();
            log( DummyData.phoneNumber.toString());
            // _gender =  _profileData!.gender.toString();

          }
        }
        notifyListeners();
      }).whenComplete(() {
        notifyListeners();
      });
    } catch (e, s) {
      showToast(
        msg: somethingWentWrong,
        isError: true,
      );
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
    return _profileData;
  }

  bool get isFetchingLandlordBanks => _isFetchingLandlordBanks;


  // Future<void> initPage() async {
  //   _accountNumberController = TextEditingController();
  //   _accountName=accountNameText;
  //   notifyListeners();
  // }


  void updateSaveBankButtonState() {
    if (_accountNumberController.text.length < 10 || _bankCode!.isNotEmpty) {
      _buttonSaveBankDetailsState = CustomButtonState(
        buttonState: ButtonState.disabled,
        text: login,
      );
    } else {
      _buttonSaveBankDetailsState = CustomButtonState(
        buttonState: ButtonState.idle,
        text: login,
      );
    }
    notifyListeners();
  }

  String getInitials(String name) {
    List<String> nameParts = name.split(' ');
    String initials = '';
    for (var part in nameParts) {
      initials += part[0];
    }
    return initials.toUpperCase();
  }
}