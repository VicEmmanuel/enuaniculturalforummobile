import 'package:enuaniculturalforummobile/model/local/onboarding_items_model.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/utils/navigators.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/login_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final int numPages = onboardingItemModel.length;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> buidPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.only(right: 5.w),
      height: 3.h,
      width: isActive ? 28.w : 28.w,
      decoration: BoxDecoration(
        color: isActive ? AppColors.kPrimary1 : const  Color(0xFFDFE8FA),
        borderRadius: BorderRadius.all(Radius.circular(9.r)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        onPageChanged: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        itemCount: numPages,
        itemBuilder: (ctx, index) {
          return SafeArea(
            child: Column(

              children: [
                SizedBox(height: 30.w,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: buidPageIndicator(),
                      ),

                      currentPage != numPages - 1
                          ?
                      nextButton(): Container(
                        height: 40.h,
                      )


                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextItems(
                      index: index,
                    ),
                  ),
                ),
                SizedBox(height: 46.h,),
                ImageView.svg(
                  onboardingItemModel[index].image.toString(),
                  // height: 350.h,
                ),

              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Column(
              children: [
                DefaultButtonMain(
                  text: createAccountText,
                  onPressed: () {
                    navigatePush(context, const SignUpScreen());
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                DefaultButtonMain(
                  text: login,
                  color: AppColors.kSkyBlue,
                  textColor: AppColors.kPrimary1,
                  onPressed: () {
                    navigatePush(context, const LoginScreen());

                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                   TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      // the new route
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                          const GuestHomeScreen()),
                          (Route route) => false,
                    );
                  },
                  child: const TextView(
                    text: skipToAppText,
                    color: AppColors.kPrimary1,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                )

              ],
            ),
          )),
    );
  }

  // skipButton() {
  //   return InkWell(
  //     onTap: () {
  //       pageController.animateToPage(
  //         numPages - 1,
  //         duration: const Duration(milliseconds: 200),
  //         curve: Curves.easeOut,
  //       );
  //     },
  //     child: Align(
  //         alignment: Alignment.topRight,
  //         child: Container(
  //           padding: EdgeInsets.symmetric(vertical: 7.h),
  //           child: TextView(
  //             text: "Skip",
  //             fontSize: 16.sp,
  //             fontWeight: FontWeight.w700,
  //             color: Colors.white,
  //           ),
  //         )),
  //   );
  // }

  nextButton() {
    return InkWell(
      onTap: () {
        setState(() {
          currentPage != numPages - 1
              ? pageController.nextPage(

            duration:
            const Duration(
                milliseconds:
                500),
            curve: Curves.easeIn,
          )
              : null;
        });
      },
      child: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 40.h,
            padding: EdgeInsets.symmetric( horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.kSkyBlue,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                const TextView(
                  text: nextText,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 4.w,),
                 Icon(Icons.arrow_forward, size: 18.r,)
              ],
            ),
          )),
    );
  }
}

class TextItems extends StatelessWidget {
  const TextItems({
    Key? key,
    // required this.size,
    required this.index,
  }) : super(key: key);

  //final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: 268.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextView(
              text: onboardingItemModel[index].title,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              maxLines: 3,
              color: AppColors.kPrimary1,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextView(
              text: onboardingItemModel[index].subTitle,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              maxLines: 3,
              color: Colors.black,
              textAlign: TextAlign.start,
            ),
          ],
        ));
  }
}
