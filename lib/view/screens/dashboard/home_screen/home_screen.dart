import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/utils/carousel_slider.dart';
import 'package:enuaniculturalforummobile/utils/navigators.dart';
import 'package:enuaniculturalforummobile/view/components/blog_card.dart';
import 'package:enuaniculturalforummobile/view/components/custom_alerts.dart';
import 'package:enuaniculturalforummobile/view/components/custom_text.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/guest_dashboard.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/quick_menu_button.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/ussd_card.dart';
import 'package:enuaniculturalforummobile/view/components/image_view.dart';
import 'package:enuaniculturalforummobile/view/components/rich_editor_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/home_screen/blog_details_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
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
    var postProvider = ref.watch(postViewModel);
    postProvider.getAllPosts(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    var paymentProvider = ref.read(paymentViewModel);
    var postProvider = ref.read(postViewModel);
    paymentProvider.clearData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          bool exit = await CustomAlerts().displayExitDialog(
            context,
          );
          return exit;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: ImageView.asset(
                            AppImages.logo,
                            width: 100.w,
                          ),
                        ),
                        CarouselWithIndicators(items: [''],),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: 'LATEST POSTS',
                          fontWeight: FontWeight.w700,
                          fontSize: 16.spMin,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        posts(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            height: 50,
            width: 50,
            child: FloatingActionButton(
              backgroundColor: AppColors.kPrimary1,
              elevation: 0,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              onPressed: () async {
                // navigatePush(context, RichEditorScreen());
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }

  Widget quickMenuItems() {
    var paymentProvider = ref.read(paymentViewModel);
    var postProvider = ref.read(postViewModel);

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
                  postProvider.getAllPosts(context);
                  // navigatePush(context, BuyAirtimeScreen());
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
        SizedBox(
          height: 27.h,
        ),
        UssdCard()
      ],
    );
  }

  posts() {
    var postProvider = ref.watch(postViewModel);
    return ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      itemCount: postProvider.postResponseModel!.data!.posts!.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = postProvider.postResponseModel!.data!.posts![index];
        // DateTime renewalDate = DateTime.parse(item.renewalDate.toString());
        // int formattedRenewalDate = postProvider.daysBetween(renewalDate);
        return InkWell(
            onTap: () {
              navigatePush(
                  context,
                  BlogDetailsScreen(
                    title: item.title.toString(),
                    blogDetails: item.description.toString(),
                    createdAt: item.createdAt.toString(),
                    author: item.author.toString(),
                    category: item.categoryType.toString(),
                    imagePath: item.filePath.toString(),
                  ));
            },
            child: BlogCard(
              imageText: item.filePath.toString(),
              title: item.title.toString(),
              categoryType: item.categoryType.toString(),
              author: item.author.toString(),
              timeStamp: item.createdAt.toString(),
              canTap: true,
            ));
      },
    );
  }
}
