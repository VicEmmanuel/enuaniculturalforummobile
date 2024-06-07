import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view/components/custom_text.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentConfirm extends ConsumerStatefulWidget {
  const PaymentConfirm({super.key});

  @override
  ConsumerState<PaymentConfirm> createState() => _PaymentConfirmState();
}

class _PaymentConfirmState extends ConsumerState<PaymentConfirm> {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    return Container(
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
          TextView(
            text: bunchpayPaymentText,
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
            color: AppColors.kTextGray,
          ),
          SizedBox(
            height: 14.h,
          ),
          Divider(
            height: 0.r,
            thickness: 0.6.w,
          ),
          SizedBox(
            height: 14.h,
          ),
          const TextView(
            text: payWithBankTransfer,
            color: AppColors.kTextGray,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 4.w,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: orderAmountText,
                color: AppColors.kTextGray,
                fontWeight: FontWeight.w500,
              ),
              TextView(
                text: '500.00 NGN',
                color: AppColors.kTextGray,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: totalAmountText,
                color: AppColors.kTextGray,
                fontWeight: FontWeight.w500,
              ),
              TextView(
                text: '500.00 NGN',
                color: AppColors.kTextGray,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: merchantNameText,
                color: AppColors.kTextGray,
                fontWeight: FontWeight.w500,
              ),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Expanded(
                child: TextView(
                  text: 'MTN Communications Nigeria LTD',
                  color: AppColors.kTextGray,
                  maxLines: 3,
                  textAlign: TextAlign.end,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          Divider(
            height: 0.r,
            thickness: 0.6.w,
          ),
          SizedBox(
            height: 12.h,
          ),

         paymentProvider.paymentType==1? payWithTransferAction():payWithCardAction(),

          SizedBox(height: 14.h,),
        ],
      ),
    );
  }

  Widget accountDetails() {
    var paymentProvider = ref.watch(paymentViewModel);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          color: AppColors.kAccountDetailsBackground,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: 'Sterling Bank',
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.kTextGray,
            maxLines: 4,
          ),
          // SizedBox(
          //   height: 5.h,
          // ),
          Row(
            children: [
              TextView(
                text: '01 2345 6789',
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.kTextQuickMenu,
                maxLines: 4,
              ),
              IconButton(
                  onPressed: () {
                    paymentProvider.copyToClipBoard(
                        value: '0123456789', context);
                  },
                  icon: Icon(
                    Icons.copy,
                    color: AppColors.kGuestDashboard.withOpacity(0.6),
                    size: 20.r,
                  )),

            ],
          ),
          SizedBox(height: 10.h,),
          TextView(
            text: accountExpiresInText,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.kTextGray,
            maxLines: 4,
          ),
        ],
      ),
    );
  }


  Widget payWithTransferAction(){
    var paymentProvider = ref.watch(paymentViewModel);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: confirmToPayQuestionText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.kTextGray,
          maxLines: 4,
        ),
        SizedBox(
          height: 12.h,
        ),
        paymentProvider.isAccountFetched
            ? accountDetails()
            : Column(
          children: [
            TextView(
              text: clickToGetAccountDetailsText,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.kTextGray,
              maxLines: 4,
            ),
            SizedBox(
              height: 48.h,
            ),
            DefaultButtonMain(
              text: getAccountDetailsText,
              onPressed: () {
                paymentProvider.updateAccountFetchStatus();
              },
              // buttonState: ButtonState.disabled,
            ),
          ],
        ),
      ],
    );
  }

  Widget payWithCardAction(){
    var paymentProvider = ref.watch(paymentViewModel);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: cardDetailsText,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.kTextGray,
          maxLines: 4,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: cardDetailsText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextGray,
              maxLines: 4,
            ),
            TextView(
              text: '**** **** **** 2345',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextGray,
              maxLines: 4,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: expiryDateText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextGray,
              maxLines: 4,
            ),
            TextView(
              text: '**/28',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextGray,
              maxLines: 4,
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: cardHoldersNameText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextGray,
              maxLines: 4,
            ),
            TextView(
              text: 'Chinedu I. Odii',
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.kTextGray,
              maxLines: 4,
            ),
          ],
        ),

      ],
    );
  }
}
