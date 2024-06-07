import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/custom_alerts.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentSuccessfulScreen extends ConsumerStatefulWidget {
  const PaymentSuccessfulScreen({super.key});

  @override
  ConsumerState<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState
    extends ConsumerState<PaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    return WillPopScope(
      onWillPop: () async {
        bool exit = false;
        // await CustomAlerts().displayExitDialog (
        //   context,
        // );
        return exit;
      },
      child: Scaffold(
        // backgroundColor: AppColors.kScaffoldBackgroundColor,

        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              children: [
                SizedBox(
                  height: 194.h,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 80.h,
                        width: 80.w,
                        decoration: const BoxDecoration(
                            color: AppColors.kGreen, shape: BoxShape.circle),
                        child: Center(
                          child: ImageView.svg(
                            AppImages.successTickIcon,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      TextView(
                        text: paymentSuccessfulText,
                        color: AppColors.kTextSuccessfulPayment,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    shareDownloadSection(),
                    SizedBox(
                      height: 40.h,
                    ),
                    DefaultButtonMain(
                      text: closeText,
                      onPressed: () {
                        navigateReplace(context, const GuestHomeScreen());
                        paymentProvider.clearData();
                      },
                      // buttonState: ButtonState.disabled,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget shareDownloadSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              CustomAlerts().displayReceiptFormatSelectModalSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: Row(
                children: [
                  TextView(
                    text: downloadText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kTextGray,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const ImageView.svg(AppImages.fileDownloadIcon)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              CustomAlerts().displayReceiptFormatSelectModalSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              child: Row(
                children: [
                  TextView(
                    text: shareText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kPrimary1,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  const ImageView.svg(
                    AppImages.shareIcon,
                    color: AppColors.kPrimary1,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
