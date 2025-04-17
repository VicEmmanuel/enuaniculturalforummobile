import 'package:bot_toast/bot_toast.dart';
import 'package:enuaniculturalforummobile/utils/color_extension.dart';
import 'package:enuaniculturalforummobile/view/screens/onboarding/splash_screen.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rebirth/rebirth.dart';

import 'config/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: AppColors.kPrimary1));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const WidgetRebirth(materialApp: ProviderScope(child: MyApp()))));
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void didChangeDependencies() {
    ref.watch(themeViewModel).init();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    var themeProvider = ref.watch(themeViewModel);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      // designSize:  Size(WidgetsBinding.instance.window.physicalSize.width/3, WidgetsBinding.instance.window.physicalSize.height/3),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: themeProvider.themeMode,
          darkTheme: AppTheme.darkTheme,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: child,

        );
      },

      child: const SplashScreen(),
    );
  }
}