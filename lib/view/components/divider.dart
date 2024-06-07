import 'package:flutter/material.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';

class BunchPayDivider extends ConsumerWidget {
  const BunchPayDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeViewModel);
    var theme = Theme.of(context);
    return Divider(
      thickness: 0.15.w,
      height: 0.r,

    );
  }
}
