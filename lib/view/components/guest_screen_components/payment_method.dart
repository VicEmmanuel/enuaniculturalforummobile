import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethod extends ConsumerStatefulWidget {
  const PaymentMethod({super.key});

  @override
  ConsumerState<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends ConsumerState<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Shadow color
            spreadRadius: 1.5.r, // Spread radius
            blurRadius: 15, // Blur radius
            offset: Offset(-2, 3), // Offset
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: '5,000.00',
              style: TextStyle(
                  fontSize: 24.sp,
                  fontFamily: monaSansFont,
                  fontWeight: FontWeight.w700,
                  color: AppColors.kPrimary1),
              children: <TextSpan>[
                TextSpan(
                  text: ' $ngnText',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          const TextView(
            text: choosePaymentMethodText,
            color: AppColors.kTextGray,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            height: 12.h,
          ),
          selectPaymentContainer(
              iconPath: AppImages.payWithTransferIconOne,
              title: payWithTransfer,
              value: 1),
          SizedBox(
            height: 12.h,
          ),
          selectPaymentContainer(
              iconPath: AppImages.payWithCardIconOne,
              title: payWithCard,
              value: 2),
          SizedBox(
            height: 12.h,
          ),
          selectPaymentContainer(
              iconPath: AppImages.payFromWalletIconOne,
              title: payFromWallet,
              value: 3,
          isPayFromWallet: true
          ),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }

  Widget selectPaymentContainer(
      {required String iconPath, required String title, required int value, bool? isPayFromWallet}) {
    var paymentProvider = ref.watch(paymentViewModel);

    return Container(
      // padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.kGrayBorder, width: 1.w)),
      width: double.infinity,
      child: Column(
        children: [
          RadioListTile<int>(
            contentPadding: EdgeInsets.zero,

            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 7.33.h, horizontal: 5.33.w),
                    // height: 24.h,
                    // width: 24.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.kPrimaryBlue3),
                    child: Center(
                      child: ImageView.svg(iconPath),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: title,
                      fontWeight: FontWeight.w500,
                    ),
                    isPayFromWallet == true? TextView(text: youNeedToSignUpText, fontSize:8.sp, fontWeight: FontWeight.w500,):Container()
                  ],
                ),
              ],
            ),
            value: value,
            groupValue: paymentProvider.paymentType,
            // authProvider.role,
            onChanged: (int? value) {
              paymentProvider.updatePaymentMethod(value!);
            },
            controlAffinity: ListTileControlAffinity.trailing,
          ),

        ],
      ),
    );
  }
}
