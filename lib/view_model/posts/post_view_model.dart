// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:math';
// ignore: depend_on_referenced_packages
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/model/response/post_response_model.dart';
import 'package:enuaniculturalforummobile/repository/backend/post_backend.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../model/response/rental_request_response.dart';

final postViewModel = ChangeNotifierProvider((ref) => PostViewModel());

class PostViewModel extends ChangeNotifier {
  final postService = PostsBackend();

  // List<ListingData> propertiesListings = [];
  CurrencyTextInputFormatter currencyFormatter(context) =>
      CurrencyTextInputFormatter.currency(
        locale: 'en',
        symbol: '${UtilFunctions.currency(context)} ',
      );
  PostResponseModel? postResponseModel;

  bool _validatePassword = true;

  final TextEditingController _aNewAmenityController = TextEditingController();
  TextEditingController get aNewAmenityController => _aNewAmenityController;

  bool isGettingPersonalListings = true;
  bool isGettingTenants = true;
  bool isFetchingRentingRequest = true;
  bool isFetchingListingAccessRequest = true;
  bool isGettingSingleListing = true;
  bool isDeletingListing = false;
  bool isFreezingOrUnfreezingListing = false;
  bool isCreatingPropertiesListings = false;
  bool isUpdatingPropertiesListings = false;

  bool isProcessingTenant = false;

  int _currentListIndex = 0;
  // int _currentListIndexForLandLord = 0;

  File? _image;

  File? get editedPickedFileOne => _editedPickedFileOne;

  File? get editedPickedFileTwo => _editedPickedFileTwo;

  File? get editedPickedFileThree => _editedPickedFileThree;
  final List<File?> _images = [];
  // List<File> editImageFiles = [];
  File? _editedPickedFileOne;
  File? _editedPickedFileTwo;
  File? _editedPickedFileThree;

  List<File?> _propertyImageList = [];
  List<File?> get propertyImageList => _propertyImageList;
  List<TextEditingController> amenityControllers = [];
  List<TextEditingController> singleFeeController = [];
  List<String> amenityValues = [];
  List<String> texts = [];
  List<Map<String, dynamic>>? feesValues = [];
  String? _feeType;

  String get feeType => _feeType!;
  int? parkInDuration;
  // int get parkInDuration => _parkInDuration!;
  String? _feeAmount;
  String get feeAmount => _feeAmount!;

  final TextEditingController _editTextController = TextEditingController();

  /// Method to trim a list of Strings
  List<String> trimList(List<String> inputList) {
    return inputList.where((element) => element.trim().isNotEmpty).toList();
  }

  int get currentListIndex => _currentListIndex;
  // int get currentListIndexForLandLord => _currentListIndexForLandLord;
  final TextEditingController _propertyNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  bool get validatePassword => _validatePassword;
  final TextEditingController _feesTitleControllers = TextEditingController();
  final TextEditingController _feesAmountControllers = TextEditingController();
  final TextEditingController _feesEditTitleControllers =
      TextEditingController();
  final TextEditingController _feesEditAmountControllers =
      TextEditingController();
  final TextEditingController _parkInDurationControllers =
      TextEditingController();
  final TextEditingController _validatePasswordControllers =
      TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _propertySizeController = TextEditingController();

  ///Editing Listing Controllers
  final TextEditingController _editPropertyNameController =
      TextEditingController();
  final TextEditingController _editAddressController = TextEditingController();
  final TextEditingController _editCityController = TextEditingController();
  final TextEditingController _editDescriptionController =
      TextEditingController();
  final TextEditingController _editPriceController = TextEditingController();

  TextEditingController get propertyNoController => _propertyNoController;
  TextEditingController get rentAmountController => _rentAmountController;

  final TextEditingController _propertyNoController = TextEditingController();
  final TextEditingController _rentAmountController = TextEditingController();

  TextEditingController get editTenantPropertyNoController =>
      _editTenantPropertyNoController;
  TextEditingController get editTenantRentAmountController =>
      _editTenantRentAmountController;

  final TextEditingController _editTenantPropertyNoController =
      TextEditingController();
  final TextEditingController _editTenantRentAmountController =
      TextEditingController();

