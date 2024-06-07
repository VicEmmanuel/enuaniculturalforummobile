import 'package:flutter/material.dart';
import 'package:enuaniculturalforummobile/model/local/dummy_data.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

showBottomModalSheet(BuildContext context, {required Widget widget}) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(21.r),
      topLeft: Radius.circular(21.r),
    )),
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
          // height: 227.h,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: widget
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     widget
          //   ],
          // ),
          );
    },
  );
}

showLocaleBottomModalSheet(BuildContext context, {required Widget widget}) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(21.r),
      topLeft: Radius.circular(21.r),
    )),
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
          height: 350.h,
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: widget
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     widget
          //   ],
          // ),
          );
    },
  );
}
//1
Future<void> displayDeleteConfirmationMessageAlert(
  BuildContext context,
  String title, {
  required String message,
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 350.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    TextView(
                      text: message,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: 'Continue',
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
//2
Future<void> displayDeleteUserProfileConfirmationMessageAlert(
  BuildContext context,
  String title, {
  required bool isDismissible,
  VoidCallback? onTap,
  required ThemeData theme,
  required ThemeMode themeMode,
  // btnOneText,
}) async {
  final width = MediaQuery.sizeOf(context).width;
  final deviceH = MediaQuery.sizeOf(context).height;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.dark ? theme.cardColor : AppColors.kWhite,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: (deviceH / 1.65).h,
            //height: getAlertDialogHeight(),
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(
                          text: 'Are you sure you want to delete your account?',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          maxLines: 3,
                          fontFamily: monaSansFont,
                        ),
                        SizedBox(height: 16.0.h),
                        TextView(
                          text:
                              'Deleting your account will result in the following:',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          maxLines: 3,
                          fontFamily: monaSansFont,
                        ),
                        SizedBox(height: 8.0.h),
                        TextView(
                          text: '1. Loss of all your account data.',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          maxLines: 3,
                          fontFamily: monaSansFont,
                        ),
                        TextView(
                          text:
                              '2. Inability to recover your account information.',
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          maxLines: 3,
                          fontFamily: monaSansFont,
                        ),
                        SizedBox(height: 16.0.h),
                        TextView(
                          text:
                              'This action is irreversible. Please consider the consequences before proceeding.',
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          maxLines: 4,
                          fontFamily: monaSansFont,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: continueText,
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
//3
Future<void> displayValidatePasswordAlert(BuildContext context,
    {required VoidCallback onTap,
    required TextEditingController passwordController,
    required bool obscureInput,
    required String actionText,
  final void Function()? onObscureText,
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  final width = MediaQuery.of(context).size.width;
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (ctx) {
      return AlertDialog(
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          height: 320.h,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.w),
            child: Column(
              children: [
                TextView(
                  text: 'Enter your password',
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                  fieldLabel: '',
                  hint: password,
                  password: true,
                  validator: (value) =>
                      Validators().validateEmptyTextField(value),
                  controller: passwordController,
                  obscureInput: obscureInput,
                  showSuffixIcon: false,
                  onObscureText: onObscureText,
                ),
                SizedBox(
                  height: 26.h,
                ),
                DefaultButtonMain(
                  color: AppColors.kErrorPrimary,
                  width: 200.w,
                  text: actionText,
                  borderColor: AppColors.kErrorPrimary,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: onTap,
                ),
                SizedBox(
                  height: 10.h,
                ),
                DefaultButtonMain(
                  width: 200.w,
                  text: cancel,
                  color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                  borderColor: theme.colorScheme.primary,
                  borderRadius: 38.r,
                  textColor: theme.colorScheme.primary,
                  height: 48.h,
                  onPressed: () {
                    navigateBack(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


Future<dynamic> displayExitDialog(
  BuildContext context, {
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        title: Center(
          child: TextView(
            text: 'Exit App',
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: TextView(
          text: 'Are you sure you want to exit the app?',
          fontSize: 14.sp,
          maxLines: 2,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DefaultButtonMain(
                  color: Colors.white,
                  width: 120.w,
                  textColor: AppColors.kPrimary1,
                  text: 'No',
                  borderColor: AppColors.kPrimary1,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ),
              SizedBox(width: 5.w,),
              Expanded(
                child: DefaultButtonMain(
                  color: AppColors.kPrimary1,
                  width: 120.w,
                  text: 'Yes',
                  borderColor: AppColors.kPrimary1,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}

//6
Future<dynamic> addPhotosFromCameraOrGalleryDialog(
  BuildContext context, {
  required VoidCallback cameraOnTap,
  required VoidCallback galleryOnTap,
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        // title: Center(
        //   child: TextView(
        //     text: 'Exit App',
        //     fontSize: 16.sp,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
        content: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              TextView(
                text: 'Add photos from...',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              Gap(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: galleryOnTap,
                    child: Column(
                      children: [
                        Icon(
                          Icons.photo_camera,
                          size: 24.sp,
                          color: themeMode == ThemeMode.light
                              ? AppColors.kPrimary1
                              : AppColors.kPrimary150,
                        ),
                        const Gap(5),
                        TextView(
                          text: "Gallery",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: monaSansFont,
                        ),
                      ],
                    ),
                  ),
                  const Gap(15),
                  InkWell(
                    onTap: cameraOnTap,
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 24.sp,
                          color: themeMode == ThemeMode.light
                              ? AppColors.kPrimary1
                              : AppColors.kPrimary150,
                        ),
                        const Gap(5),
                        TextView(
                          text: "Camera",
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: monaSansFont,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}



//8
Future<dynamic> displayLogoutDialog(BuildContext context,{
  required VoidCallback onTap,
  required ThemeMode themeMode,
  required ThemeData theme,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
        title: Center(
          child: Column(
            children: [
              ImageView.asset(AppImages.logOutSetting,width: 35.w,
                height: 35.h,),
              SizedBox(height: 15.h,),
              TextView(
                text: logOut,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
        content: TextView(
          text: '${DummyData.firstName}, would you like to exit the app?',
          fontSize: 14.sp,
          maxLines: 2,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w500,
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: DefaultButtonMain(
                  color: Colors.white,
                  width: 120.w,
                  textColor: AppColors.kPrimary1,
                  text: 'No',
                  borderColor: AppColors.kPrimary1,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: () {
                    navigateBack(context);
                  },
                ),
              ),
              SizedBox(width: 5.w,),
              Expanded(
                child: DefaultButtonMain(
                  color: AppColors.kPrimary1,
                  width: 120.w,
                  text: 'Yes',
                  borderColor: AppColors.kPrimary1,
                  borderRadius: 38.r,
                  height: 48.h,
                  onPressed: onTap,
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}


Future<void> displayRestrictionMessageAlert(
    BuildContext context,
    String title, {
      required String message,
      required bool isDismissible,
      VoidCallback? onTap,
      required ThemeMode themeMode,
      required ThemeData theme,
      // btnOneText,
    }) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            height: 300.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    TextView(
                      text: message,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}


Future<void> displaySwitchConfirmationMessageAlert(
    BuildContext context,
    String title, {
      required String message,
      required bool isDismissible,
      VoidCallback? onTap,
      required ThemeMode themeMode,
      required ThemeData theme,
      // btnOneText,
    }) async {
  final width = MediaQuery.sizeOf(context).width;
  showDialog(
      barrierDismissible: isDismissible,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: themeMode == ThemeMode.light ? Colors.white : theme.cardColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            // height: 350.h,
            // height: deviceH / 3,
            width: width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    RichText(
                      text: TextSpan(
                        text: message,
                        style: TextStyle(
                            color: themeMode == ThemeMode.light ? Colors.black : AppColors.kWhite,
                            fontSize: 16.sp,
                            fontFamily: monaSansFont,
                            fontWeight: FontWeight.w400),

                      ),
                      textAlign: TextAlign.center,
                    ),

                    // TextView(
                    //   text: message,
                    //   fontWeight: FontWeight.w400,
                    //   textAlign: TextAlign.center,
                    //   maxLines: 5,
                    //   fontSize: 16.sp,
                    // ),
                    SizedBox(
                      height: 26.h,
                    ),

                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      width: 200.w,
                      text: continueText,
                      borderColor: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      onPressed: onTap,
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //       navigatePush(context, EditAccountDetailsScreen());
                    //     },
                    //     text: continueText),
                    SizedBox(
                      height: 10.h,
                    ),

                    DefaultButtonMain(
                      width: 200.w,
                      text: back,
                      color: themeMode == ThemeMode.light ? AppColors.kWhite : theme.cardColor,
                      borderColor: theme.colorScheme.primary,
                      borderRadius: 38.r,
                      textColor: theme.colorScheme.primary,
                      height: 48.h,
                      onPressed: () {
                        navigateBack(context);
                      },
                    ),
                    // buttonConfirmation(
                    //     onPressed: () {
                    //       navigateBack(context);
                    //     },
                    //     text: back,
                    //     gradient: AppColors.white900Gradient,
                    //     textColor: Colors.black)
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

//
// void displayModalNavBar(context, WalletAction walletAction, WidgetRef ref) {
//   showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
//       ),
//       builder: (BuildContext context) {
//         return WalletActionScreen(walletAction: walletAction,);}).whenComplete(() => ref.watch(trxViewModel).getTransactions());
// }
