import 'package:enuaniculturalforummobile/model/response/local_response/duration_type_response.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/guest_screens/payment_method_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/guest_screen_components/credit_card.dart';

class UtilityBillScreen extends ConsumerStatefulWidget {
  const UtilityBillScreen({super.key});

  @override
  ConsumerState<UtilityBillScreen> createState() => _UtilityBillScreenState();
}

class _UtilityBillScreenState extends ConsumerState<UtilityBillScreen> {
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
                  text: payUtilityBillText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: payUtilityBillInfoDescText,
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
                  fieldLabel: distributionCompanyText,
                  hint: selectDistributionCompanyText,
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
                  fieldLabel: amountText,
                  hint: enterAmountText,
                  keyboardType: TextInputType.number,
                  inputFormatter: [paymentProvider.currencyFormatter(context)],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomTextField(
                  fieldLabel: meterNumberText,
                  hint: 'This automatically populates',
                  keyboardType: TextInputType.number,
            
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
                  height: 70.h,
                ),
                DefaultButtonMain(text: proceedText, onPressed: (){
                  // navigatePush(context, const MySample());
                  navigatePush(context, const PaymentMethodScreen());
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }


}
