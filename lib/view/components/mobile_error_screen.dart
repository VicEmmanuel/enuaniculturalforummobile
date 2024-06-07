import 'package:flutter/material.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';

class MobileErrorPage extends StatelessWidget {
  const MobileErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 600.h,
        width: 360.w,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh_outlined,
              size: 130,
            ),
            Gap(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: TextView(
                text:
                'We seem to have run into a bit of a problem with this page, swipe down to reload.',
                textAlign: TextAlign.center,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}