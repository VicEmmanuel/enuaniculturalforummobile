import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:enuaniculturalforummobile/config/app_colors.dart';
import 'package:enuaniculturalforummobile/config/app_images.dart';
import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';

class ErrorScreen extends ConsumerStatefulWidget {
  final String infoText;
  final Widget newPage;
  final String navigateButtonText;
  const ErrorScreen({
    Key? key,
    required this.infoText,
    required this.navigateButtonText,
    required this.newPage,
  }) : super(key: key);

  @override
  ConsumerState<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends ConsumerState<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeMode themeMode = ref.watch(themeViewModel).themeMode;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ImageView.asset(AppImages.successSplaSh, height: 255.h, width: 264.w,),
          SizedBox(
            height: 50.h,
          ),

          Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.errorImage,
                  width: 265.w,
                  height: 205.h,
                  color: themeMode == ThemeMode.dark ? theme.scaffoldBackgroundColor : null,
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 58.h,
                  width: 265.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextView(
                        text: "Error!",
                        fontSize: 22.sp,
                        fontFamily: monaSansFont,
                        fontWeight: FontWeight.w600,
                      ),
                      TextView(
                        text: widget.infoText,
                        fontSize: 15.sp,
                        fontFamily: monaSansFont,
                        fontWeight: FontWeight.w400,
                        color:
                            themeMode == ThemeMode.light ? AppColors.kSubText : AppColors.kHintText,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45.h,
                ),
                DefaultButtonMain(
                  height: 48.h,
                  text: widget.navigateButtonText,
                  borderRadius: 40.r,
                  color: AppColors.kPrimary1,
                  // buttonState: provider.buttonRegisterState!.buttonState,
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      // the new route
                      MaterialPageRoute(
                        builder: (BuildContext context) => widget.newPage,
                      ),

                      // this function should return true when we're done removing routes
                      // but because we want to remove all other screens, we make it
                      // always return false
                      (Route route) => false,
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
