import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:enuaniculturalforummobile/config/app_colors.dart';
import 'package:enuaniculturalforummobile/config/app_images.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';

class SuccessLoadingScreen extends ConsumerStatefulWidget {
  final String informationText;
  final String? detailText;
  const SuccessLoadingScreen({required this.informationText, this.detailText, super.key});

  @override
  ConsumerState<SuccessLoadingScreen> createState() => _SuccessLoadingScreenState();
}

class _SuccessLoadingScreenState extends ConsumerState<SuccessLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.w),
              child: ImageView.asset(
                AppImages.splashSuccess,
                color: themeMode == ThemeMode.dark ? theme.scaffoldBackgroundColor : null,
              ),
            )),
            Center(
              child: SizedBox(
                height: 45.h,
                width: 45.w,
                child: CircularProgressIndicator(
                  color: AppColors.kGreenLoader,
                  backgroundColor: AppColors.kGreenLoader.withOpacity(0.1),
                  strokeWidth: 6,
                ),
              ),
            ),
            Positioned(
              bottom: 230.h,
              left: 20.w,
              right: 20.w,
              child: Center(
                child: Column(
                  children: [
                    TextView(
                      text: widget.informationText,
                      fontWeight: FontWeight.w600,
                      fontSize: 22.sp,
                    ),
                    TextView(
                      text: widget.detailText ?? '',
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
