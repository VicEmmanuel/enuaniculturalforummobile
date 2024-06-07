
import 'package:enuaniculturalforummobile/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enuaniculturalforummobile/src/providers.dart';

class PassCheckRequirements extends ConsumerWidget {
  const PassCheckRequirements({super.key, this.passCheck, this.requirementText,
    this.activeIcon, this.inActiveIcon, this.inActiveColor, this.activeColor,});

  /// a `bool` value as check [required] field in case you want to `modify` the package
  final bool? passCheck;

  /// requirement text [required] field in case you want to `modify` the package
  final String? requirementText;

  /// IconData when requirement is completed
  final IconData? activeIcon;

  /// IconData when requirement is not completed/inActive
  final IconData? inActiveIcon;

  /// inActive color
  final Color? inActiveColor;

  /// Active color
  final Color? activeColor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        children: [

          /// requirement IconData based on check!
          if (passCheck!)
            Icon(
              Icons.check_circle_rounded,
              color: AppColors.kPrimary1,
            )
          else
            Icon(
              Icons.check_circle_outline_rounded,
              color: theme.colorScheme.secondary,
            ),
          const SizedBox(width: 8),

          /// requirement text
          Text(
            requirementText!,
            style: TextStyle(
              color: passCheck! ? theme.colorScheme.primary : theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
