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
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: 'Choose Recyclable Item',
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

                    selectItemWidget(),
                    SizedBox(
                      height: 40.h,
                    ),

                    SizedBox(
                      height: 40.h,
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

    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(
          6.r,
        ),
        border: Border.all(
          width: 1.2.w,
          color: AppColors.kDisabledButton,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint:  Text(
            'Select Item',
            style: TextStyle(color: AppColors.kTextBlack, fontFamily: 'Outfit', fontSize: 16.sp),
          ),
          value: provider.selectedItem,
          icon: Image.asset(
            AppImages.moreIcon,
            // AppImages.dropDown,
            width: 24.w,
          ),
          iconSize: 24.h,
          // elevation: 16,
          style: const TextStyle(color: Colors.black),
          onChanged: (newState) {
            setState(() {
              provider.selectedItem = newState!;
              logger.f(provider.selectedItem);
            });
          },
          items: provider.categoryResponse!.data!.categories!.map<DropdownMenuItem<String>>((CategoryData value) {
            return DropdownMenuItem<String>(
              value: value.categories.toString(),
              child: TextView(
                text: value.categories.toString(),
                color: AppColors.kTextBlack,
                fontSize: 16.sp,
              ),
            );
          } as DropdownMenuItem<String> Function(String e)).toList(),
        ),
      ),
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
                text: 'Attach ${postProvider.selectedItem} Image',
                fontSize: 22.sp,
                textAlign: TextAlign.start,
                fontWeight: FontWeight.w600,

              ),
              TextView(
                text: 'Pick ${postProvider.selectedItem} recycle image from your device',
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,

                color: theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
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
