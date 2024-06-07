import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/person_increment_controller.dart';
import 'package:enuaniculturalforummobile/view/screens/guest_screens/flight_bill-screens/flight_search_result_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightBillScreen extends ConsumerStatefulWidget {
  const FlightBillScreen({super.key});

  @override
  ConsumerState<FlightBillScreen> createState() => _FlightBillScreenState();
}

class _FlightBillScreenState extends ConsumerState<FlightBillScreen> {
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
                  text: flightBillsPaymentText,
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
                  height: 28.h,
                ),
                // selectWidget(),
                // CustomDropDown(),
                const CustomTextField(
                  fieldLabel: flightTypeText,
                  hint: flightTypeText,
                  keyboardType: TextInputType.number,
                  showSuffixIcon: true,
                  readOnly: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const CustomTextField(
                  fieldLabel: departureText,
                  hint: selectText,
                  keyboardType: TextInputType.number,
                  showSuffixIcon: true,
                  readOnly: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  fieldLabel: destinationText,
                  hint: selectText,
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
                  fieldLabel: tripTypeText,
                  hint: selectText,
                  keyboardType: TextInputType.number,
                  readOnly: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                dateTime(),
                SizedBox(
                  height: 20.h,
                ),
                peopleIncrementSection(),
                SizedBox(
                  height: 40.h,
                ),
                DefaultButtonMain(
                  text: searchFlightText,
                  onPressed: () {
                    // navigatePush(context, const MySample());
                    navigatePush(context, const FlightSearchResultScreen());
                  },
                ),
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

  peopleIncrementSection() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Column(
      children: [
        PersonIncrementContainer(
          text: adultsText,
          label: adultsText,
          number: paymentProvider.noOfAdults,
          onIncrement: () {
            paymentProvider
                .incrementDecrementValue(paymentProvider.noOfAdults++);
          },
          onDecrement: () {
            if (paymentProvider.noOfAdults > 0) {
              paymentProvider
                  .incrementDecrementValue(paymentProvider.noOfAdults--);
            }
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        PersonIncrementContainer(
          text: childrenText,
          label: childrenText,
          number: paymentProvider.noOfChildren,
          onIncrement: () {
            paymentProvider
                .incrementDecrementValue(paymentProvider.noOfChildren++);
          },
          onDecrement: () {
            if (paymentProvider.noOfChildren > 0) {
              paymentProvider
                  .incrementDecrementValue(paymentProvider.noOfChildren--);
            }
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        PersonIncrementContainer(
          text: infantsText,
          label: infantsText,
          number: paymentProvider.noOfInfants,
          onIncrement: () {
            paymentProvider
                .incrementDecrementValue(paymentProvider.noOfInfants++);
          },
          onDecrement: () {
            if (paymentProvider.noOfInfants > 0) {
              paymentProvider
                  .incrementDecrementValue(paymentProvider.noOfInfants--);
            }
          },
        )
      ],
    );
  }

  dateTime() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultDateAndTimeButton(
          onTap: () {
            paymentProvider.showDatePickerMethod(context,
                selectedDate: paymentProvider.departureDate.toString());
          },
          width: 147.w,
          height: 34.w,
          icon: Icon(
            Icons.calendar_month_outlined,
            size: 24.sp,
            color: const Color(0xFF888888),
          ),
          text: paymentProvider.departureDate == null
              ? 'Select Date'
              : paymentProvider.departureDate.toString(),
          label: departureDateText,
        ),
        DefaultDateAndTimeButton(
          onTap: () {
            paymentProvider.showReturnDatePickerMethod(context,
                selectedDate: paymentProvider.arrivalDate.toString());
          },
          width: 147.w,
          height: 34.w,
          label: returnDateText,
          icon: Icon(
            Icons.calendar_month_outlined,
            size: 24.sp,
            color: const Color(0xFF888888),
          ),
          text: paymentProvider.arrivalDate == null
              ? 'Select Date'
              : paymentProvider.arrivalDate.toString(),
        ),
      ],
    );
  }
}
