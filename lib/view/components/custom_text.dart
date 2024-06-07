import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enuaniculturalforummobile/src/config.dart';

import '../../view_model/theme_view_model.dart';

class TextView extends ConsumerWidget {
  const TextView({
    required this.text,
    super.key,
    this.textOverflow = TextOverflow.ellipsis,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.textStyle,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.maxLines,
    this.decoration,
    this.wordSpacing,
  });

  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final VoidCallback? onTap;
  final int? maxLines;
  final double? fontSize;
  final TextStyle? textStyle;
  final Color? color;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final double? wordSpacing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     ref.watch(themeViewModel).themeMode;
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        key: key,
        style: textStyle ??
            TextStyle(
              fontFamily: fontFamily ?? monaSansFont,
              fontSize: fontSize != null ? fontSize! : 14.sp,
              fontWeight: fontWeight ?? FontWeight.w400,
              // color: color ?? AppColors.kTextBlack,
              color: color ?? Theme.of(context).colorScheme.primary,
                  // (themeMode == ThemeMode.dark
                  // ? Theme.of(context).textTheme.bodySmall!.color
                  // : Theme.of(context).primaryColor),
              decoration: decoration,
              wordSpacing: wordSpacing,
            ),
        textAlign: textAlign,
        overflow: textOverflow,
        maxLines: maxLines,
      ),
    );
  }
}
