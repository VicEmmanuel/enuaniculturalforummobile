// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:xamp/src/components.dart';
// import 'package:xamp/src/utils.dart';
// import 'package:xamp/view_model/auth_view_model.dart';
// import 'package:xamp/view_model/trx_view_model.dart';
//
// class WalletActionScreen extends ConsumerStatefulWidget {
//  final WalletAction walletAction;
//   const WalletActionScreen({super.key, required this.walletAction});
//
//   @override
//   ConsumerState<WalletActionScreen> createState() => _WalletActionScreenState();
// }
//
// class _WalletActionScreenState extends ConsumerState<WalletActionScreen> {
//   TextEditingController amountController = TextEditingController();
//   FocusNode focusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();
//
//
//   @override
//   void didChangeDependencies() {
//     AuthViewModel().getUserPhoneNumber();
//     super.didChangeDependencies();
//   }
//   @override
//   Widget build(BuildContext context) {
//     var provider = ref.watch(trxViewModel);
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: 40.h,
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//                 child: Center(
//                   child: TextView(text: widget.walletAction.name.toString().toUpperCase(), color: Colors.white,),
//                 ),
//               ),
//             ),
//             provider.isGettingTrx
//                 ? SizedBox(height: 400.h,
//                 child: const Center(child: CircularProgressIndicator()))
//                 :Column(
//               children: [
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 Form(
//                   key: formKey,
//                   child: CustomTextField(fieldLabel: 'Enter Amount for ${widget.walletAction.name}', hint: 'Enter Amount for ${widget.walletAction.name}', focusNode: focusNode,
//                   controller: amountController,  validator: (value) => Validators().validateInteger(value!),),
//                 ),
//                 SizedBox(
//                   height: 70.h,
//                 ),
//                  SizedBox(
//                         height: 50,
//                         width: double.infinity,
//                         child: Center(
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                       BorderRadius.circular(12), // <-- Radius
//                                 ),
//                                 backgroundColor: Colors.black,
//
//                                 ///maximumSize:  Size.fromWidth(100.w),
//                                 minimumSize: Size.fromWidth(250.w)),
//
//                             ///check if the validation is successful
//                             onPressed: () async {
//                               if (formKey.currentState!.validate()) {
//                                 if (  widget.walletAction == WalletAction.withdrawal ) {
//
//                                   if(double.parse(amountController.text.toString()) <= double.parse(provider.acctBalance!.balance.toString())){
//                                     provider.withdraw(context, amountController.text);
//                                   } else {
//                                     showToast(msg: "Can't withdraw more than NGN ${UtilFunctions.formatAmount(double.parse(provider.acctBalance!.balance.toString()))}", isError: true);
//                                   }
//
//                                 } else {
//                                   provider.transfer(context, amountController.text);
//                                 }
//                               }
//                                   },
//                             child: const Text(
//                               'Submit',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
