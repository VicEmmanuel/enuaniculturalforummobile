
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';



class XResponsiveWrap {
  // static Widget web({
  //   required Widget mobileView,
  //   required Widget tabView,
  //   bool loading = false,
  // }) {
  //   return WResponsiveWrap(
  //     mobileView: mobileView,
  //     tabView: tabView,
  //     loading: loading,
  //   );
  // }

  static Widget mobile({
    required List<Widget> children,
    required Future<void> Function() onRefresh,
    EdgeInsetsGeometry? padding,
    ScrollController? controller,
    bool loading = false,
    bool loadFailed = false,
    Color backgroundColor = AppColors.kWhite,
  }) {
    return MResponsiveWrap(
      loading: loading,
      loadFailed: loadFailed,
      onRefresh: onRefresh,
      padding: padding,
      backgroundColor: backgroundColor,
      controller: controller,
      children: children,
    );
  }
}



class MResponsiveWrap extends ConsumerWidget {
  const MResponsiveWrap({
    required this.children,
    required this.onRefresh,
    this.loading = false,
    this.loadFailed = false,
    required this.backgroundColor,
    this.padding,
    this.controller,
    super.key,
  });
  final List<Widget> children;
  final bool loading;
  final bool loadFailed;
  final Color backgroundColor;
  final Future<void> Function() onRefresh;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeViewModel);
    var theme = Theme.of(context);
    /// The line `final layout = CustomLayoutChangeNotifier.of(context);` is retrieving the instance of
    /// the `CustomLayoutChangeNotifier` class from the current `BuildContext`. This allows the widget
    /// to access the layout information provided by the `CustomLayoutChangeNotifier`, such as the
    /// current device constraints and screen size.
    //final layout = CustomLayoutChangeNotifier.of(context);

    //print(layout!.constraint!.maxWidth);

    return Material(
     // color: Theme.of(context).scaffoldBackgroundColor,
      // color:  backgroundColor,
      // color: themeProvider.themeMode==ThemeMode.light? backgroundColor:Colors.black,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: onRefresh,
          displacement: 5,
          edgeOffset: 4,
          child: ListView(
            controller: controller,
            padding: padding,
            children: loading
                ? [
              Container(
                alignment: Alignment.center,
                height: 700.h,
                child:  Container(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 70,
                      width: 70,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballGridPulse,
                        colors: const [
                          AppColors.kPrimary2,
                        ],
                        strokeWidth: 2,
                        backgroundColor: theme.scaffoldBackgroundColor,
                        pathBackgroundColor: theme.colorScheme.primary,
                      ),
                    ))
              ),
            ]
                : loadFailed
                ? const [MobileErrorPage()]
                : children,
          ),
        ),
      ),
    );
  }
}
