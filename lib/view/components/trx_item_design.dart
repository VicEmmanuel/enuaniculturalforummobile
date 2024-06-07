// import 'package:xamp/src/components.dart';
// import 'package:xamp/src/models.dart';
// import 'package:xamp/src/utils.dart';
//
// class TrxItemDesign extends StatelessWidget {
//   final TrxResponseModel trxResponseModel;
//
//   const TrxItemDesign({super.key, required this.trxResponseModel});
//
//   @override
//   Widget build(BuildContext context) {
//      return SizedBox( height: 70,
//       child: Card(surfaceTintColor: Colors.white,
//         child: ListTile(
//           //minLeadingWidth: 50,
//           leading: const Icon(Icons.wallet_giftcard, color: Colors.purple,),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextView(
//                   text: trxResponseModel.phoneNumber.toString(),
//                   maxLines: 1,
//                   textOverflow: TextOverflow.ellipsis,
//                   fontSize: 12.sp, fontWeight: FontWeight.w500
//               ),
//               TextView( text:  UtilFunctions.formatDate(trxResponseModel.created.toString()),
//                 fontSize: 12.sp,  fontWeight: FontWeight.w500, color: Colors.grey,
//               ),
//             ],
//           ),
//           trailing: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextView( text: 'NGN ${UtilFunctions.formatAmount(double.parse(trxResponseModel.amount != null ? trxResponseModel.amount.toString() : '0'))}',
//                   fontSize: 12.sp, fontWeight: FontWeight.bold
//               ),
//               TextView( text:  UtilFunctions.capitalizeAllWord(trxResponseModel.type.toString()),
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,  color:  getColour(
//                     trxResponseModel.type.toString().toLowerCase()),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   getColour(status) {
//     if (status.toString().toLowerCase() == "debit") {
//       return Colors.red;
//     } else {
//       return Colors.green;
//     }
//   }
// }
