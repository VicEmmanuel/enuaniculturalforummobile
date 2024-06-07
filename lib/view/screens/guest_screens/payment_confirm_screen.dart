import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/payment_confirm.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/payment_successful_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../view_model/payment_veiw_model/payment_view_model.dart';

class PaymentConfirmScreen extends ConsumerStatefulWidget {
  const PaymentConfirmScreen({super.key});

  @override
  ConsumerState<PaymentConfirmScreen> createState() =>
      _PaymentConfirmScreenState();
}

class _PaymentConfirmScreenState extends ConsumerState<PaymentConfirmScreen> {
  @override
  void didChangeDependencies() {
    ref.watch(paymentViewModel).resetIsMakingTransactionMode();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);

    return Scaffold(
      // backgroundColor: AppColors.kScaffoldBackgroundColor,
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        arrowBackColor: AppColors.kBlack4,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              const PaymentConfirm(),
              const Expanded(
                  child: SizedBox(
                height: 20,
              )),
              paymentProvider.isAccountFetched &&
                      paymentProvider.paymentType == 1
                  ? DefaultButtonMain(
                      text: iHaveSentTheMoneyText,
                      onPressed: () {
                        // navigatePush(context, const PaymentSuccessfulScreen());
                        paymentProvider.checkTransactionMode(context);
                      },
                      // buttonState: ButtonState.disabled,
                    )
                  : paymentProvider.paymentType == 2 ?DefaultButtonMain(
                      text: payNowText,
                      onPressed: () {
                        paymentProvider.checkTransactionMode(context);
                        // navigatePush(context, const PaymentSuccessfulScreen());
                      },
                    ):Container(),
            ],
          ),
        ),
      ),
    );
  }
}
