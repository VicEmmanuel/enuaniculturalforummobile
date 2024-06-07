
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/models.dart';
import 'package:enuaniculturalforummobile/src/repository.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dashboardViewModel =
    ChangeNotifierProvider((ref) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  bool isObscure = false;
  int get currentIndex => _currentIndex;
  String? country, state, locality,subLocality;

  setPageIndex({int? selectedPageIndex}) {
    _currentIndex = selectedPageIndex ?? 0;
    notifyListeners();
    // getDeviceLocation();
  }

  loadDashboardAmountPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      isObscure = prefs.getBool('isObscure') ?? false;
      notifyListeners();
  }
  late SharedPreferences sharedPreferences;

  toggleObscure() async {

      isObscure = !isObscure;
      notifyListeners();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isObscure', isObscure);
     notifyListeners();

  }
  // String getTitle() {
  //   switch (_currentIndex) {
  //     case 1:
  //       return marketPlace;
  //     case 2:
  //       return properties;
  //     case 3:
  //       return wallet;
  //     case 4:
  //       return more;
  //     default:
  //       return 'Hello, ${DummyData.username}';
  //   }
  // }

  // String getGuestTitle() {
  //   switch (_currentIndex) {
  //     case 1:
  //       return properties;
  //     case 2:
  //       return more;
  //     default:
  //       return marketPlace;
  //   }
  // }


  // Future<void> getDeviceLocation() async {
  //   final service = LocationService();
  //   // print(service);
  //   try{
  //     final locationData = await service.getLocation();
  //     if (locationData != null) {
  //       final placeMark = await service.getPlaceMark(locationData: locationData);
  //
  //       country = placeMark?.country ?? '';
  //       state = placeMark?.administrativeArea ?? '';
  //       locality = placeMark?.locality ?? '';
  //       subLocality = placeMark?.subAdministrativeArea ?? '';
  //       // addressPlace = placeMark?.country.toString();   addressPlacemarks.reversed.last.locality.toString();
  //       DummyData.city = "$locality";
  //       DummyData.state = "$state";
  //       // DummyData.userLatitude = locationData.latitude!;
  //       // DummyData.userLongitude = locationData.longitude!;
  //
  //       //logger.t('${DummyData.city} ${DummyData.state}',);
  //       // logger.t(DummyData.userLatitude);
  //       // logger.t(DummyData.userLongitude);
  //
  //       //print('${locationData.latitude!}  + ' ' + ${locationData.longitude!}');
  //       notifyListeners();
  //       // fetchVendorsNearYou();
  //     }
  //   } on Exception catch (e){
  //     logger.e(e);
  //   }
  // }

}
