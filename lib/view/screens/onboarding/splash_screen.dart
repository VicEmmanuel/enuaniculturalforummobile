import 'dart:async';

import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/screens.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/dashboard_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/onboarding/onboarding_screen.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void didChangeDependencies() {
    var postProvider = ref.watch(postViewModel);
    postProvider.getAllPosts(context);
    postProvider.getAllCategories(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => navigateReplace(context, const DashBoardScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(themeViewModel);
    var theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: theme.primaryColor,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             ImageView.asset(
              AppImages.logo,
              width: 200.w,
            ),
            // SizedBox(
            //   height: 12.57.h,
            // ),

            TextView(
              text: 'Preserving Igbo Cultural Heritage...',
              textStyle: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
