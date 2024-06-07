// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

class DefaultButtonMain extends StatelessWidget {
  const DefaultButtonMain(
      {super.key,
      this.onPressed,
      this.text,
      this.color = AppColors.kPrimary1,
      this.textColor,
      this.borderRadius,
      this.width,
      this.height,
      this.padding,
      this.fontSize,
      this.fontWeight,
      this.borderColor,
      this.buttonState = ButtonState.idle,
      this.fontFamily});
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final ButtonState buttonState;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      height: height ?? 50.0.h,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: (buttonState == ButtonState.disabled) ? AppColors.kPrimary1.withOpacity(0.2) : color,

          /// This line of code is setting the background color of the button. It checks the value of the
          /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
          /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
          /// which is passed in when the function is called. If `color` is null, it sets the color to a
          /// default value of `const Color(0xFF09132D)`.
          // color: (buttonState == ButtonState.disabled)
          //     ? AppColors.kPrimary2
          //     : color ?? const Color(0xFF09132D),
          // gradient: (buttonState == ButtonState.disabled)
          //     ? AppColors.disabledGradient
          //     : AppColors.gradientMain,
          // border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 16.0.r),
          border: Border.all(color: borderColor ?? Colors.transparent)),
      child: ButtonTheme(
        child: MaterialButton(
          padding: EdgeInsets.zero,
          height: height ?? 50.0.h,

          onPressed: (buttonState == ButtonState.disabled || buttonState == ButtonState.loading)
              ? null
              : onPressed,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? 16.0.r), // Adjust the radius as needed
          ),
          // disabledColor:(buttonState == ButtonState.disabled)?Colors.grey:null,
          child: Center(
            /// This code is setting the child of the `TextButton` widget. It checks the value of the
            /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
            /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
            /// that the button is in a loading state and the user should wait for the action to complete.
            /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
            /// widget with the `text` parameter passed in when the function is called. The `textColor`,
            /// `fontSize`, and `fontWeight` parameters are also used to style the text.
            child: (buttonState == ButtonState.loading)
                ? SizedBox.square(
                    dimension: 35.r,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircularProgressIndicator(
                        color: AppColors.kWhite,
                      ),
                    ),
                  )
                : Text(
                    text.toString(),
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: fontSize ?? 16.0.sp,
                      fontWeight: fontWeight ?? FontWeight.w500,
                      fontFamily: fontFamily ?? monaSansFont,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class DefaultButtonIconMain extends StatelessWidget {
  const DefaultButtonIconMain(
      {super.key,
      this.onPressed,
      this.text,
      this.color,
      this.textColor,
      this.borderRadius,
      this.width,
      this.height,
      this.padding,
      this.fontSize,
      this.fontWeight,
      this.borderColor, this.imageIcon,
      this.buttonState = ButtonState.idle,
      this.fontFamily});
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Color? textColor;
  final double? borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final ButtonState buttonState;
  final String? fontFamily;
  final String? imageIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0.h,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: (buttonState == ButtonState.disabled) ? AppColors.kNeutralTextGrey : color,

          /// This line of code is setting the background color of the button. It checks the value of the
          /// `buttonState` parameter and if it is equal to `ButtonState.disabled`, it sets the color to
          /// `AppColors.kDarkGrey`. Otherwise, it sets the color to the value of the `color` parameter,
          /// which is passed in when the function is called. If `color` is null, it sets the color to a
          /// default value of `const Color(0xFF09132D)`.
          // color: (buttonState == ButtonState.disabled)
          //     ? AppColors.kPrimary2
          //     : color ?? const Color(0xFF09132D),
          // gradient: (buttonState == ButtonState.disabled)
          //     ? AppColors.disabledGradient
          //     : AppColors.gradientMain,
          // border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
          border: Border.all(color: borderColor ?? Colors.transparent)),
      child: ButtonTheme(
        child: MaterialButton(
          padding: EdgeInsets.zero,
          height: height ?? 50.0.h,

          onPressed: (buttonState == ButtonState.disabled || buttonState == ButtonState.loading)
              ? null
              : onPressed,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? 8.0.r), // Adjust the radius as needed
          ),
          // disabledColor:(buttonState == ButtonState.disabled)?Colors.grey:null,
          child: Center(
            /// This code is setting the child of the `TextButton` widget. It checks the value of the
            /// `buttonState` parameter and if it is equal to `ButtonState.loading`, it sets the child to
            /// a `SizedBox` widget with a `CircularProgressIndicator` inside it. This is used to indicate
            /// that the button is in a loading state and the user should wait for the action to complete.
            /// If `buttonState` is not equal to `ButtonState.loading`, it sets the child to a `Text`
            /// widget with the `text` parameter passed in when the function is called. The `textColor`,
            /// `fontSize`, and `fontWeight` parameters are also used to style the text.
            child: (buttonState == ButtonState.loading)
                ? SizedBox.square(
                    dimension: 35.r,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: CircularProgressIndicator(
                        color: AppColors.kWhite,
                      ),
                    ),
                  )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageView.asset(imageIcon, width: 20.w, height: 20.h,),
                    SizedBox(width: 8.w,),
                    Text(
                        text.toString(),
                        style: TextStyle(
                          color: textColor ?? Colors.white,
                          fontSize: fontSize ?? 16.0.sp,
                          fontWeight: fontWeight ?? FontWeight.w500,
                          fontFamily: fontFamily ?? monaSansFont,
                        ),
                      ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}

class DefaultDivider extends StatelessWidget {
  const DefaultDivider({
    super.key,
    required this.width,
    required this.color,
    required this.thickness,
  });
  final double width;
  final Color color;
  final double thickness;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 2.0.h,
      child: Divider(
        color: color,
        thickness: thickness,
      ),
    );
  }
// }

// class DefaultTextButton extends StatelessWidget {
//   const DefaultTextButton({
//     super.key,
//     required this.height,
//     required this.onTap,
//     this.padding,
//     required this.radius,
//     required this.width,
//     required this.text,
//   });
//   final double width;
//   final double height;
//   final EdgeInsets? padding;
//   final double radius;
//   final VoidCallback onTap;
//   final String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height,
//       padding: padding,
//       decoration: BoxDecoration(
//         color: AppColors.kWhite,
//         borderRadius: BorderRadius.circular(radius),
//         border: Border.all(
//           color: AppColors.kBorderColor,
//         ),
//       ),
//       child: Center(
//         child: TextView(
//           onTap: onTap,
//           text: text,
//           fontWeight: FontWeight.w400,
//           fontSize: 14.sp,
//           color: AppColors.kTextBlack,
//           fontFamily: "Campton",
//         ),
//       ),
//     );
//   }
// }
}
