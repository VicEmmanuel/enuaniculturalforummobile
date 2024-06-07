import 'package:enuaniculturalforummobile/model/local/button_state.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/components/guest_screen_components/credit_card.dart';
import 'package:enuaniculturalforummobile/view/screens/guest_screens/payment_confirm_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import '';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentMethodScreen extends ConsumerStatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  ConsumerState<PaymentMethodScreen> createState() =>
      _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends ConsumerState<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    return Scaffold(
      // backgroundColor: AppColors.kScaffoldBackgroundColor,
        appBar: AppBars.mainAppBar(
          context,
          backgroundColor:  AppColors.kScaffoldBackgroundColor,
          arrowBackColor:  AppColors.kBlack4,
        ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
             const PaymentMethod(),
              const Expanded(child: SizedBox(height: 20,)),
              DefaultButtonMain(
                text: payNowText,
                onPressed: (){

                  if(paymentProvider.paymentType!=null){
                    if(paymentProvider.paymentType ==1){
                      navigatePush(context, const PaymentConfirmScreen());
                    }else if (paymentProvider.paymentType ==2){
                      navigatePush(context,  const CreditCardScreenWidget());
                    }else{
                      navigatePush(context, const PaymentConfirmScreen());
                    }

                  }
                  else{
                    showToast(msg: selectPaymentMethodText, isError: true);
                  }

                },
                // buttonState: ButtonState.disabled,
              )
            ],
          ),
        ),
      ),
    );
  }
}
