import 'dart:async';
import 'dart:convert';

import 'package:enuaniculturalforummobile/model/response/local_response/duration_type_response.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/custom_alerts.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/guest_dashboard.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/payment_successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

final paymentViewModel = ChangeNotifierProvider((ref) => PaymentViewModel());

class PaymentViewModel extends ChangeNotifier {
  int? _paymentType;
  int? _schoolFeesPaymentType = 1;
  String _paymentTypeName = '';
  bool isMakingTransaction = true;
  bool transactionSuccessful = false;

  String _schoolFeesPaymentTypeName = '';
  bool isAccountFetched = false;
  int? selectedNetworkProviderIndex;
  int? selectedSortTransactionType;
  int? selectedSortType;
  String? networkProviderKey;
  String? departureDate;
  String? arrivalDate;
  String cardNumber = '';
  String cardHolder = '';
  String expiryDate = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool isGettingFlightSearchResult = true;
  DateTime dateTime = DateTime.now();
  static DurationTypeResponse? _durationTypeResponse;
  final FocusNode _cvvFocusNode = FocusNode();
  bool isFocused = false;

  int noOfAdults = 0;
  int noOfChildren = 0;
  int noOfInfants = 0;
  String? selectedDuration;
  List<String> serviceProviders = [
    AppImages.mtnIcon,
    AppImages.gloIcon,
    AppImages.airtelIcon,
    AppImages.nineMobileIcon
  ];

  List<Map<String, dynamic>> serviceProvidersWithKey = [
    {'key': 'mtn', 'icon': AppImages.mtnIcon, 'name': 'MTN'},
    {'key': 'glo', 'icon': AppImages.gloIcon, 'name': 'Glo'},
    {'key': 'airtel', 'icon': AppImages.airtelIcon, 'name': 'Airtel'},
    {'key': 'nineMobile', 'icon': AppImages.nineMobileIcon, 'name': '9Mobile'},
  ];


  List<Map<String, dynamic>> filterTransactionType = [
    {'key': 'all',  'name': 'All'},
    {'key': 'incoming',  'name': 'Incoming'},
    {'key': 'outgoing',  'name': 'Outgoing'},
  ];

  List<Map<String, dynamic>> filterSortType = [
    {'key': 'latest',  'name': 'Latest'},
    {'key': 'oldest',  'name': 'Oldest'},
  ];


  final TextEditingController _cardHoldersNameController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvCodeController = TextEditingController();

  String? get paymentTypeName => _paymentTypeName;
  int? get paymentType => _paymentType;
  int? get schoolFeesPaymentType => _schoolFeesPaymentType;
  DurationTypeResponse? get durationTypeResponse => _durationTypeResponse;
  TextEditingController get cardHoldersNameController =>
      _cardHoldersNameController;
  TextEditingController get cardNumberController => _cardNumberController;
  TextEditingController get expiryDateController => _expiryDateController;
  TextEditingController get cvvCodeController => _cvvCodeController;
  FocusNode get cvvFocusNode => _cvvFocusNode;

  Future<void> updatePaymentMethod(int value) async {
    _paymentType = value;
    _paymentTypeName = value == 1
        ? "Pay with Transfer"
        : value == 2
            ? "Pay with Card"
            : "Pay from Wallet";
    notifyListeners();
  }

  Future<void> updateSchoolFeesPaymentTypeMethod(int value) async {
    _schoolFeesPaymentType = value;
    _schoolFeesPaymentTypeName =
        value == 1 ? "Pay without Remita" : "Pay with Remita";
    notifyListeners();
  }

  updateAccountFetchStatus() {
    isAccountFetched = true;
    notifyListeners();
  }

  void updateSelectedNetworkProviderIndex(int index) {
    selectedNetworkProviderIndex = index;
    notifyListeners();
  }

  void updateSelectedSortTransactionTypeIndex(int index) {
    selectedSortTransactionType = index;
    notifyListeners();
  }
  void updateSortTypeIndex(int index) {
    selectedSortType = index;
    notifyListeners();
  }

