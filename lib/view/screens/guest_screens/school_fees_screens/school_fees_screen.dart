import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SchoolFeesScreen extends ConsumerStatefulWidget {
  const SchoolFeesScreen({super.key});

  @override
  ConsumerState<SchoolFeesScreen> createState() => _SchoolFeesScreenState();
}

class _SchoolFeesScreenState extends ConsumerState<SchoolFeesScreen> {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    return Scaffold(
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        arrowBackColor: AppColors.kBlack4,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: schoolFeesText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: noMoreEndlessQueuesText,
                  fontSize: 14.sp,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kTextGray,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: selectPaymentOption(
                          title: withoutRemitaText, value: 1),
                    ),
                    // SizedBox(width: 10.w,),
                    Expanded(
                      child:
                          selectPaymentOption(title: withRemitaText, value: 2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                paymentProvider.schoolFeesPaymentType == 1
                    ? withoutRemitaSection()
                    : withRemitaSection(),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: paymentProvider.schoolFeesPaymentType == 2
          ? Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
              child: DefaultButtonMain(
                text: proceedText,
                onPressed: () {
                  navigatePush(context, const PaymentMethodScreen());
                },
              ),
            )
          : null,
    );
  }

  Widget withoutRemitaSection() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // selectWidget(),
        // CustomDropDown(),
        const CustomTextField(
          fieldLabel: institutionText,
          hint: selectInstitutionText,
          keyboardType: TextInputType.number,
          showSuffixIcon: true,
          readOnly: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        const CustomTextField(
          fieldLabel: serviceText,
          hint: schoolFeesText,
          keyboardType: TextInputType.number,
          showSuffixIcon: true,
          readOnly: true,
        ),
        SizedBox(
          height: 20.h,
        ),
        CustomTextField(
          fieldLabel: sessionText,
          hint: selectSessionText,
          keyboardType: TextInputType.number,
          inputFormatter: [paymentProvider.currencyFormatter(context)],
          readOnly: true,
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
        DefaultButtonMain(
          text: proceedText,
          onPressed: () {
            // navigatePush(context, const MySample());
            navigatePush(context, const PaymentMethodScreen());
          },
        ),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }

  Widget withRemitaSection() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextField(
          fieldLabel: rrrBracketText,
          hint: enterRRRNumberText,
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
          height: 4.h,
        ),
      ],
    );
  }

  Widget selectPaymentOption({
    required String title,
    required int value,
  }) {
    var paymentProvider = ref.watch(paymentViewModel);

    return RadioListTile<int>(
      contentPadding: EdgeInsets.zero,
      title: TextView(
        text: title,
        fontWeight: FontWeight.w500,
      ),
      value: value,
      groupValue: paymentProvider.schoolFeesPaymentType,
      // authProvider.role,
      onChanged: (int? value) {
        paymentProvider.updateSchoolFeesPaymentTypeMethod(value!);
      },
      // controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
