import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/login_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var registrationProvider = ref.watch(registrationViewModel);
    return Scaffold(
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: AppColors.kWhite,
        buttonColor: AppColors.kSkyBlue,
        arrowBackColor: AppColors.kBlack4,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                TextView(
                  text: createAccountText,
                  color: AppColors.kPrimary1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: kindlyProvideAccurateDetailsText,
                  fontSize: 14.sp,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 32.h,
                ),

                Form(
                  key: registrationProvider.registrationFormKey,
                  child: Column(
                    children: [
                       CustomTextField(
                        fieldLabel: fullName,
                        hint: fullName,
                        controller: registrationProvider.fullNameController,
                        validator: (value) =>
                            Validators().validateEmptyTextField(value),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                       CustomTextField(
                        fieldLabel: emailAddressText,
                         controller: registrationProvider.registerEmailController,

                         hint: emailExample,
                        validator: (value) => Validators().validateEmail(value),
                      ),

                      SizedBox(
                        height: 12.h,
                      ),
                      PasswordValidatedFields(
                        textEditingController: registrationProvider.registerPwdController,
                        obscureInput: registrationProvider.obscurePasswordText,
                        confirmPasswordWidget: CustomTextField(
                          fieldLabel: confirmPasswordText,
                          hint: enterPasswordText,

                          controller: registrationProvider.registerConfirmPwdController,
                          password: true,
                          validator: (value) => Validators().validateConfirmPassword(
                            registrationProvider.registerPwdController.text,
                            registrationProvider.registerConfirmPwdController.text,
                          ),
                          obscureInput: registrationProvider.obscureConfirmPwdText,
                          onObscureText: registrationProvider.toggleConfirmPwdVisibility,
                        ),
                        onObscureText: registrationProvider.togglePwdVisibility, fieldLabel: password,
                      ),
                    ],
                  ),
                ),


                // SizedBox(height: 2.h),
                DefaultButtonMain(
                  text: createAccountText,
                  buttonState: registrationProvider.buttonRegisterState!.buttonState,
                  onPressed: () {
                    registrationProvider.userRegistration(context);
                    // navigatePush(context, const DashBoardScreen());
                  },
                ),
                SizedBox(height: 10.h),
                alreadyHaveAccount(),
                SizedBox(height: 10.h),

              ],
            ),
          ),
        ),
      ),
    );
  }
  alreadyHaveAccount() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '$alreadyHaveAnAccountText    ',
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
                ..onTap = () => navigateReplace(
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
