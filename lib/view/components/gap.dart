
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:enuaniculturalforummobile/view/components/custom_text.dart';

class Gap extends StatelessWidget {
  const Gap(this.size, {super.key});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size?.sp ?? 10.sp,
    );
  }
}



class SectionHeader extends StatelessWidget {
  const SectionHeader(this.text, {super.key, this.bgColor, this.textColor});

  final String text;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        padding: const EdgeInsets.only(left: 24),
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 30.h,
        color: bgColor ?? Colors.black12,
        child: TextView(text: text, color: textColor,),
      ),
    );
  }
}



