import 'package:enuaniculturalforummobile/model/response/local_response/duration_type_response.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropDown extends ConsumerStatefulWidget {
  const CustomDropDown({super.key});

  @override
  ConsumerState<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends ConsumerState<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(paymentViewModel);
    return  Container(
      height: 50.h,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(
          6.r,
        ),
        border: Border.all(
            width: 1.2.w,
            color:
            AppColors.kDisabledButton

        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 10.h,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          // dropdownColor: theme.scaffoldBackgroundColor,
          isExpanded: true,
          hint: Text(
            "selectDuration",
            style: TextStyle(
                color:  AppColors.kTextBlack

            ),
          ),
          value: provider.selectedDuration,
          icon: ImageView.svg(
              AppImages.dropDownIcon,
              color: AppColors.kTextBlack

          ),
          iconSize: 24,
          // elevation: 16,
          style: TextStyle(
              color: AppColors.kTextBlack

          ),
          onChanged: (duration) {
            provider.updateDurationName(duration!);
          },
          items: provider.durationTypeResponse!.durationType!
              .map<DropdownMenuItem<String>>((DurationType duration) {
            return DropdownMenuItem<String>(
              value: duration.key,
              child: Text(
                duration.name!,
                style: TextStyle(
                    color:  AppColors.kTextBlack

                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
