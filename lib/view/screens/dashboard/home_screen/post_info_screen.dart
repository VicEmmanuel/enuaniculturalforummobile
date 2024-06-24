import 'package:enuaniculturalforummobile/model/response/local_response/category_response.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/utils/custom_print.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostInfoScreen extends ConsumerStatefulWidget {
  const PostInfoScreen({super.key});

  @override
  ConsumerState<PostInfoScreen> createState() => _PostInfoScreenState();
}

class _PostInfoScreenState extends ConsumerState<PostInfoScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    var postProvider = ref.watch(postViewModel);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: 'Create New Post',
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                // height: 450.h,
                // width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomTextField(
                      fieldLabel: title,
                      hint: enterTitle,
                      controller: postProvider.titleController,

                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextField(
                      fieldLabel: author,
                      hint: authorsName,
                      controller: postProvider.authorController,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    selectItemWidget(),

                    SizedBox(
                      height: 10.h,
                    ),
                    postProvider.selectedItem !=null ?recycleImage():Container()
                    // CustomTextField(
                    //   fieldLabel: '',
                    //   hint: selectCountry,
                    //   readOnly: true,
                    //   onTap: () {
                    //     statePopUp();
                    //   },
                    //   borderWidth: 1.5.w,
                    //   controller: TextEditingController(
                    //       text: listingsProvider.selectedState ?? ''),
                    //   borderColor: AppColors.kDisabledButton,
                    //   borderRadius: 6.r,
                    //   fillColor: AppColors.kWhite,
                    //   isFilled: true,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectItemWidget() {
    var provider = ref.watch(postViewModel);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextView(
          text: category,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.kTextGray,
        ),
        SizedBox(height: 5.h,),
        Container(
          height: 55.h,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(
              8.r,
            ),
            border: Border.all(
              width: 1.2.w,
              color: AppColors.kDisabledButton,
            ),
          ),
          padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                'Select Category',
                style: TextStyle(color: const Color(0xFFB0B0B0), fontFamily: monaSansFont, fontSize: 12.sp),
              ),
              value: provider.selectedItem,
              icon: Image.asset(
                AppImages.logo,
                width: 24.w,
              ),
              iconSize: 24.h,
              style: const TextStyle(color: Colors.black),
              onChanged: (newState) {
                setState(() {
                  provider.selectedItem = newState!;
                  logger.f(provider.selectedItem);
                });
              },
              items: provider.categoryResponse?.data?.categories?.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: TextView(
                    text: value,
                    color: AppColors.kTextBlack,
                    fontSize: 16.sp,
                  ),
                );
              }).toList() ?? [], // Ensure items is not null
            ),
          ),
        ),
      ],
    );
  }

  recycleImage(){
    var postProvider = ref.watch(postViewModel);
    ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(
          // height: 88.h,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: 'Attach ${postProvider.selectedItem} Post Image',
                fontSize: 22.sp,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,

              ),
              TextView(
                text: 'Pick ${postProvider.selectedItem} post image from your device',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 200.h,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (postProvider.propertyImageList.isNotEmpty)
                Container(
                  height: 179.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.kTransparent,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                            postProvider.propertyImageList[0]!)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0.r),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            decoration: BoxDecoration(
                                color:
                                AppColors.kPrimary1.withOpacity(0.5),
                                shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: () {
                                postProvider.removeImage(0);
                              },
                              icon: const Icon(
                                CupertinoIcons.delete,
                                color: Colors.red,
                              ),
                            ))),
                  ),
                )
              else
                GestureDetector(
                  onTap: () async {
                    await postProvider.pickMultipleImage();
                  },
                  child: Container(
                      height: 179.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.kGrey,

                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: () async {
                              await postProvider.pickMultipleImage();
                            }, icon: Icon(Icons.image, size: 50.r,),),
                            TextView(text: addPostImage)
                          ],
                        ),
                      )
                  ),
                )


            ],
          ),
        ),
      ],
    );
  }

}
