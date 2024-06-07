import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/navigators.dart';

class RecoverPasswordScreen extends ConsumerStatefulWidget {
  const RecoverPasswordScreen({super.key});

  @override
  ConsumerState<RecoverPasswordScreen> createState() =>
      _RecoverPasswordScreenState();
}

class _RecoverPasswordScreenState extends ConsumerState<RecoverPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80.h,
                ),
                TextView(
                  text: recoverPasswordText,
                  color: AppColors.kPrimary1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: enterEmailAddressToReceivePasswordText,
                  maxLines: 3,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: 32.h,
                ),
                const CustomTextField(
                  fieldLabel: emailAddressText,
                  hint: 'e.g emailaddress@gmail.com',
                ),
                SizedBox(height: 16.h),
                DefaultButtonMain(
                  text: getResetEmail,
                  onPressed: () {},
                ),
                SizedBox(height: 30.h),
                rememberPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  rememberPassword() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '$rememberPasswordText    ',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14.sp,
            fontFamily: monaSansFont,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: login,
              style: TextStyle(
                color: AppColors.kPrimary1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.kPrimary1,
                decorationStyle: TextDecorationStyle.solid,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => navigatePush(
                      context,
                      const LoginScreen(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
