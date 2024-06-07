// // ignore_for_file: depend_on_referenced_packages, implementation_imports
// import 'package:flutter/material.dart';
// import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
// import 'package:google_api_headers/google_api_headers.dart';
// import 'package:google_maps_webservice/src/places.dart';
// import 'package:http/http.dart';
// import 'package:enuaniculturalforummobile/repository/network/api_constants.dart';
// import 'package:enuaniculturalforummobile/src/utils.dart';
//
// class PlacesService extends ApiConstants {
//   Future<Prediction?> addressPicker(BuildContext context) async {
//     // ignore: omit_local_variable_types
//     return PlacesAutocomplete.show(
//       ///proxyBaseUrl: '$proxyUrl?key=$googlePlacesApiKey',
//       context: context,
//       apiKey: googlePlacesApiKey,
//       // mode: Mode.overlay,
//       // overlayBorderRadius: BorderRadius.circular(20),
//       // strictbounds: false,
//       // logo: Container(),
//       types: [],
//       language: 'en',
//
//       mode: Mode.overlay,
//       logo: const Text(""),
//       strictbounds: false,
//       components: [],
//
//       onError: (error) {
//         debugPrint(
//           error.toJson().toString(),
//         );
//       },
//       // components: [Component(Component.country, 'US')],
//       httpClient: Client(),
//     );
//   }
//
//   Future<PredictionResult?> getPredictionDetails(Prediction prediction) async {
//     final places = GoogleMapsPlaces(
//       apiKey: googlePlacesApiKey,
//    //   baseUrl: '$proxyUrl?key=$googlePlacesApiKey',
//       apiHeaders: await const GoogleApiHeaders().getHeaders(),
//     );
//
//     final response = await places.getDetailsByPlaceId(prediction.placeId!);
//
//     final city = response.result.addressComponents
//         .firstWhere((element) => element.types.contains('locality'))
//         .longName;
//     final street = response.result.addressComponents
//         .firstWhere((element) => element.types.contains('route'))
//         .longName;
//     final country = response.result.addressComponents
//         .firstWhere((element) => element.types.contains('country'))
//         .shortName;
//
//     final state = response.result.addressComponents
//         .firstWhere(
//           (element) => element.types.contains('administrative_area_level_1'),
//         )
//         .shortName;
//
//     final postalCode = response.result.addressComponents
//         .firstWhere(
//           (element) => element.types.contains('postal_code'),
//         )
//         .longName;
//
//     // postal_code
//     logger
//       ..d('country: $country')
//       ..d('street: $street')
//       ..d('city:  $city')
//       ..d('state: $state')
//       ..d('postal code $postalCode');
//
//     return PredictionResult(
//       country: country,
//       street: street,
//       city: city,
//       state: state,
//       postalCode: postalCode,
//     );
//   }
//
//
//
//
// }
//
// class PredictionResult {
//   PredictionResult({
//     this.country,
//     this.street,
//     this.city,
//     this.state,
//     this.postalCode,
//   });
//
//   final String? country;
//   final String? street;
//   final String? city;
//   final String? state;
//   final String? postalCode;
// }
