// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:jwt_decode/jwt_decode.dart';
// // import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:enuaniculturalforummobile/model/local/dummy_data.dart';
// import 'package:enuaniculturalforummobile/src/screens.dart';
// import 'package:enuaniculturalforummobile/src/utils.dart';
// import 'package:enuaniculturalforummobile/view/screens/onboarding/onboarding_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:enuaniculturalforummobile/view_model/auth/auth_view_model.dart';
// import 'package:enuaniculturalforummobile/view_model/profile/profile_view_model.dart';
//
// final onboardingViewModel = ChangeNotifierProvider((ref) => OnboardingViewModel());
//
// class OnboardingViewModel extends ChangeNotifier {
//
//
//   late SharedPreferences sharedPreferences;
//
//
//   checkUser(context) {
//     initData().then((onValue) async {
//
//       // navigateReplace(context, const OnboardingScreen());
//       // navigateReplace(context, const LoginScreen());
//
//
//
//       sharedPreferences = await SharedPreferences.getInstance();
//       DummyData.isDarkTheme= sharedPreferences.getBool("isDarkTheme") ?? false;
//       DummyData.firstTimeOnApp = sharedPreferences.getBool("firstTimeOnApp");
//       logger.t("First time on App? : ${DummyData.firstTimeOnApp}");
//       logger.t("Is Dark Theme : ${DummyData.isDarkTheme}");
//
//       // ThemeConfig().checkThemeMode();
//
//       if (DummyData.firstTimeOnApp == true || DummyData.firstTimeOnApp == null
//           || DummyData.accessToken == null) {
//         navigateReplace(context, const OnboardingScreen());
//       } else {
//         logger.i("Check User");
//         //  DummyData.localUserID = sharedPreferences.getString("UserID");
//         DummyData.emailAddress = sharedPreferences.getString("Email");
//         DummyData.password = sharedPreferences.getString("Password");
//         DummyData.accessToken = sharedPreferences.getString("accessToken");
//
//         logger.i(DummyData.emailAddress);
//         logger.i(DummyData.accessToken);
//
//         var token = Jwt.parseJwt(DummyData.accessToken.toString());
//         logger.w(token);
//         bool hasExpired = Jwt.isExpired(DummyData.accessToken.toString());
//         logger.w(hasExpired);
//
//         if(!hasExpired){
//
//           await ProfileViewModel().loadData(context).then((value) async {
//             if (value != null) {
//               DummyData.username = value.firstName.toString();
//               DummyData.lastname = value.lastName.toString();
//               await navigateReplace(context, const DashBoardScreen());
//             } else{
//               navigateReplace(context, const OnboardingScreen());
//             }
//           });
//         } else {
//           if (DummyData.emailAddress != null && DummyData.password != null) {
//
//             logger.i(DummyData.emailAddress);
//             logger.i(DummyData.password);
//             AuthViewModel().userAutoLogin(context, email: DummyData.emailAddress.toString(),
//                 password: DummyData.password.toString());
//           } else{
//             navigateReplace(context, const OnboardingScreen());
//             logger.e("error");
//           }
//         }
//
//         ///
//
//         // if (DummyData.emailAddress != null && DummyData.password != null) {
//         //
//         //   logger.i(DummyData.emailAddress);
//         //   logger.i(DummyData.password);
//         //   AuthViewModel().userAutoLogin(context, email: DummyData.emailAddress.toString(),
//         //       password: DummyData.password.toString());
//         // } else{
//         //   navigateReplace(context, const OnboardingScreen());
//         //   logger.e("error");
//         // }
//
//         //navigateReplace(context, const OnboardingScreen());
//       }
//
//
//     });
//   }
//
//
//   Future<void> initData() async {
//     await Future<void>.delayed(const Duration(seconds: 3));
//   }
//
//
// }