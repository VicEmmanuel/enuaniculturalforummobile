import 'package:cached_network_image/cached_network_image.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogCard extends ConsumerWidget {
  const BlogCard(
      {super.key,
      required this.imageText,
      required this.title,
      required this.categoryType,
      required this.author,
      required this.timeStamp,
      this.canTap = true,});

  final String imageText;
  final String title;
  final String author;
  final String categoryType;
  final String timeStamp;
  final bool canTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: SizedBox(
        width: 360.w,
        height: 121.h,
        child: Card(
          color: theme.cardColor,
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child:
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                    color: AppColors.kTransparent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        imageText.toString(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.h,
                    horizontal: 7.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        // height: 20.h,
                        child: TextView(
                          text: title,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.spMin,
                          maxLines: 2,
                          fontFamily: monaSansFont,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 4.w,
                                ),

                              ],
                            ),
                            // const Gap(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // width: 67.w,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.kErrorPrimary

                                          ,
                                      borderRadius: BorderRadius.circular(40.r)),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: TextView(
                                      text:
                                          categoryType,
                                      fontFamily: monaSansFont,
                                      fontSize: 10.spMin,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                                TextView(
                                  text:
                                  '${UtilFunctions.formatDate(timeStamp)} ${UtilFunctions.formatTime(timeStamp)}',
                                  fontFamily: monaSansFont,
                                  fontSize: 8.spMin,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // ),
                      RichText(
                        text: TextSpan(
                          text: "By:",
                          style: TextStyle(
                            color: themeMode == ThemeMode.light
                                ? AppColors.kBlack4
                                : AppColors.kHintText,
                            fontSize: 12.spMin,
                            fontWeight: FontWeight.w400,
                            fontFamily: monaSansFont,
                          ),
                          children: [
                            TextSpan(
                              text: ' $author',
                              // text:
                              //     ' ${UtilFunctions.currency(context)} ${UtilFunctions.formatAmount(
                              //   double.parse(1),
                              // )} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.spMin,
                                  fontFamily: monaSansFont,
                                  color: themeMode == ThemeMode.light
                                      ? AppColors.kBlack4
                                      : AppColors.kWhite),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
