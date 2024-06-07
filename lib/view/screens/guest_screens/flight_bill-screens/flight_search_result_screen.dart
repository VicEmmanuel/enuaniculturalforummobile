import 'dart:async';

import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightSearchResultScreen extends ConsumerStatefulWidget {
  const FlightSearchResultScreen({super.key});

  @override
  ConsumerState<FlightSearchResultScreen> createState() =>
      _FlightSearchResultScreenState();
}

class _FlightSearchResultScreenState
    extends ConsumerState<FlightSearchResultScreen> {
  @override
  void initState() {
    // TODO: implement initState
      Timer(const Duration(milliseconds: 2100), () {
      ref.watch(paymentViewModel).updateFlightSearchResult();
    });
    super.initState();
  }

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
                  text: '$searchResultsForText "LAG to PHC”',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 13.h,
                ),
                paymentProvider.isGettingFlightSearchResult
                    ? const ShimmerLoader()
                    : flightDetails()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget flightDetails() {
    return ListView.builder(
      itemCount: 10, // Replace this with your actual list length
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FlightDetailsCard(
          airlineCompanyName: 'Ibom Air',
          price: '207,500',
          departureTime: '18:40',
          arrivalTime: '20:05',
          departureLocation: 'LAG',
          departureAirportLocation: 'Muritala Muhammed International Airport',
          destinationLocation: 'PHC',
          destinationAirportLocation: 'Port Harcourt International Airport.',
          flightDuration: '1h 25m',
          numberOfStops: '0 Stops',
          onTap: () {

            navigatePush(context, const PaymentMethodScreen());
          },
        );
      },
    );
  }
}
