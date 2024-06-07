import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomAlerts {
  void displayReceiptFormatSelectModalSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                // height: 500.h,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20.0.w,
                      right: 20.0.w,
                      top: 20.0.h,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: selectFormatText,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildFormatTypeContainer(
                                title: imageText,
                                iconPath: AppImages.imageIcon,
                                onTap: () {},
                                color: AppColors.kPrimary1),
                            buildFormatTypeContainer(
                                title: pdfText,
                                iconPath: AppImages.pdfIcon,
                                onTap: () {},
                                color: const Color(0xFFFA576A))
                          ],
                        ),
                        SizedBox(
                          height: 38.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  buildFormatTypeContainer(
      {required String title,
      required String iconPath,
      required VoidCallback onTap,
      Color? color}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        width: 159.w,
        decoration: BoxDecoration(
            color: AppColors.kAccountDetailsBackground,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageView.svg(
              iconPath,
              color: color,
            ),
            SizedBox(
              height: 32.h,
            ),
            TextView(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> displayCustomLoader(
    BuildContext context, {
    //
    // required bool isDismissible,
    bool? showText = true,
    btnOnePressed,
    btnOneText,
  }) async {
    final width = MediaQuery.of(context).size.width;
    final deviceH = MediaQuery.of(context).size.height;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r)),
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: 250.h,
              // height: deviceH / 3,
              width: width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: Stack(
                        children: [
                          LoadingIndicator(
                            indicatorType: Indicator.circleStrokeSpin,

                            colors: const [
                              AppColors.kPrimary1,
                            ],
                            strokeWidth: 7.w,

                            // backgroundColor: AppColors.kWhite,
                            pathBackgroundColor: AppColors.kWhite,
                          ),
                          Positioned(
                              left: 0.h,
                              right: 0.h,
                              top: 0.h,
                              bottom: 0.h,
                              child: Padding(
                                padding: EdgeInsets.all(20.0.r),
                                child: const ImageView.asset(
                                  AppImages.logoLoader,
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    showText == true
                        ? TextView(
                            text: holdMomentText,
                            fontWeight: FontWeight.w600,
                          )
                        : Container()
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> displayExitDialog(
    BuildContext context,
  ) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          backgroundColor: Colors.white,
          title: Center(
            child: TextView(
              text: exitAppText,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: TextView(
            text: exitAppConfirmationText,
            fontSize: 14.sp,
            maxLines: 3,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DefaultButtonMain(
                    color: Colors.white,
                    width: 120.w,
                    textColor: AppColors.kPrimary1,
                    text: 'No',
                    borderColor: AppColors.kPrimary1,
                    borderRadius: 38.r,
                    height: 48.h,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: DefaultButtonMain(
                    color: AppColors.kPrimary1,
                    width: 120.w,
                    text: 'Yes',
                    borderColor: AppColors.kPrimary1,
                    borderRadius: 38.r,
                    height: 48.h,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  void displayFiltersModalSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                width: double.infinity,
                // height: 500.h,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 24.0.w,
                      right: 18.w,
                      top: 18.h,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextView(
                              text: filtersText,
                              fontWeight: FontWeight.w600,
                            ),
                            GestureDetector(
                                onTap: () {
                                  navigateBack(context);
                                },
                                child: TextView(
                                  text: closeText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        FilterStates(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultButtonMain(
                              text: resetFilterText,
                              width: 145.w,
                              textColor: AppColors.kPrimary1,
                              borderRadius: 8.r,
                              color: AppColors.kSkyBlue,
                              onPressed: (){
                                navigateBack(context);
                              },
                            ),
                            DefaultButtonMain(
                              text: applyText,
                              width: 145.w,
                              borderRadius: 8.r,
                              onPressed: (){
                                navigateBack(context);
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 23.h,)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  ///
  // void displayTransactionPinModalSheet(context) {
  //   showModalBottomSheet(
  //       context: context,
  //       isScrollControlled: true,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
  //       ),
  //       builder: (BuildContext context) {
  //         return StatefulBuilder(
  //           builder: (BuildContext context, StateSetter setState) {
  //             return SizedBox(
  //               // height: 500.h,
  //               child: Padding(
  //                 padding: EdgeInsets.only(
  //                     left: 24.0.w,
  //                     right: 18.w,
  //                     top: 18.h,
  //                     bottom: MediaQuery.of(context).viewInsets.bottom),
  //                 child: SingleChildScrollView(
  //                   child: Column(
  //                     // mainAxisSize: MainAxisSize.min,
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Center(
  //                         child: TextView(
  //                           text: 'Enter Transaction  Pin',
  //                           fontSize: 16.sp,
  //                           fontWeight: FontWeight.w700,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 23.h,
  //                       ),
  //                       buildPinCodeField(context),
  //                       SizedBox(
  //                         height: 15.h,
  //                       ),
  //                       Center(
  //                         child: TextButton(
  //                             onPressed: () {},
  //                             child: TextView(
  //                               text: forgotPin,
  //                               color: AppColors.kPurple,
  //                               fontWeight: FontWeight.w500,
  //                             )),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         );
  //       });
  // }

  //
  // buildPinCodeField(BuildContext context) {
  //   // var provider = ref.watch(authViewModel);
  //   return
  //     PinCodeTextField(
  //     appContext: context,
  //     // obscuringCharacter: '*',
  //     onCompleted: (value) {
  //       _onPincodeEntered(value,context);
  //     },
  //     length: 4,
  //     // controller: provider.otpController,
  //     // obscureText: isObscure,
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     cursorColor: AppColors.kBlack,
  //     keyboardType: TextInputType.number,
  //     animationType: AnimationType.fade,
  //     onChanged: (value) {
  //       // dongleId = value;
  //       // logger.wtf(dongleId);
  //     },
  //     // hintCharacter: '-',
  //     hintStyle: const TextStyle(
  //       color: AppColors.kBlack,
  //       fontFamily: 'Satoshi',
  //     ),
  //
  //     pinTheme: PinTheme(
  //         shape: PinCodeFieldShape.box,
  //         borderRadius: BorderRadius.circular(6.13.r),
  //         fieldHeight: 52.h,
  //         fieldWidth: 62.w,
  //         activeColor: AppColors.kPurple,
  //         activeFillColor: AppColors.kBlack,
  //         selectedFillColor: AppColors.kBlack,
  //         disabledColor: AppColors.kBlack,
  //         inactiveFillColor: AppColors.kBlack,
  //         inactiveColor: const Color(0xff979C9E),
  //         selectedColor: AppColors.kPurple,
  //         borderWidth: 0.15.r),
  //     animationDuration: Duration(milliseconds: 300),
  //   );
  // }
  //
  //
  // void _onPincodeEntered(String pin, BuildContext context ) {
  //   print('Pincode entered: $pin');
  //   navigateBack(context);
  //   navigatePush(context, WithdrawalSuccessScreen());
  // }
  //
  // button({required final VoidCallback onPressed, required final String text}) {
  //   return Container(
  //     height: 50.0.h,
  //     width: 160.w,
  //     decoration: BoxDecoration(
  //       gradient: AppColors.gradientTabMain,
  //       borderRadius: BorderRadius.circular(10.0.r),
  //     ),
  //     child: ButtonTheme(
  //       child: MaterialButton(
  //         padding: EdgeInsets.zero,
  //         height: 50.0.h,
  //         onPressed: onPressed,
  //         shape: RoundedRectangleBorder(
  //           borderRadius:
  //               BorderRadius.circular(10.0.r), // Adjust the radius as needed
  //         ),
  //         child: Center(
  //           child: Text(
  //             text.toString(),
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 16.0.sp,
  //               fontWeight: FontWeight.w500,
  //               fontFamily: 'Campton',
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // buttonConfirmation(
  //     {required final VoidCallback onPressed,
  //     required final String text,
  //     LinearGradient? gradient,
  //     Color? textColor}) {
  //   return Container(
  //     height: 50.0.h,
  //     width: double.infinity,
  //     decoration: BoxDecoration(
  //       gradient: gradient ?? AppColors.gradientTabMain,
  //       borderRadius: BorderRadius.circular(10.0.r),
  //     ),
  //     child: ButtonTheme(
  //       child: MaterialButton(
  //         padding: EdgeInsets.zero,
  //         height: 50.0.h,
  //         onPressed: onPressed,
  //         shape: RoundedRectangleBorder(
  //           borderRadius:
  //               BorderRadius.circular(10.0.r), // Adjust the radius as needed
  //         ),
  //         child: Center(
  //           child: Text(
  //             text.toString(),
  //             style: TextStyle(
  //               color: textColor ?? Colors.white,
  //               fontSize: 16.0.sp,
  //               fontWeight: FontWeight.w500,
  //               fontFamily: 'Campton',
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

class FilterStates extends ConsumerStatefulWidget {
  const FilterStates({super.key});

  @override
  ConsumerState<FilterStates> createState() => _FilterStatesState();
}

class _FilterStatesState extends ConsumerState<FilterStates> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
              text: transactionTypeText,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
          SizedBox(height: 8.w,),
          transactionTypeFilter(),
          SizedBox(height: 20.w,),
          TextView(
              text: sortText,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
          SizedBox(height: 8.w,),
          sortType(),
          SizedBox(height: 20.w,),
          TextView(
              text: dateRangeText,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp),
          SizedBox(height: 8.w,),
          dateTime(),
          SizedBox(height: 48.h,)

        ],
      ),
    );
  }

  Widget transactionTypeFilter() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          3,
          (index) => GestureDetector(
            onTap: () {
              paymentProvider.updateSelectedSortTransactionTypeIndex(index);
              logger.w(paymentProvider.filterTransactionType[index]['name']);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              margin: EdgeInsets.only(right: 20.w),
              decoration: BoxDecoration(

                  // color: paymentProvider.selectedNetworkProviderIndex == index
                  //     ? AppColors.kFadedBlue.withOpacity(0.4)
                  //     : Colors.white,
                  color: AppColors.kSkyBlue,
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                  border: paymentProvider.selectedSortTransactionType == index
                      ? Border.all(color: const Color(0xff90D3FF), width: 1.w)
                      : null
                  // border: Border.all(color: Colors.black),
                  ),
              child: TextView(
                text: paymentProvider.filterTransactionType[index]['name'],
                color: paymentProvider.selectedSortTransactionType == index
                    ? AppColors.kPrimary1
                    : null,
                fontSize: 12.spMin,
                fontWeight: paymentProvider.selectedSortTransactionType == index? FontWeight.w600: FontWeight.w500 ,
              ),
            ),
          ),
        ));
  }

  Widget sortType() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Row(
        children: List.generate(
          2,
          (index) => GestureDetector(
            onTap: () {
              paymentProvider.updateSortTypeIndex(index);
              logger.w(paymentProvider.filterSortType[index]['name']);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              margin: EdgeInsets.only(right: 20.w),
              decoration: BoxDecoration(

                  // color: paymentProvider.selectedNetworkProviderIndex == index
                  //     ? AppColors.kFadedBlue.withOpacity(0.4)
                  //     : Colors.white,
                  color: AppColors.kSkyBlue,
                  borderRadius: BorderRadius.circular(
                    8.r,
                  ),
                  border: paymentProvider.selectedSortType == index
                      ? Border.all(color: const Color(0xff90D3FF), width: 1.w)
                      : null
                  // border: Border.all(color: Colors.black),
                  ),
              child: TextView(
                text: paymentProvider.filterSortType[index]['name'],
                color: paymentProvider.selectedSortType == index
                    ? AppColors.kPrimary1
                    : null,
                fontSize: 12.spMin,
                fontWeight:paymentProvider.selectedSortType == index? FontWeight.w600: FontWeight.w500 ,
              ),
            ),
          ),
        ));
  }


  dateTime() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: DefaultDateAndTimeButton(
            onTap: () {
              paymentProvider.showDatePickerMethod(context,
                  selectedDate: paymentProvider.departureDate.toString());
            },
            width: 147.w,
            height: 34.w,
            hasTitle: false,
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 16.sp,
              color: const Color(0xFF888888),
            ),
            text: paymentProvider.departureDate == null
                ? 'Start Date'
                : paymentProvider.departureDate.toString(),
            label: '',
          ),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 6.w),
          child: Icon(Icons.arrow_forward, size: 16.r,),
        ),
        Expanded(
          child: DefaultDateAndTimeButton(
            onTap: () {
              paymentProvider.showReturnDatePickerMethod(context,
                  selectedDate: paymentProvider.arrivalDate.toString());
            },
            width: 147.w,
            height: 34.w,
            label: '',
            hasTitle: false,
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 16.sp,
              color: const Color(0xFF888888),
            ),
            text: paymentProvider.arrivalDate == null
                ? 'End Date'
                : paymentProvider.arrivalDate.toString(),
          ),
        ),
      ],
    );
  }
}
