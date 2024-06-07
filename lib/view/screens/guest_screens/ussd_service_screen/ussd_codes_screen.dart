import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view/components/app_bars.dart';
import 'package:enuaniculturalforummobile/view/components/custom_text.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UssdCodesScreen extends ConsumerStatefulWidget {
  const UssdCodesScreen({super.key});

  @override
  ConsumerState<UssdCodesScreen> createState() => _UssdCodesScreenState();
}

class _UssdCodesScreenState extends ConsumerState<UssdCodesScreen> {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    var network = paymentProvider.networkProviderKey;
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
                header(),
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
                ussdLists()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header() {
    var network = ref.watch(paymentViewModel).networkProviderKey;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                12.r,
              ),
              border: Border.all(color: AppColors.kGrayBorder, width: 1.5.w)),
          child: Center(
              child: ImageView.svg(network == 'mtn'
                  ? AppImages.mtnIcon
                  : network == 'glo'
                      ? AppImages.gloIcon
                      : network == 'airtel'
                          ? AppImages.airtelIcon
                          : AppImages.nineMobileIcon)),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextView(
              text: network == 'mtn'
                  ? '$mtnText $ussdCodeText'
                  : network == 'glo'
                      ? '$gloText $ussdCodeText'
                      : network == 'airtel'
                          ? '$airtelText $ussdCodeText'
                          : '$nineMobileText $ussdCodeText',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              maxLines: 2,
            ),
            TextView(
              text: simplyClickToUseText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.kTextGray,
            ),
          ],
        ),
      ],
    );
  }

  ussdLists() {
    var network = ref.watch(paymentViewModel).networkProviderKey;
    var paymentProvider = ref.watch(paymentViewModel);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05), // Shadow color
            spreadRadius: 1.5.r, // Spread radius
            blurRadius: 15, // Blur radius
            offset: const Offset(-2, 3), // Offset
          ),
        ],
      ),
      child: Column(
        children: [
          singleUssdContainer(
              name: customerCareText,
              subTitle: simplyClickToUseText,
              onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: airtimeBalanceText,
              subTitle: checkAirtimeBalanceText,
              onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: dataBalanceText,
              subTitle: checkDataBalanceText,
              onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: borrowAirtimeText,
              subTitle: ranOutOfAirtimeText,
              onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: nightPlanSubscriptionText,
              subTitle: buyNightDataPlanText,
              onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: borrowDataText, subTitle: ranOutOfDataText, onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: tariffPlanMigrationText,
              subTitle: migrateToNewPlanText,
              onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: giftDataText,
              subTitle: surpriseFriendWithDataText,
              onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: myNumberText, subTitle: checkNumberText, onTap: () {}),
          customDivider(),
          singleUssdContainer(
              name: moreServicesText,
              subTitle:   network == 'mtn'
                  ? '$exploreMoreWithText $mtnText'
                  : network == 'glo'
                  ? '$exploreMoreWithText $gloText'
                  : network == 'airtel'
                  ? '$exploreMoreWithText $airtelText'
                  : '$exploreMoreWithText $nineMobileText',
              onTap: () {}),
        ],
      ),
    );
  }

  Widget singleUssdContainer(
      {required String name,
      required String subTitle,
      required VoidCallback onTap
      // required String iconPath
      }) {
    var network = ref.watch(paymentViewModel).networkProviderKey;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: network == 'mtn'
                          ? AppColors.kYellowMtn
                          : network == 'glo'
                              ? AppColors.kGreenGlo
                              : network == 'airtel'
                                  ? AppColors.kRedAirtel
                                  : AppColors.kGreenNineMobile,
                      shape: BoxShape.circle),
                  child: const Center(
                      child: ImageView.svg(
                    AppImages.hashIcon,
                    color: Colors.white,
                  )),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: name,
                      fontWeight: FontWeight.w500,
                    ),
                    TextView(
                      text: subTitle,
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

  customDivider() {
    return Divider(
      thickness: 0.15.w,
      height: 16.h,
    );
  }
}
