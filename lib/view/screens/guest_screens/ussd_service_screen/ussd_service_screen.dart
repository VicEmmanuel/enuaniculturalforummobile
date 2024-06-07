import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/app_bars.dart';
import 'package:enuaniculturalforummobile/view/screens/guest_screens/ussd_service_screen/ussd_codes_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UssdServiceScreen extends ConsumerStatefulWidget {
  const UssdServiceScreen({super.key});

  @override
  ConsumerState<UssdServiceScreen> createState() => _UssdServiceScreenState();
}

class _UssdServiceScreenState extends ConsumerState<UssdServiceScreen> {
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: offlineUssdServicesText,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
                TextView(
                  text: findUssdCodesText,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.kTextGray,
                ),
                SizedBox(
                  height: 43.h,
                ),
                TextView(
                  text: selectNetworkProvider,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kTextGray,
                ),
                SizedBox(
                  height: 22.h,
                ),
                networkProviders()
              ],
            ),
          ),
        ),
      ),

    );
  }

  Widget networkProviders() {
    var paymentProvider = ref.watch(paymentViewModel);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.02), // Shadow color
            spreadRadius: 1.5.r, // Spread radius
            blurRadius: 15, // Blur radius
            offset: Offset(-2, 3), // Offset
          ),
        ],
      ),
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: paymentProvider.serviceProvidersWithKey.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            var provider = paymentProvider.serviceProvidersWithKey[index];
            // var numCount = index + 1;
            return Column(
              children: [
                singleNetworkProvider(key: provider['key'], name:provider['name'], iconPath: provider['icon'] ),
                // SizedBox(
                //   height: 5.h,
                // ),
                if (index !=
                    paymentProvider.serviceProvidersWithKey.length - 1)
                  Divider(
                    thickness: 0.15.w,
                    height: 0.r,
                  ),
              ],
            );
          }),
    );
  }

  Widget singleNetworkProvider({
    required String name,
    required String key,
    required String iconPath
  }) {
    var paymentProvider = ref.watch(paymentViewModel);
    return GestureDetector(
      onTap: (){
        paymentProvider.updateNetworkProviderKey(key);
        navigatePush(context, UssdCodesScreen());
        logger.wtf(key);
      },
      child:
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        12.r,
                      ),
                      border:
                          Border.all(color: AppColors.kGrayBorder, width: 1.5.w)),
                  child:  Center(child: ImageView.svg(iconPath)),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: '$name $servicesText',
                      fontWeight: FontWeight.w500,
                    ),
                    TextView(
                      text: '$name $ussdCodeServicesText',
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: AppColors.kTextGrayDescription,
                    ),
                  ],
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.r,
            )
          ],
        ),
      ),
    );
  }
}
