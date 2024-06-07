import 'package:flutter/material.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

class AppBars {
  static PreferredSizeWidget mainAppBar(
    BuildContext context, {
    String? text,
    Widget? trailing,
    Widget? bottom,
    double? textSize,
    void Function()? callback,
    bool isVisible = true,
    bool bottomVisible = false,
    required Color? backgroundColor,
    required Color? arrowBackColor,
    Color? titleColor,
    Color? buttonColor,
    bool? iWantToEditAProperty,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 65.w,
      toolbarHeight: 55.h,
      leading: Visibility(
        visible: isVisible,
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 12.h),
          child: InkWell(
              onTap: () {
                navigateBack(context);
              },
              child: Container(
                height: 35.w,
                // width:70 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: buttonColor?? AppColors.kWhite,
                ),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 24.sp,
                      color: arrowBackColor,
                    ),
                    splashRadius: 20,
                    onPressed: () {
                      if (callback != null) {
                        callback();
                      }
                      navigateBack(context);
                    },
                  ),
                ),
              )),
        ),
      ),
      title: text != null
          ? TextView(
              text: text,
              fontSize: textSize == null ? 16.sp : textSize.sp,
              fontFamily: monaSansFont,
              fontWeight: FontWeight.w600,
            )
          : const SizedBox.shrink(),
      centerTitle: true,
      actions: [trailing ?? const SizedBox.shrink()],
      bottom: bottomVisible
          ? PreferredSize(
              preferredSize: const Size(0, 0), child: bottom ?? Container())
          : null,
    );
  }
}
