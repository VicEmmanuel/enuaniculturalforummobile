import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/recover_password_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/sign_up_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(authViewModel);
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
                  text: welcomeBackText,
                  color: AppColors.kPrimary1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: enterLoginDetailsText,
                  fontSize: 14.sp,
                ),
                SizedBox(
                  height: 32.h,
                ),
                 Form(
                   key: loginFormKey,
                   child: Column(
                     children: [
                       CustomTextField(
                        fieldLabel: emailAddressText,
                        hint: emailExample,
                        controller: provider.loginEmailController,
                         validator: (value) =>
                             Validators().validateEmptyTextField(value),
                                       ),
                       SizedBox(
                         height: 12.h,
                       ),
                       CustomTextField(
                         fieldLabel: password,
                         hint: enterPasswordText,

                         // focusNode: passwordFocusNode,
                         password: true,
                         validator: (value) =>
                             Validators().validateEmptyTextField(value),
                         controller: provider.loginPwdController,
                         obscureInput: provider.loginObscurePass,
                         onObscureText: provider.toggleLoginPwdVisibility,

                         //onChanged: (value)=> provider.updateButtonState(),
                       ),
                     ],
                   ),
                 ),

                SizedBox(
                  height: 2.h,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        navigatePush(context,const RecoverPasswordScreen());

                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          // color: Colors.red,
                          child: TextView(
                            text: forgotPasswordText,
                            fontSize: 14.sp,
                            color: AppColors.kPrimary1,
                          )),
                    )),
                SizedBox(height: 32.h),
                DefaultButtonMain(
                  text: logIn,
                  buttonState: provider.buttonLoginState!.buttonState,
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {
                      loginFormKey.currentState!.save();
                      provider.userLogin(context);
                    }
                    // navigatePush(context, const DashBoardScreen());
                  },
                ),
                SizedBox(height: 62.h),

                doNotHaveAccount(),
                SizedBox(height: 30.h),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        // the new route
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const DashBoardScreen()),
                            (Route route) => false,
                      );
                    },
                    child: TextView(
                      text: skipToAppText,
                      color: AppColors.kPrimary1,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }

  doNotHaveAccount() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '$dontHaveAnAccount    ',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14.sp,
            fontFamily: monaSansFont,
            fontWeight: FontWeight.w400,
          ),
          children: <TextSpan>[
            TextSpan(
              text: createAccount,
              style: TextStyle(
                color: AppColors.kPrimary1,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.kPrimary1,
                decorationStyle: TextDecorationStyle.solid,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => navigateReplace(
                      context,
                      const SignUpScreen(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
