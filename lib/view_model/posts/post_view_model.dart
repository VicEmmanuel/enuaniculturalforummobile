// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:math';
// ignore: depend_on_referenced_packages
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/model/response/category_response_type.dart';
import 'package:enuaniculturalforummobile/model/response/local_response/category_response.dart';
import 'package:enuaniculturalforummobile/model/response/post_response_model.dart';
import 'package:enuaniculturalforummobile/repository/backend/post_backend.dart';
import 'package:enuaniculturalforummobile/src/models.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/rich_editor_screen.dart';
import 'package:enuaniculturalforummobile/view/components/success_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

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
  CategoryResponse? categoryResponse;
  CategoryResponseType? categoryResponseType;

  bool _validatePassword = true;

  final TextEditingController _aNewAmenityController = TextEditingController();
  TextEditingController get aNewAmenityController => _aNewAmenityController;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  TextEditingController get titleController => _titleController;
  TextEditingController get authorController => _authorController;

  final QuillController _quillController = QuillController.basic();
  QuillController get quillController => _quillController;

  bool isGettingPosts = true;
  bool isGettingPostsByCategory = true;
  bool isGettingTenants = true;
  bool isFetchingRentingRequest = true;
  bool isFetchingListingAccessRequest = true;
  bool isGettingSingleListing = true;
  bool isDeletingListing = false;
  bool isFreezingOrUnfreezingListing = false;
  bool isCreatingPropertiesListings = false;
  bool isCreatingPost = false;
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
  String? selectedItem;

  void backBtnControl(
    BuildContext context,
  ) {
    if (_currentListIndex > 0) {
      _currentListIndex--;
    } else {
      navigateBack(context);
    }
    notifyListeners();
  }

  ///Method to change page for guest
  void pageChange(index) {
    _currentListIndex = index;
    notifyListeners();
  }

  ///Method to control next button f
  nextBtnControl(
    BuildContext context,
  ) async {
    switch (_currentListIndex) {
      case 0:
        if (titleController.text.isEmpty) {
          showToast(msg: 'Enter Post Title', isError: true);
        } else if (authorController.text.isEmpty) {
          showToast(msg: 'Enter Authors Name', isError: true);
        } else if (selectedItem == null) {
          showToast(msg: 'Select Category', isError: true);
        } else if (propertyImageList.isEmpty) {
          showToast(msg: 'Select Image', isError: true);
        } else {
          // _currentListIndex++;
          return await navigatePush(context, QuillEditorWidget());
        }
      // case 2:
      //   if (pickUpDate != null
      //       && pickUpTime != null
      //   ) {
      //     _currentListIndex++;
      //   } else {
      //     showToast(msg: 'Select date and time', isError: true);
      //   }
      default:
        if (_quillController.toString().isEmpty) {
          showToast(msg: 'Invalid bank account number', isError: true);
        } else {
          return await navigatePush(context, QuillEditorWidget());
        }

      // _currentListIndex++;
      // _currentListIndex++;
      //   case 5:
      //     if (propertyImageList.isNotEmpty) {
      //       _currentListIndex++;
      //     } else {
      //       showToast(msg: addImage, isError: true);
      //     }
      // default:
      //   if (propertyImageList.isNotEmpty) {
      //     return await navigatePush(context, const PublishRecycleScreen());
      //     // break;
      //   } else {
      //     showToast(msg: 'Add Image', isError: true);
      //   }
      // return navigatePush(context, const PublishScreen());
    }

    notifyListeners();
  }

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

            isGettingPosts = false;
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
        isGettingPosts = false;
        notifyListeners();
      });
    } catch (e, s) {
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }

  Future<void> getAllCategories(
    BuildContext context,
  ) async {
    try {
      await postService.fetchAllCategories().then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse['status'].toString() == 'true') {
            // showToast(
            //   msg: decodedResponse['message'].toString(),
            //   isError: false,
            // );

            categoryResponse = CategoryResponse.fromJson(decodedResponse);

            // isGettingPosts = false;
            notifyListeners();
          }

          if (decodedResponse['status'].toString() == 'true') {
            categoryResponse = CategoryResponse.fromJson(decodedResponse);
            // personalListings = postResponseModel!.data!.listings!.toList();
            notifyListeners();
            // check page count if its more than one, on every successful data fetch
            //   _setCanLoadMoreListings(
            //       status: int.parse(postResponseModel!.data!.lastPage.toString()) > 1);
          }
        }
      }).whenComplete(() {
        // isGettingPosts = false;
        notifyListeners();
      });
    } catch (e, s) {
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }

  Future<void> getPostByCategories(
      BuildContext context,
  {required String slug}
      ) async {
    try {
      isGettingPostsByCategory= true;

      await postService.fetchPostByCategory(slug: slug).then((value) async {
        if (value != null) {
          final decodedResponse = jsonDecode(value.toString());

          if (decodedResponse['status'].toString() == 'true') {
            // showToast(
            //   msg: decodedResponse['message'].toString(),
            //   isError: false,
            // );

            categoryResponseType = CategoryResponseType.fromJson(decodedResponse);

            // isGettingPosts = false;
            isGettingPostsByCategory= false;
            notifyListeners();
          }

          if (decodedResponse['status'].toString() == 'true') {
            categoryResponseType = CategoryResponseType.fromJson(decodedResponse);
            isGettingPostsByCategory= false;

            // personalListings = postResponseModel!.data!.listings!.toList();
            notifyListeners();
            // check page count if its more than one, on every successful data fetch
            //   _setCanLoadMoreListings(
            //       status: int.parse(postResponseModel!.data!.lastPage.toString()) > 1);
          }
        }
      }).whenComplete(() {
        isGettingPostsByCategory= false;
        notifyListeners();
      });
    } catch (e, s) {
      logger
        ..i(checkErrorLogs)
        ..e(s);
    }
  }

  Future<void> createNewPost(BuildContext context) async {
    final json = _quillController.document.toDelta().toJson();
    print(json);
    final converter = QuillDeltaToHtmlConverter(
      json,
      ConverterOptions.forEmail(),
    );
    final html = converter.convert();
    // List<String> trimmedAmenityValues = trimList(amenityValues);
    isCreatingPost = true;
    logger.f(feesValues);
    notifyListeners();
    try {
      await postService
          .createNewPost(
        images: propertyImageList,
        title: _titleController.text,
        description: html,
        category_type: selectedItem.toString(),
          author: _authorController.text,
        // authToken: '7|G0oRsDb8iXRRKgRb4V9OJhRPYTla6Ryk1LPRb4yWf1156a00',
        authToken: DummyData.accessToken.toString(),

      ).then((value) async {
        if (value != null) {
          // final decodedResponse = jsonDecode(value.toString());

          if (value['status'].toString() == 'true') {
            showToast(
              msg: value['message'].toString(),
              isError: false,
            );
            isCreatingPost = false;
            getAllPosts(context);
            await navigateReplace(
                context,
                const SuccessScreen(
                    infoText: 'New Post Created',
                    newPage: DashBoardScreen(),
                    navigateButtonText: continueText));

            // await clearData();
            notifyListeners();
          } else {
            showToast(
              msg: value['message'].toString(),
              isError: true,
            );
            // navigateBack(context);
            isCreatingPost = false;
            notifyListeners();
          }
        }
      }).whenComplete(() {
        isCreatingPost = false;
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

  void getQuillContent() {
    final json = _quillController.document.toDelta().toJson();
    print(json);
    final converter = QuillDeltaToHtmlConverter(
      json,
      ConverterOptions.forEmail(),
    );
    final html = converter.convert();
    logger.wtf(html);

  }

  ///Method for  Picking Multiple Image
  pickMultipleImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    notifyListeners();
    if (pickedFile != null) {
      // _image = File(pickedFile.path);
      propertyImageList.add(File(pickedFile.path));
      notifyListeners();
      logger.f('Image Path $propertyImageList');
    } else {}
  }

  void removeImage(int index) {
    if (index >= 0 && index < propertyImageList.length) {
      propertyImageList.removeAt(index);
      notifyListeners();
    }
  }
}
