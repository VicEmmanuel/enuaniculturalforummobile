import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/guest_screens/payment_method_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BuyDataScreen extends ConsumerStatefulWidget {
  const BuyDataScreen({super.key});

  @override
  ConsumerState<BuyDataScreen> createState() => _BuyDataScreenState();
}

class _BuyDataScreenState extends ConsumerState<BuyDataScreen> {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    return Scaffold(
      // backgroundColor: AppColors.kScaffoldBackgroundColor,
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        arrowBackColor: AppColors.kBlack4,
      ),
      body:
      SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: buyDataStraight,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: topUpYourDataEasily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kTextGray,
                ),
                SizedBox(
                  height: 28.h,
                ),
                TextView(
                  text: selectNetworkProvider,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kTextGray,
                ),
                SizedBox(
                  height: 8.h,
                ),
                networkProvider(),
                SizedBox(
                  height: 22.h,
                ),
                const CustomTextField(
                  fieldLabel: beneficiaryPhoneNumber,
                  hint: 'e.g 08100000000',
                  keyboardType: TextInputType.number,
            
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  fieldLabel: selectDataPackageText,
                  hint: selectDataPackageText,
                  keyboardType: TextInputType.number,
                  inputFormatter: [paymentProvider.currencyFormatter(context)],
                  readOnly: true,
                ) ,
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  fieldLabel: amountText,
                  hint: amountPopulatesHintText,
                  keyboardType: TextInputType.number,
                  inputFormatter: [paymentProvider.currencyFormatter(context)],
                  readOnly: true,
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding:  EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        child: DefaultButtonMain(text: proceedText, onPressed: (){
          if(paymentProvider.selectedNetworkProviderIndex!=null){
            navigatePush(context, PaymentMethodScreen());
          }else{
            showToast(msg: selectNetworkProvider, isError: true);
          }

        },),
      ),

    );
  }
  Widget networkProvider() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          4,
              (index) => GestureDetector(
            onTap: () {
              paymentProvider.updateSelectedNetworkProviderIndex(index);
            },
            child:
            Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(

                // color: paymentProvider.selectedNetworkProviderIndex == index
                //     ? AppColors.kFadedBlue.withOpacity(0.4)
                //     : Colors.white,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r,),
                  border: paymentProvider.selectedNetworkProviderIndex == index ?Border.all( color: AppColors.kPrimary1, width: 1.5.w):null
                // border: Border.all(color: Colors.black),
              ),
              child: Center(child: ImageView.svg(paymentProvider.serviceProviders[index])),
            ),
          ),
        ));
  }
}