  void updateNetworkProviderKey(String key) {
    networkProviderKey = key;
    notifyListeners();
  }

  void copyToClipBoard(context, {required String value}) {
    Clipboard.setData(
      ClipboardData(text: value.toString()),
    );
    showToast(msg: "Copied '$value' to clipboard", isError: false);
  }

  CurrencyTextInputFormatter currencyFormatter(context) =>
      CurrencyTextInputFormatter.currency(
        locale: 'en',
        symbol: '${UtilFunctions.currency(context)} ',
      );
  clearData() {
    _paymentType = null;
    isAccountFetched = false;
    selectedNetworkProviderIndex = null;
    _schoolFeesPaymentType = 1;
    isGettingFlightSearchResult = true;
    departureDate = null;
    arrivalDate = null;
    noOfAdults = 0;
    noOfChildren = 0;
    noOfInfants = 0;
    cardNumber = '';
    cardHolder = '';
    expiryDate = '';
    cvvCode = '';
    _cardNumberController.clear();
    _cvvCodeController.clear();
    _expiryDateController.clear();
    _cardHoldersNameController.clear();
  }

  Future<DurationTypeResponse?> getAllDurationFromJson() async {
    var input = await rootBundle.loadString('assets/json/duration_type.json');
    var mapDataMain = jsonDecode(input);

    _durationTypeResponse = DurationTypeResponse.fromJson(mapDataMain);
    // logger.wtf('ytyvkkjbjkkvjhvhjjhchxhjcjhcjhchjchg');

    return _durationTypeResponse;
  }

  void updateDurationName(String duration) {
    selectedDuration = duration;
    logger.w(selectedDuration);
    notifyListeners();
  }

  void updateFlightSearchResult() {
    isGettingFlightSearchResult = false;
    logger.w(isGettingFlightSearchResult.toString());
    notifyListeners();
  }

  void showDatePickerMethod(BuildContext context,
      {required String selectedDate}) {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2090),
    ).then((value) {
      dateTime = value!;
      departureDate = DateFormat('d MMM y').format(dateTime);
      logger.wtf(selectedDate);
      notifyListeners();
    });
  }

  void showReturnDatePickerMethod(BuildContext context,
      {required String selectedDate}) {
    showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2090),
    ).then((value) {
      dateTime = value!;
      arrivalDate = DateFormat('d MMM y').format(dateTime);
      logger.wtf(selectedDate);
      notifyListeners();
    });
  }

  void incrementDecrementValue(value) {
    value++;
    notifyListeners();
  }

  updateCardNumber() {
    cardNumber = _cardNumberController.text;
    expiryDate = _expiryDateController.text;
    cardHolder = _cardHoldersNameController.text;
    cvvCode = _cvvCodeController.text;

    notifyListeners();
  }

  // updateCvv(){
  //   isCvvFocused = true;
  //   notifyListeners();
  // }

  void handleFocusChange() {
    isCvvFocused = _cvvFocusNode.hasFocus;
    notifyListeners();
  }

  checkTransactionMode(BuildContext context) {
    isMakingTransaction ? CustomAlerts().displayCustomLoader(context) : null;
    Timer(const Duration(milliseconds: 2300), () async {
      transactionSuccessful = true;
     await Navigator.of(context).pushAndRemoveUntil(
        // the new route
        MaterialPageRoute(
            builder: (BuildContext context) => const  PaymentSuccessfulScreen()
        ),
            (Route route) => false,
      );
      // await navigatePush(context, const PaymentSuccessfulScreen());
      isMakingTransaction = false;
      logger.w(isMakingTransaction.toString());
      notifyListeners();
    });
    notifyListeners();
  }

  resetIsMakingTransactionMode(){
    isMakingTransaction = true;
    notifyListeners();
    logger.wtf(isMakingTransaction.toString());
  }
}
