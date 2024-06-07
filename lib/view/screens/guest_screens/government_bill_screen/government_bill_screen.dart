import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GovernmentBillScreen extends ConsumerStatefulWidget {
  const GovernmentBillScreen({super.key});

  @override
  ConsumerState<GovernmentBillScreen> createState() => _GovernmentBillScreenState();
}

class _GovernmentBillScreenState extends ConsumerState<GovernmentBillScreen> {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    return  Scaffold(
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        arrowBackColor: AppColors.kBlack4,
      ),
      body:   SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: governmentBillsText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: stayOnTheRightSideText,
                  fontSize: 14.sp,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kTextGray,
                ),
                SizedBox(
                  height: 28.h,
                ),
                // selectWidget(),
                // CustomDropDown(),
                const CustomTextField(
                  fieldLabel: serviceText,
                  hint: selectServiceTypeText,
                  keyboardType: TextInputType.number,
                  showSuffixIcon: true,
                  readOnly: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomTextField(
                  fieldLabel: billPackageText,
                  hint: selectBillPackageText,
                  keyboardType: TextInputType.number,
                  showSuffixIcon: true,
                  readOnly: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  fieldLabel: enterNINText,
                  hint: 'e.g 01 2345 6789',
                  keyboardType: TextInputType.number,
                  inputFormatter: [paymentProvider.currencyFormatter(context)],
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  fieldLabel: amountText,
                  hint: amountPopulatesHintText,
                  keyboardType: TextInputType.number,
                  inputFormatter: [paymentProvider.currencyFormatter(context)],
                  readOnly: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomTextField(
                  fieldLabel: phoneNumberText,
                  hint: 'e.g 08100000000',
                  keyboardType: TextInputType.number,

                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomTextField(
                  fieldLabel: descriptionText,
                  hint: '',
                  keyboardType: TextInputType.number,

                ),
                SizedBox(
                  height: 40.h,
                ),
                DefaultButtonMain(text: proceedText, onPressed: (){
                  // navigatePush(context, const MySample());
                  navigatePush(context, const PaymentMethodScreen());
                },),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
