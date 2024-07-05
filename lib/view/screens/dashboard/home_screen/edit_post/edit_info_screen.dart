import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditInfoScreen extends ConsumerStatefulWidget {
  const EditInfoScreen({super.key});

  @override
  ConsumerState<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends ConsumerState<EditInfoScreen> {
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
                text: 'Edit Post',
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
                      controller: postProvider.editPostNameController,

                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomTextField(
                      fieldLabel: author,
                      hint: authorsName,
                      controller: postProvider.editAuthorController,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    selectItemWidget(),

                    SizedBox(
                      height: 10.h,
                    ),
                    // postProvider.editSelectedItem !=null ?recycleImage():Container()

                    ///
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
              value: provider.editSelectedItem,
              icon: Image.asset(
                AppImages.dropDown,
                width: 24.w,
              ),
              iconSize: 24.h,
              style: const TextStyle(color: Colors.black),
              onChanged: (newState) {
                setState(() {
                  provider.editSelectedItem = newState!;
                  logger.f(provider.editSelectedItem);
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
}
