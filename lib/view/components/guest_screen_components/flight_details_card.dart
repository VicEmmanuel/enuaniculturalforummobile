import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FlightDetailsCard extends ConsumerStatefulWidget {
  final String airlineCompanyName;
  final String price;
  final String departureTime;
  final String arrivalTime;
  final String departureLocation;
  final String departureAirportLocation;
  final String destinationLocation;
  final String destinationAirportLocation;
  final String flightDuration;
  final String numberOfStops;
  final VoidCallback onTap;
  const FlightDetailsCard(
      {required this.airlineCompanyName,
      required this.price,
      required this.departureTime,
      required this.arrivalTime,
      required this.departureLocation,
      required this.departureAirportLocation,
      required this.destinationLocation,
      required this.destinationAirportLocation,
      required this.flightDuration,
      required this.numberOfStops,
       required this.onTap,
      super.key});

  @override
  ConsumerState<FlightDetailsCard> createState() => _FlightDetailsCardState();
}

class _FlightDetailsCardState extends ConsumerState<FlightDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 12.h),
        child: Container(
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12.r),
            boxShadow: [

              BoxShadow(
                color: Colors.grey.withOpacity(0.05), // Shadow color
                spreadRadius: 1.5.r, // Spread radius
                blurRadius: 15, // Blur radius
                offset: const Offset(2, 3), // Offset
              ),
            ],

          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 45.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                                color: AppColors.kGrayBorder, width: 1.2.w)),
                        child: Center(
                          child: ImageView.svg(AppImages.ibomAirsIcon),
                        ),
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      TextView(
                        text: widget.airlineCompanyName,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  TextView(
                    text: 'NGN ${widget.price}',
                    fontWeight: FontWeight.w700,
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  ///Departure Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: widget.departureTime,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        TextView(
                          text: widget.departureAirportLocation,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),

                        TextView(
                          text: widget.departureLocation,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),

                ///Destination
                  SizedBox(width:10.w ,),
                  Column(children: [
                    TextView(text: widget.flightDuration, fontSize: 8.sp,),
                    ImageView.svg(AppImages.destinationArrowIcon, width: 62.w,),
                    TextView(text: widget.numberOfStops, fontSize: 8.sp,),

                  ],),
                  SizedBox(width:10.w ,),
                  ///Arrivals Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextView(
                          text: widget.arrivalTime,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        TextView(
                          text: widget.destinationAirportLocation,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.w500,
                        ),

                        TextView(
                          text: widget.destinationLocation,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
