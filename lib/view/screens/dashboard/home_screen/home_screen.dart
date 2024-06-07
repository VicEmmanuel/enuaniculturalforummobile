import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/utils/navigators.dart';
import 'package:enuaniculturalforummobile/view/components/custom_alerts.dart';
import 'package:enuaniculturalforummobile/view/components/custom_text.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/guest_dashboard.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/quick_menu_button.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/ussd_card.dart';
import 'package:enuaniculturalforummobile/view/components/image_view.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void didChangeDependencies() {
    var paymentProvider = ref.read(paymentViewModel);
    paymentProvider.getAllDurationFromJson();
    paymentProvider.clearData();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    var paymentProvider = ref.read(paymentViewModel);
    paymentProvider.clearData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await CustomAlerts().displayExitDialog (
          context,
        );
        return exit;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric( horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  TextView(
                    text: 'Hi, Chinedu',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  const UserDashboard(),

                  SizedBox(
                    height: 36.h,
                  ),
                  TextView(
                    text: quickMenuText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  quickMenuItems(),
                  SizedBox(
                    height: 35.h,
                  ),
                  TextView(
                    text: featuredText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  const SizedBox(
                      width: double.infinity,
                      child: ImageView.svg(AppImages.featuredImage)),
                  SizedBox(
                    height: 12.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget quickMenuItems() {
    var paymentProvider = ref.read(paymentViewModel);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuickMenuButton(
                title: buyAirtime,
                iconPath: AppImages.airtimeIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, BuyAirtimeScreen());
                }),
            QuickMenuButton(
                title: buyData,
                iconPath: AppImages.dataIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, BuyDataScreen());
                }),
            QuickMenuButton(
                title: utilityBill,
                iconPath: AppImages.utilityBillIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const UtilityBillScreen());
                }),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            QuickMenuButton(
                title: schoolFees,
                iconPath: AppImages.schoolFeesIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const SchoolFeesScreen());
                }),
            QuickMenuButton(
                title: cableTv,
                iconPath: AppImages.cableTvIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const TvBillScreen());
                }),
            QuickMenuButton(
                title: governmentBills,
                iconPath: AppImages.governmentMapIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const GovernmentBillScreen());
                }),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            QuickMenuButton(
                title: sportsBetting,
                iconPath: AppImages.sportIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const SportBettingScreen());
                }),
            QuickMenuButton(
                title: flightBills,
                iconPath: AppImages.flightsIconOne,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const FlightBillScreen());
                }),
            SizedBox(
              height: 102.0.h,
              width: 106.w,
            )
            // QuickMenuButton(
            //     title: moreBills,
            //     iconPath: AppImages.moreIconOne,
            //     onPressed: () {
            //       paymentProvider.clearData();
            //     }),
          ],
        ),
        SizedBox(height: 27.h,),
        UssdCard()
      ],
    );
  }
}
