import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/guest_screens/ussd_service_screen/ussd_service_screen.dart';
import 'package:flutter/material.dart';

class UssdCard extends StatelessWidget {
  const UssdCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatePush(context, const UssdServiceScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFF1F5FD),
            borderRadius: BorderRadius.circular(12.0.r),
            border: Border.all(color: Color(0xffDFE8FA), width: 1.0.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                      color: Color(0xFFDFE8FA),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                    child: ImageView.svg(
                      AppImages.ussdIconOne,
                      width: 13.33.w,
                      height: 13.33.h,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h, ),
                  // width:130.w,

                  decoration: BoxDecoration(
                      color: Color(0xFFDFE8FA),
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(
                    child: TextView(text: seeUssdDirectoryText, fontSize: 10.h, fontWeight: FontWeight.w500, color: AppColors.kPrimary1,)
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            TextView(
              text: ussdServiceText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.kTextQuickMenu,
            ),
            SizedBox(height: 4.h,),
            Row(
              children: [
                Expanded(
                  child: TextView(
                    text: noNeedToMemorizeUssdText,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.kTextQuickMenu,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
