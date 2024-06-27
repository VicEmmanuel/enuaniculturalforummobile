import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:flutter/material.dart';

class QuickMenuButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final String title;
  const QuickMenuButton({super.key, required this.onPressed, required this.iconPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height:  102.0.h,
      width: 106.w,

      decoration: BoxDecoration(
          color:Color(0xFFF1F5FD),

          borderRadius: BorderRadius.circular(12.0.r),
          border: Border.all(color: Color(0xffDFE8FA) ,width: 1.0.w )),
      child: ButtonTheme(
        child:

        MaterialButton(
          padding: EdgeInsets.zero,
          height:  102.0.h,


          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(12.0.r), // Adjust the radius as needed
          ),
          // disabledColor:(buttonState == ButtonState.disabled)?Colors.grey:null,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(height: 45.h, width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Color(0xFFDFE8FA),
                    borderRadius: BorderRadius.circular(8.r)

                  ),
                    child: Center(child: ImageView.asset(iconPath, width: 40.w,  height: 40.h,),),
                  ),
                ),
                SizedBox(height: 15.h,),
                TextView(text: title, fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.kPrimary1,),
              ],
            ),
          ),

        ),
      ),
    );
  }
}