  void setStartDate(String value) {
    _startDate =
        UtilFunctions.formatDate(value.toString(), pattern: 'yyyy-MM-dd');
    notifyListeners();
  }

  String _startDate = 'Start Date';
  String _endDate = 'End Date';
  String get startDate => _startDate;
  String get endDate => _endDate;

  String? editSelectedState;
  // String? editSelectedDuration;
  List<dynamic> editAmenityValues = [];
  // List<TextEditingController> editAmenityControllers = [];
  List<Map<String, dynamic>>? editFeesValues = [];

  TextEditingController get editPropertyNameController =>
      _editPropertyNameController;

  TextEditingController get editAddressNameController => _editAddressController;
  TextEditingController get editCityController => _editCityController;
  TextEditingController get editDescriptionController =>
      _editDescriptionController;
  TextEditingController get editPriceController => _editPriceController;

  ///End of Editing Listing Controllers

  // bool _hasAPropertyBeenPicked = false;
  // bool get hasAPropertyBeenPicked => _hasAPropertyBeenPicked;
  final TextEditingController _propertyCodeController = TextEditingController();
  TextEditingController get propertyCodeController => _propertyCodeController;
  TextEditingController get cityController => _cityController;
  TextEditingController get priceController => _priceController;
  TextEditingController get addressController => _addressController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get propertyNameController => _propertyNameController;
  TextEditingController get feesTitleControllers => _feesTitleControllers;
  TextEditingController get feesAmountControllers => _feesAmountControllers;
  TextEditingController get feesEditTitleControllers =>
      _feesEditTitleControllers;
  TextEditingController get feesEditAmountControllers =>
      _feesEditAmountControllers;
  TextEditingController get parkInDurationControllers =>
      _parkInDurationControllers;
  // TextEditingController get textController => _textController;

  File? get image => _image;
  bool _canLoadMoreListings = true;
  bool get canLoadMoreListings => _canLoadMoreListings;
  int _listingPage = 2;
  int get listingPage => _listingPage;

  //A Method that copies a string, value to clipboard.
  void copyToClipBoard(context, {required String value}) {
    Clipboard.setData(
      ClipboardData(text: value.toString()),
    );
    showToast(msg: "Copied '$value' to clipboard", isError: false);
  }

  void _setCanLoadMoreListings({required bool status}) {
    _canLoadMoreListings = status;
    notifyListeners();
  }

