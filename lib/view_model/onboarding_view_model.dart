import 'package:enuaniculturalforummobile/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decode/jwt_decode.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:enuaniculturalforummobile/model/local/dummy_data.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enuaniculturalforummobile/view_model/auth/auth_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/profile/profile_view_model.dart';

final onboardingViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel());

class OnboardingViewModel extends ChangeNotifier {


  late SharedPreferences sharedPreferences;


  checkUser(context) {
    initData().then((onValue) async {

      // navigateReplace(context, const OnboardingScreen());
      // navigateReplace(context, const LoginScreen());



      sharedPreferences = await SharedPreferences.getInstance();
      // final token = await FirebaseMessaging.instance.getToken();
      DummyData.firstTimeOnApp = sharedPreferences.getBool("firstTimeOnApp");
      logger.t("First time on App? : ${DummyData.firstTimeOnApp}");

      if (DummyData.firstTimeOnApp == true || DummyData.firstTimeOnApp == null) {
        navigateReplace(context, const DashBoardScreen());
      } else {
        logger.i("Check User");
        //  DummyData.localUserID = sharedPreferences.getString("UserID");
        DummyData.emailAddress = sharedPreferences.getString("Email");
        DummyData.password = sharedPreferences.getString("Password");
        DummyData.accessToken = sharedPreferences.getString("accessToken");

        logger.i(DummyData.emailAddress);
        logger.i(DummyData.accessToken);
        // logger.i( 'device Token: $token');
        // AuthViewModel().deviceToken = token!;
        // logger.i('Main Device Token: ${AuthViewModel().deviceToken}');

        // JwtDecoder.tryDecode(DummyData.accessToken.toString());
        // bool hasExpired = JwtDecoder.isExpired(DummyData.accessToken.toString());
        // if(!hasExpired){
        //   AuthViewModel().loadData(context,);
        // } else {
        //   if (DummyData.emailAddress != null && DummyData.password != null) {
        //
        //     logger.i(DummyData.emailAddress);
        //     logger.i(DummyData.password);
        //     AuthViewModel().userAutoLogin(context, email: DummyData.emailAddress.toString(),
        //         password: DummyData.password.toString());
        //   } else{
        //     navigateReplace(context, const OnboardingScreen());
        //     logger.e("error");
        //   }
        // }

        ///

        if (DummyData.emailAddress != null && DummyData.password != null) {

          logger.i(DummyData.emailAddress);
          logger.i(DummyData.password);
          AuthViewModel().userAutoLogin(context, email: DummyData.emailAddress.toString(),
              password: DummyData.password.toString());
        } else{
          navigateReplace(context, const DashBoardScreen());
          logger.e("error");
        }

        //navigateReplace(context, const OnboardingScreen());
      }

    });
  }



  Future<void> initData() async {
    await Future<void>.delayed(const Duration(seconds: 3));
  }


}