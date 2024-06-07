import 'package:flutter/material.dart';
import 'package:enuaniculturalforummobile/src/config.dart';

class TransactionHistoryDetailsCard extends StatelessWidget {
  const TransactionHistoryDetailsCard({
    super.key,
    this.width,
    this.child,
  });

  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        height: 53.h,
        width: width,
        color: AppColors.kTransparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            child ?? const SizedBox.shrink(),
            SizedBox(
              height: 1.h,
              width: width,
              child: Divider(
                color: AppColors.kDisabledButton,
                thickness: 1.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}




