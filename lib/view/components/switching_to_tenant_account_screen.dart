import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';

import 'package:flutter/material.dart';

class SwitchingToTenantAccountScreen extends StatefulWidget {
  const SwitchingToTenantAccountScreen({Key? key}) : super(key: key);

  @override
  State<SwitchingToTenantAccountScreen> createState() => _SwitchingToTenantAccountScreenState();
}

class _SwitchingToTenantAccountScreenState extends State<SwitchingToTenantAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45.h,
            width: 45.w,
            child: CircularProgressIndicator(
              color: AppColors.kGreenLoader,
              backgroundColor: AppColors.kGreenLoader.withOpacity(0.1),
              strokeWidth: 6,
            ),
          ),
          Gap(15.h),
          TextView(
            text: "Switching to Tenant account",
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            fontFamily: monaSansFont,
            color: AppColors.kTextBlack,
          )
        ],
      )),
    );
  }
}
