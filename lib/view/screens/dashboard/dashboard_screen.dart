// ignore_for_file: deprecated_member_use

import 'package:enuaniculturalforummobile/view/screens/dashboard/category_screen/category_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/home_screen/home_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/profile_screens/profile_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/transaction_history_screens/transaction_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/utils/alerts.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  void didChangeDependencies() {
    // var profileProvider = ref.watch(profileViewModel);
    // profileProvider.loadData(context).then((value) => ref
    //     .watch(walletViewModel)
    //     .getAcctBalance(userType: profileProvider.profileData!.role!));
    var dashProvider = ref.watch(dashboardViewModel);
    dashProvider.loadDashboardAmountPreference();
    super.didChangeDependencies();
  }

  // int profileProvider.currentIndex = 0;
  List<Widget> dashboardPages = [
    const HomeScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  // List<Widget> guestDashboardPages = [
  //   const MarketPlaceScreen(),
  //   const PropertiesScreen(),
  //   const MenuScreen(),
  // ];
  // @override
  // void initState() {
  //   var dashProvider = ref.watch(dashboardViewModel);
  //   dashProvider.loadDashboardAmountPreference();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    // var profileProvider = ref.watch(profileViewModel);
    var dashProvider = ref.watch(dashboardViewModel);
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    // if (profileProvider.profileData == null) {
    //   return WillPopScope(
    //     onWillPop: () async {
    //       bool exit = await displayExitDialog(
    //         context,
    //         theme: theme,
    //         themeMode: themeMode,
    //       );
    //       return exit;
    //     },
    //     child: Scaffold(
    //         backgroundColor: theme.scaffoldBackgroundColor,
    //         body: Container(
    //           height: 800.h,
    //           alignment: Alignment.center,
    //           child: SizedBox(
    //             height: 200.h,
    //             width: 100.w,
    //             child: LoadingIndicator(
    //               indicatorType: Indicator.ballGridPulse,
    //               colors: [
    //                 theme.indicatorColor,
    //               ],
    //               strokeWidth: 2,
    //               // backgroundColor: AppColors.kWhite,
    //               pathBackgroundColor: theme.colorScheme.primary,
    //             ),
    //           ),
    //         )),
    //   );
    // } else {

      return WillPopScope(
        onWillPop: () async {
          bool exit = await displayExitDialog(
            context,
            theme: theme,
            themeMode: themeMode,
          );
          return exit;
        },
        // onPopInvoked: (value) async {
        //   await displayExitDialog(
        //     context,
        //     theme: theme,
        //     themeMode: themeMode,
        //   );
        // bool exit = await displayExitDialog(context);
        // return exit;
        // },
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: theme.scaffoldBackgroundColor,
          //   automaticallyImplyLeading: false,
          //   title: TextView(
          //     text: int.parse(profileProvider.profileData!.role.toString()) > 1
          //         ? dashProvider.getTitle().toString()
          //         : dashProvider.getGuestTitle().toString(),
          //     textStyle: theme.textTheme.titleLarge!.copyWith(
          //       fontSize: 20.sp,
          //     ),
          //   ),
          //   centerTitle: false,
          //   leadingWidth: 50,
          //   leading: dashProvider.currentIndex == 0 &&
          //           int.parse(profileProvider.profileData!.role.toString()) > 1
          //       ? Center(
          //           child: ProfileImage(
          //           imageType: ProfileImageType.user,
          //           imageUrl:
          //               profileProvider.profileData?.profileImage ?? 'ded',
          //           width: 40.w,
          //           height: 40.h,
          //         ))
          //       : null,
          // ),
          body:  dashboardPages[dashProvider.currentIndex],

          backgroundColor: theme.scaffoldBackgroundColor,
          bottomNavigationBar: Container(
            height: 74.h,
            // padding: EdgeInsets.symmetric(vertical: 8.h),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r), topLeft: Radius.circular(16.r)),
              // boxShadow: [
              //   BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              // ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
              child: BottomNavigationBar(
                showUnselectedLabels: true,
                useLegacyColorScheme: false,
                backgroundColor: Colors.white,
              
                selectedItemColor: AppColors.kPrimary1,
                unselectedItemColor: AppColors.kBlack4,
                selectedLabelStyle: TextStyle(
                  fontFamily: monaSansFont,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: monaSansFont,
                  fontSize: 12.sp,
                  color: AppColors.kBlack4,
                  fontWeight: FontWeight.w600,
                ),
                items: [
                        BottomNavigationBarItem(
                            icon: ImageView.svg(
                              AppImages.homeIcon,
              
                              width: 20.w,
                              height: 20.h,
                              color: dashProvider.currentIndex == 0?AppColors.kPrimary1:null,
                            ),
                            label: homeText),
                        BottomNavigationBarItem(
                            icon: ImageView.svg(
                               AppImages.categoryIcon
                                ,
                              width: 22.w,
                              height: 22.h,
                              color: dashProvider.currentIndex == 1?AppColors.kPrimary1:null,

                            ),
                            label: categoryText),
                        BottomNavigationBarItem(
                            icon: ImageView.svg(
                               AppImages.moreIcon,
                              width: 22.w,
                              height: 22.h,
                              color: dashProvider.currentIndex == 2?AppColors.kPrimary1:null,

                            ),
                            label: moreText),
              
                      ]
                   ,
                onTap: (index) {
                  // dashProvider.getDeviceLocation();
                  dashProvider.setPageIndex(selectedPageIndex: index);
                },
                currentIndex: dashProvider.currentIndex,
              ),
            ),
          ),
        ),
      );
    }
  }
// }
