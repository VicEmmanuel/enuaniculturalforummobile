import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view/components/custom_text.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DefaultDateAndTimeButton extends ConsumerWidget {
  const DefaultDateAndTimeButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.icon,
    required this.onTap,
    required this.label,
    this.hasTitle =true
  });
  final double? width;
  final double height;
  final Widget icon;
  final String? text;
  final String label;
  final VoidCallback onTap;
  final bool? hasTitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var themeMode = ref.watch(themeViewModel).themeMode;
    // final myFocusNode = widget.focusNode;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasTitle == true?Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            TextView(
              text: label,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextGray,
            ),
            SizedBox(height: 5.h,),
          ],
        ):Container(),
        InkWell(
          onTap: onTap,
          child: Container(

            width: 160.w,
            // height: 73.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color:const Color(0xFFB0B0B0))

            ),
            child: Center(
              child: Padding(

                padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    TextView(
                      text: text!,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: text!.isEmpty?  Colors.grey :AppColors.kBlack4,

                    ),
                    InkWell(
                      onTap: onTap,
                      child: icon,

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}