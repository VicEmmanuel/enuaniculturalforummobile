import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Replace this with your actual list length
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: EdgeInsets.symmetric( vertical: 15.h),
            child: Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  title: Container(
                    height: 12.h,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    height: 16.h,
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 16.h,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
