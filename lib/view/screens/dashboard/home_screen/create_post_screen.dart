import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view/components/rich_editor_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/home_screen/post_info_screen.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class PostCreateScreen extends ConsumerStatefulWidget {
  const PostCreateScreen({super.key});

  @override
  ConsumerState<PostCreateScreen> createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends ConsumerState<PostCreateScreen> {
  List<Widget> listingDetailsAndTenantsScreens = [
    const PostInfoScreen(),
    // const ItemScreen(),
    // const DateTimeScreen(),
     QuillEditorWidget(),
    // const ImageScreen(),
    // const PickDateScreen(),


  ];
  @override
  Widget build(BuildContext context) {
    ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);

    var postProvider = ref.watch(postViewModel);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: theme.scaffoldBackgroundColor,
        arrowBackColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 15.h,
          ),
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //List Of Property
              SizedBox(
                // height: 75.h,
                // width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Step Indicator
                    SizedBox(
                        height: 15.h,
                        // width: screenWidth.w,
                        child: StepProgressIndicator(
                          totalSteps: 2,
                          currentStep: postProvider.currentListIndex + 1,
                          selectedColor: AppColors.kPrimary1,
                          unselectedColor: AppColors.kAsh300,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              //PageViewBuilder.
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) => postProvider.pageChange(index),
                  itemCount: listingDetailsAndTenantsScreens.length,
                  itemBuilder: (context, index) {
                    return listingDetailsAndTenantsScreens[postProvider.currentListIndex];
                  },
                ),
              ),
              SizedBox(
                // width: screenWidth.w,
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefaultButtonMain(
                      color: AppColors.kWhite,
                      // borderColor: AppColors.kPrimary,
                      borderRadius: 38.r,
                      height: 48.h,
                      width: 92.w,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.kWhite,
                      text: back,
                      onPressed: () => postProvider.backBtnControl(
                        context,
                      ),
                    ),
                    DefaultButtonMain(
                      color: AppColors.kPrimary1,
                      borderRadius: 38.r,
                      height: 48.h,
                      width: 92.w,
                      // fontFamily: ttHoves,
                      fontSize: 16.sp,
                      // buttonState: postProvider.nextButtonState.buttonState,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.kWhite,
                      text: next,
                      onPressed: () => postProvider.nextBtnControl(
                        context,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
