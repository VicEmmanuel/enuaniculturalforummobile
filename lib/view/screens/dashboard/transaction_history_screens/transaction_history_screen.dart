import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view/components/custom_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TransactionHistoryScreen extends ConsumerStatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  ConsumerState<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState
    extends ConsumerState<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.kScaffoldBackgroundColor,
          // leadingWidth: 65.w,
          // toolbarHeight: 55.h,
          titleSpacing: 0.r,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: TextView(
              text: transactionsHistoryText,
              fontSize: 16.sp,
              fontFamily: monaSansFont,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20.h, top: 12.h, bottom: 5.h),
              child: InkWell(
                onTap: () {
                  CustomAlerts().displayFiltersModalSheet(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.89.h,
                    horizontal: 14.w,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Center(child: ImageView.svg(AppImages.filterIcon)),
                ),
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size(0, 0), child: Container())),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                transactions()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget transactions() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Column(
        children: [
          singleTransaction(
              title: randomTransactionsTextOne,
              iconPath: AppImages.debitIcon,
              transactionColor: AppColors.kRedFainted,
              amountColor: AppColors.kRed,
              onTap: () {}),
          divider(),
          singleTransaction(
              title: randomTransactionsTextTwo,
              iconPath: AppImages.creditIcon,
              transactionColor: AppColors.kGreenFainted,
              amountColor: AppColors.kGreenCredit,
              onTap: () {})
        ],
      ),
    );
  }

  Widget singleTransaction(
      {required String title,
      required VoidCallback onTap,
      Color? amountColor,
      Color? transactionColor,
      required String iconPath}) {
    // var paymentProvider = ref.watch(paymentViewModel);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(16.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: transactionColor),
                      child: Center(child: ImageView.svg(iconPath))),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: TextView(
                      text: title,
                      maxLines: 3,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextView(
                  text: 'NGN 5,000',
                  color: amountColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextView(
                  text: 'Mar 20, 2024',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const BunchPayDivider(),
    );
  }
}
