import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';

class EmptyListStateWidget extends ConsumerWidget {
  const EmptyListStateWidget({
    required this.stateDesc,
    this.height,
    this.width,
    this.widget,
    super.key,
  });
  final String stateDesc;
  final double? height;
  final double? width;
  final Widget? widget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      height: height ?? MediaQuery.of(context).size.height / 1.3,
      width: width ?? MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.emptyListIcon,
            width: 150.w,
            height: 150.h,
          ),
          TextView(
            text: stateDesc,
            color: theme.colorScheme.primary.withOpacity(.8),
            fontSize: 13, textAlign: TextAlign.center,
          ),
          SizedBox(
            child: widget,
          )
        ],
      ),
    );
  }
}
