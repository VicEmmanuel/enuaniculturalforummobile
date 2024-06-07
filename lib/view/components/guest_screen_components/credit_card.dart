import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/guest_screens/payment_confirm_screen.dart';
import 'package:enuaniculturalforummobile/view_model/payment_veiw_model/payment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreditCardScreenWidget extends ConsumerStatefulWidget {
  const CreditCardScreenWidget({super.key});

  @override
  ConsumerState<CreditCardScreenWidget> createState() =>
      CreditCardScreenWidgetState();
}

class CreditCardScreenWidgetState
    extends ConsumerState<CreditCardScreenWidget> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   var paymentProvider = ref.watch(paymentViewModel);
  //   paymentProvider.cvvFocusNode.addListener(paymentProvider.handleFocusChange);
  // }

  @override
  void didChangeDependencies() {
    var paymentProvider = ref.watch(paymentViewModel);
    paymentProvider.cvvFocusNode.addListener(paymentProvider.handleFocusChange);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var paymentProvider = ref.watch(paymentViewModel);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        arrowBackColor: AppColors.kBlack4,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 1.5.r, // Spread radius
                        blurRadius: 15, // Blur radius
                        offset: Offset(-2, 3), // Offset
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: '5,000.00',
                                style: TextStyle(
                                    fontSize: 24.sp,
                                    fontFamily: monaSansFont,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.kPrimary1),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' $ngnText',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                             Row(children: [
                              const ImageView.svg(AppImages.visaCardIcon),
                              SizedBox(width: 10.w,),
                              const ImageView.svg(AppImages.masterCardIcon),
                            ],)
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Divider(
                          height: 0.r,
                          thickness: 0.6.w,
                        ),
                        SizedBox(height: 10.h,),

                        TextView(
                          text: payWithBankCardText,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: AppColors.kTextGray,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CreditCardWidget(
                          padding: 0.0,
                          // enableFloatingCard: useFloatingAnimation,
                          cardNumber: paymentProvider.cardNumber,
                          expiryDate: paymentProvider.expiryDate,
                          cardHolderName: paymentProvider.cardHolder,
                          cvvCode: paymentProvider.cvvCode,
                          // bankName: 'CARD',
                          // textStyle: Theme.of(context).textTheme.titleLarge!.merge(
                          //   const TextStyle(
                          //     color: Colors.black,
                          //     fontFamily: monaSansFont,
                          //     fontSize: 16,
                          //   ),
                          // ),
                          showBackView: paymentProvider.isCvvFocused,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardBgColor: Color(0xFF1865dd),
                          backgroundImage: AppImages.atmCardBackground,
                          isSwipeGestureEnabled: true,

                          onCreditCardWidgetChange:
                              (CreditCardBrand creditCardBrand) {},
                          customCardTypeIcons: <CustomCardTypeIcon>[
                            // CustomCardTypeIcon(
                            //   cardType: CardType.mastercard,
                            //   cardImage: Image.asset(
                            //     'assets/mastercard.png',
                            //     height: 48,
                            //     width: 48,
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 23.h,
                        ),
                        Column(
                          children: <Widget>[
                            CustomTextField(
                              fieldLabel: cardNumberText,
                              hint: 'e.g 1234 5678 9012 3456',
                              controller: paymentProvider.cardNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatter: [CreditCardFormatter()],
                              onChanged: (value) {
                                paymentProvider.updateCardNumber();
                              },
                              maxlength: 19,
                            ),
                            SizedBox(height: 20.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: CustomTextField(
                                  fieldLabel: expiryDateText,
                                  hint: 'MM/YY',
                                  width: 145.5.w,
                                  controller:
                                      paymentProvider.expiryDateController,
                                  inputFormatter: [DateFormatter()],
                                  maxlength: 5,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    paymentProvider.updateCardNumber();
                                  },
                                )),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Expanded(
                                    child: CustomTextField(
                                  fieldLabel: cvvText,
                                  hint: cvvText,
                                  width: 145.5.w,
                                  maxlength: 4,
                                  keyboardType: TextInputType.number,
                                  controller: paymentProvider.cvvCodeController,
                                  focusNode: paymentProvider.cvvFocusNode,
                                  onChanged: (value) {
                                    paymentProvider.updateCardNumber();
                                  },
                                  // obscureInput: true,
                                )),
                              ],
                            ),
                            SizedBox(height: 20.w),
                            CustomTextField(
                              fieldLabel: cardHolderNameText,
                              hint: 'Enter card holder\'s name',
                              controller:
                                  paymentProvider.cardHoldersNameController,
                              onChanged: (value) {
                                paymentProvider.updateCardNumber();
                              },
                              maxlength: 19,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 7.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Color(0xFFF1F9FE)),
                              child: Row(
                                children: [
                                  ImageView.svg(
                                    AppImages.infoIcon,
                                    height: 13.h,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  TextView(
                                    text: infoCardDetailsSaveText,
                                    maxLines: 2,
                                    fontSize: 10.sp,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: AppColors.kScaffoldBackgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: DefaultButtonMain(
            text: continueText,
            onPressed: () {
              _onValidate;
              navigatePush(context, const PaymentConfirmScreen());
            },
          ),
        ),
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }
}
