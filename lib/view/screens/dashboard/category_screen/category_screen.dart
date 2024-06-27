import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/quick_menu_button.dart';
import 'package:enuaniculturalforummobile/view/components/shared/responsive_wrap.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/category_screen/category_details_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var postProvider = ref.watch(postViewModel);
    var themeProvider = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: XResponsiveWrap.mobile(
          onRefresh: () => postProvider
              .getAllPosts(context)
              .then((value) => postProvider.getAllCategories(context)),
          // loading: provider.isGettingPersonalListings,
          // loadFailed:  recycleProvider.recycleHistoryResponse!.data == [],
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h,),
                        TextView(
                          text: 'Category',
                          fontSize: 20.h,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 20.h,),

                        quickMenuItems()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
                title: 'Articles',
                iconPath: AppImages.articlesIconPng,

                onPressed: () {
                  paymentProvider.clearData();
                  // postProvider.getPostByCategories(context, slug: 'articles');
                  navigatePush(context, const CategoryDetailsScreen(title: 'Articles', slug: 'articles'));
                  // navigatePush(context, BuyAirtimeScreen());
                }),
            QuickMenuButton(
                title: 'Food',
                iconPath: AppImages.foodIconPng,
                onPressed: () {
                  paymentProvider.clearData();
                  // postProvider.getNewsFromDb(context);
                  navigatePush(context, const CategoryDetailsScreen(title: 'Food', slug: 'food'));


                  // navigatePush(context, BuyDataScreen());
                }),
            QuickMenuButton(
                title: 'Festival',
                iconPath: AppImages.festivalIconPng,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const CategoryDetailsScreen(title: 'Festival', slug: 'festival'));
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
                title: 'Music',
                iconPath: AppImages.musicIconPng,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const CategoryDetailsScreen(title: 'Music', slug: 'music'));

                  // navigatePush(context, const SchoolFeesScreen());
                }),
            QuickMenuButton(
                title: 'Dance',
                iconPath: AppImages.festivalIconPng,
                onPressed: () {
                  paymentProvider.clearData();
                  navigatePush(context, const CategoryDetailsScreen(title: 'Dance', slug: 'dance'));


                  // navigatePush(context, const TvBillScreen());
                }),
            SizedBox(
              height: 102.0.h,
              width: 106.w,
            )
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
