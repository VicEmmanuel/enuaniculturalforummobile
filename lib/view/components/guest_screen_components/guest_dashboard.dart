import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/login_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/auth_screens/sign_up_screen.dart';
import 'package:enuaniculturalforummobile/view_model/dashboard/dashboard_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GuestsDashboard extends ConsumerWidget {
  const GuestsDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 127.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.kGuestDashboard,
          image: const DecorationImage(
              image: AssetImage(AppImages.guestDashboardBackground),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView(
            text: payBillText,
            color: AppColors.kWhite,
            fontSize: 36.sp,
            fontWeight: FontWeight.w600,
          ),
          TextView(
            text: dashboardDescText,
            color: AppColors.kWhite,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 17.h,),
          Row(
            children: [
              DefaultButtonMain(
                text: createAccount,
                fontSize: 12.sp,
                width: 124.w,
                color: Colors.white.withOpacity(0.3),
                height: 37.h,
                borderRadius: 4.r,
                fontWeight: FontWeight.w600,
                onPressed: (){
                  navigatePush(context, SignUpScreen());
                },
              ),
              SizedBox(
                width: 16.w,
              ),
              DefaultButtonMain(
                text: logIn,
                fontSize: 12.sp,
                width: 70.w,
                height: 37.h,
                borderRadius: 4.r,
                fontWeight: FontWeight.w600,
                onPressed: (){
                  navigatePush(context, LoginScreen());
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}


class UserDashboard extends ConsumerWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dashboardProvider = ref.watch(dashboardViewModel);
    var paymentProvider = ref.watch(paymentViewModel);

    return Container(
      // height: 127.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.kGuestDashboard,
          image: const DecorationImage(
              image: AssetImage(AppImages.guestDashboardBackground),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextView(
                text: yourBalanceText,
                color: AppColors.kWhite,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(width: 3.w,),

              InkWell(
                  onTap: () {
                    dashboardProvider.toggleObscure();
                  },
                  child: SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child: Icon(
                      dashboardProvider.isObscure
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 20.r,
                      color: AppColors.kWhite,
                    ),
                  ))

            ],
          ),
          TextView(
            text:dashboardProvider.isObscure ?  "****": 'NGN 300,000.00',
            color: AppColors.kWhite,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 17.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text:walletNumberText,
                  color: AppColors.kWhite,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
                Row(children: [
                  TextView(
                    text: '0123456789',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.kWhite,

                  ),
                  SizedBox(width: 10.w,),

                  InkWell(
                    onTap: (){
                      paymentProvider.copyToClipBoard(
                          value: '0123456789', context);
                    },
                    child:
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(

                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6.r)

                      ),
                      child: Icon(
                        Icons.copy,
                        color: AppColors.kWhite,
                        size: 16.r,
                      ),
                    ),
                  )
                ],)
              ],
            ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 9.h),
                decoration: BoxDecoration(

                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8.r)

                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.kWhite,
                      size: 16.r,
                    ),
                    SizedBox(width: 9.w,),
                    TextView(
                      text: fundWalletText,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kWhite,

                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

