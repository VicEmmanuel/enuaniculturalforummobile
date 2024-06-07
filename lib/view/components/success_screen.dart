import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';

class SuccessScreen extends ConsumerStatefulWidget {
  final String infoText;
  final Widget newPage;
  final String navigateButtonText;
  const SuccessScreen(
      {super.key, required this.infoText, required this.newPage, required this.navigateButtonText});

  @override
  ConsumerState<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends ConsumerState<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 2), () {
    //   setState(() {
    //     showLoader = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 70.w),
                  //   child: Center(child: ImageView.asset(AppImages.splashSuccess)),
                  // ),
                  Image.asset(
                    AppImages.successImage,
                    // width: 40,
                    width: 265.w,
                    height: 205.h,
                    color: themeMode == ThemeMode.dark ? theme.scaffoldBackgroundColor : null,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              // height: 58.h,
              width: 265.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Success',
                    fontSize: 22.sp,
                    fontFamily: monaSansFont,
                    fontWeight: FontWeight.w600,
                  ),
                  TextView(
                    text: widget.infoText,
                    fontSize: 15.sp,
                    fontFamily: monaSansFont,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    color: themeMode == ThemeMode.light ? AppColors.kSubText : AppColors.kHintText,
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
      ),
    );
  }
}