  ///Method to get personal properties
  Future<void> getAllPosts(
    BuildContext context,
  ) async {
    try {
      await postService.fetchAllPosts().then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse['status'].toString() == 'true') {
            // showToast(
            //   msg: decodedResponse['message'].toString(),
            //   isError: false,
            // );

            postResponseModel = PostResponseModel.fromJson(decodedResponse);

            isGettingPersonalListings = false;
            notifyListeners();
          }

          if (decodedResponse['status'].toString() == 'true') {
            postResponseModel = PostResponseModel.fromJson(decodedResponse);
            // personalListings = postResponseModel!.data!.listings!.toList();
            notifyListeners();
            // check page count if its more than one, on every successful data fetch
            //   _setCanLoadMoreListings(
            //       status: int.parse(postResponseModel!.data!.lastPage.toString()) > 1);
          }
        }
      }).whenComplete(() {
        isGettingPersonalListings = false;
        notifyListeners();
      });
    } catch (e, s) {
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }

  // Future<dynamic> getMoreListings() async {
  //   await listingService.fetchPersonalListing(page: _listingPage).then((value) {
  //     if (value != null) {
  //       final decodedResponse = jsonDecode(value.toString());
  //
  //       if (decodedResponse['status'].toString() == 'true') {
  //         postResponseModel = PostResponseModel.fromJson(decodedResponse);
  //         personalListings.addAll(postResponseModel!.data!.listings!.toList());
  //         notifyListeners();
  //         if (int.parse(postResponseModel!.data!.lastPage.toString()) > _listingPage) {
  //           _listingPage++;
  //           _setCanLoadMoreListings(status: true);
  //         } else {
  //           _setCanLoadMoreListings(status: false);
  //         }
  //       }
  //       // check page count if its more than one, on every successful data fetch
  //       // update page count on every successful data fetch
  //     }
  //   }).onError((error, stackTrace) {
  //     logger
  //       ..e(error)
  //       ..e(stackTrace);
  //   });
  // }

  // ///Method to get single listing by Id
  // Future<void> getSingleListing(BuildContext context, {required String id}) async {
  //   try {
  //     isGettingSingleListing = true;
  //     // notifyListeners();
  //     await listingService.fetchSingleListing(id: id).then((value) async {
  //       if (value != null) {
  //         final decodedResponse = jsonDecode(value.toString());
  //
  //         if (decodedResponse['status'].toString() == 'true') {
  //           // showToast(
  //           //   msg: decodedResponse['message'].toString(),
  //           //   isError: false,
  //           // );
  //           _singleListing = ListingData.fromJson(decodedResponse['data']);
  //           DummyData.titleOfProperty = _singleListing!.title.toString();
  //           DummyData.bathroomNumber = _singleListing!.bathrooms.toString();
  //           DummyData.bedroomNumber = _singleListing!.bedrooms.toString();
  //
  //           // logger.f('${DummyData.titleOfProperty}    Helloos');
  //           isGettingSingleListing = false;
  //           notifyListeners();
  //         }
  //       }
  //     }).whenComplete(() {
  //       isGettingSingleListing = false;
  //       notifyListeners();
  //     });
  //   } catch (e, s) {
  //     logger
  //       ..i(checkErrorLogs)
  //       ..e(s);
  //   }
  // }
  //
  //
  // ///Method to create new listing
  // Future<void> createNewListing(BuildContext context) async {
  //   List<String> trimmedAmenityValues = trimList(amenityValues);
  //
  //   logger.f(feesValues);
  //
  //   try {
  //     isCreatingPropertiesListings = true;
  //     notifyListeners();
  //     await listingService
  //         .createNewListing(
  //       // image: _image!,
  //       images: _propertyImageList,
  //       title: _propertyNameController.text,
  //       address: _addressController.text,
  //       city: _cityController.text,
  //       listingType: listingType != 'rent' ? listingType : 'rent',
  //       propertySize: _propertySizeController.text.isNotEmpty
  //           ? _propertySizeController.text
  //           : null.toString(),
  //       propertyType: selectedPropertyTypeName,
  //       description: _descriptionController.text,
  //       state: selectedState!,
  //       price: double.parse(
  //           _priceController.text.toString().split(' ')[1].replaceAll(',', '').toString()),
  //       amenities: trimmedAmenityValues,
  //       totalUnits: noOfUnits,
  //       availableUnits: availableNumber,
  //       bathrooms: bathRoomPerUnit,
  //       bedrooms: noOfBedroomPerUnit,
  //       fees: feesValues,
  //       parkInDuration: parkInDuration == null ? 0 : parkInDuration!,
  //       paymentPlan: selectedDuration == null ? 'one-time' : selectedDuration!,
  //       // underXampContract: underXampContract!,
  //       // propertyContractType: propertyContractType != 'management' ||
  //       //         propertyContractType != 'renovated'
  //       //     ? null.toString()
  //       //     : propertyContractType.toString()
  //       // 'one-time'
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
  //           await navigateReplace(
  //               context,
  //               const SuccessScreen(
  //                   infoText: '',
  //                   successText: 'Listed',
  //                   newPage: DashBoardScreen(
  //                     setIndex: 2,
  //                   ),
  //                   navigateButtonText: continueText));
  //
  //           // await clearData();
  //           notifyListeners();
  //         } else if (value['status'].toString() == 'false') {
  //           showToast(
  //             msg: value['message'].toString(),
  //             isError: false,
  //           );
  //           // navigateBack(context);
  //           isCreatingPropertiesListings = false;
  //           notifyListeners();
  //         }
  //       }
  //     }).whenComplete(() async {
  //       isCreatingPropertiesListings = false;
  //
  //       notifyListeners();
  //     });
  //   } catch (e, s) {
  //     logger
  //       ..i(checkErrorLogs)
  //       ..e(s);
  //   }
  // }
}