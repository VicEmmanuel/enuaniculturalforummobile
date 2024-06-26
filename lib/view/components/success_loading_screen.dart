import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:enuaniculturalforummobile/config/app_colors.dart';
import 'package:enuaniculturalforummobile/config/app_images.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';
import 'package:loading_indicator/loading_indicator.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              // color: Colors.red,
              // height: 800.h,
              alignment: Alignment.center,
              child: SizedBox(
                height: 140.h,
                width: 100.w,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballGridBeat,
                  colors: [
                    theme.primaryColor,
                  ],
                  strokeWidth: 2,
                  // backgroundColor: AppColors.kWhite,
                  pathBackgroundColor: theme.colorScheme.primary,
                ),
              ),
            ),
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
        ));
  }
}
