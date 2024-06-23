import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogDetailsScreen extends StatefulWidget {
  final String title;
  final String blogDetails;
  final String createdAt;
  final String author;
  final String category;
  final String imagePath;
  const BlogDetailsScreen(
      {super.key,
      required this.title,
      required this.blogDetails,
      required this.createdAt,
      required this.author,
      required this.category,
      required this.imagePath});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          image: NetworkImage(widget.imagePath),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextView(
                  text: widget.title,
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w600,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.person,
                      color: AppColors.kPrimary1,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextView(
                      text: widget.author,
                      fontSize: 12.spMin,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // width: 67.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: AppColors.kErrorPrimary,
                          borderRadius: BorderRadius.circular(40.r)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: TextView(
                          text: widget.category,
                          fontFamily: monaSansFont,
                          fontSize: 10.spMin,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    TextView(
                      text:
                          '${UtilFunctions.formatDate(widget.createdAt)} ${UtilFunctions.formatTime(widget.createdAt)}',
                      fontFamily: monaSansFont,
                      fontSize: 10.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Divider(),
                Center(
                  child: Html(
                    data: """
                      ${widget.blogDetails}
                                  
                                  """,
            
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
