import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonIncrementContainer extends ConsumerStatefulWidget {

  final String? text;
  final String label;
  final int number;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  const PersonIncrementContainer(
      {
        required this.onIncrement,
        required this.onDecrement,
        required this.text,
        required this.number,
        required this.label,
      super.key});

  @override
  ConsumerState<PersonIncrementContainer> createState() =>
      _PersonIncrementContainerState();
}

class _PersonIncrementContainerState
    extends ConsumerState<PersonIncrementContainer> {
  @override
  Widget build(BuildContext context) {
     var paymentProvider = ref.watch(paymentViewModel);
     int numCount = 0;
    return Container(
      width: double.infinity,
      // height: 73.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFFB0B0B0))),
      child: Center(
        child: Padding(
          padding:
               EdgeInsets.symmetric(horizontal: 12.h, vertical: 13.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextView(
                text: widget.text!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: widget.text!.isEmpty ? Colors.grey : AppColors.kBlack4,
              ),
              Row(children: [
                InkWell(
                    onTap: widget.onDecrement,
                    child: ImageView.svg(AppImages.decrementButtonIcon, height: 24.h, width: 24.w, color: widget.number>0 ? null : Colors.grey,)),
                SizedBox(width: 16.w,),
                TextView(text:widget.number.toString(), fontSize: 18.sp,),
                SizedBox(width: 16.w,),
                InkWell(
                    onTap: widget.onIncrement,
                    child: ImageView.svg(AppImages.incrementButtonIcon,  height: 24.h, width: 24.w,  )),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
