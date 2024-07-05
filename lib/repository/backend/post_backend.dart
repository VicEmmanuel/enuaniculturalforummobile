import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:enuaniculturalforummobile/repository/services/api/api_service.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';

class PostsBackend extends ApiService {
  Future<dynamic> fetchListings({
    String? listingType,
    int? page = 1,
    String? minPrice,
    String? maxPrice,
    String? minBathrooms,
    String? maxBathrooms,
    String? maxBedrooms,
    String? minBedrooms,
    String? propertyType,
    String? city,
    String? state,
    String? address,
    String? title,
  }) async {
    return getMth(
      fetchListingsUri(
        page: page.toString(),
        listingType: listingType,
        minPrice: minPrice,
        minBathrooms: minBathrooms,
        maxBathrooms: maxBathrooms,
        maxBedrooms: maxBedrooms,
        minBedrooms: minBedrooms,
        propertyType: propertyType,
        city: city,
        address: address,
        state: state,
        title: title,
      ),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchSingleListing({required String id}) async {
    return getMth(
      fetchSingleListingUri(id: id),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchSingleListingWithCode({required String code}) async {
    return getMth(
      fetchSingleListingWithCodeUri(code: code),
      headers: apiHeaderWithToken,
      canShowToast: true,
    );
  }

  Future<dynamic> deleteListing({required String id}) async {
    return deleteMth(
      deleteListingUri(id: id),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchPersonalListing({
    int? page = 1,
  }) async {
    return getMth(
      fetchPersonalListingUri(page: page.toString()),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchNewsDb({
    int? page = 1,
  }) async {
    return getMth(
      fetchNewsDbUri(page: page.toString()),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> viewTenants() async {
    return getMth(
      viewTenantsUri,
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> viewTenantsByListingId({required String id}) async {
    return getMth(
      viewTenantsByListingIdUri(id: id),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> requestAccessToListing({required String listingId}) async {
    return postMth(
      requestAccessToListingUri,
      headers: apiHeaderWithToken,
      body: {'listingId': listingId},
    );
  }

  Future<dynamic> createNewListing(
      {
      // required File image,
      required List<File?>? images,
      required String title,
      required String address,
      required String city,
      required List<String> amenities,
      List<Map<String, dynamic>>? fees,
      // required String country,
      String? tags,
      required String listingType,
      required String propertySize,
      required String propertyType,
      required String description,
      required String? paymentPlan,
      required String state,
      required double price,
      required int totalUnits,
      required int availableUnits,
      required int parkInDuration,
      // required bool underXampContract,
      // required String propertyContractType,
      int? bedrooms,
      int? bathrooms}) async {
    List<MultipartFile>? fileItems = [];

    if (images != null) {
      for (File? file in images) {
        if (file != null) {
          String fileName = file.path.split('/').last;
          fileItems.add(await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ));
        }
      }
    }
    String jsonFees = jsonEncode(fees);
    return uploadMth(
      createNewListingUri,
      data: FormData.fromMap({
        'title': title,
        'address': address,
        'description': description,
        'city': city,
        'state': state,
        'country': 'Nigeria',
        'tags': ['Gym', 'Wi-Fi'],
        'listingType': listingType.isNotEmpty ? listingType : 'rent',
        'propertyType': propertyType,
        'propertySize': propertySize,
        'price': price,
        'totalUnits': totalUnits,
        'availableUnits': availableUnits,
        // availableUnits,
        "amenities[]": amenities,
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "paymentPlan": paymentPlan,
        // != 'one-time' ? paymentPlan:'one-time',
        "fee": jsonFees,
        'images': fileItems,
        'parkInDuration': parkInDuration,
        // 'underXampContract': underXampContract,
        // 'propertyContractType': propertyContractType
        // 'parkInDate': '2024-05-05'

        // 'images': await MultipartFile.fromFile(image.path, filename: "image.png"),
        // "agreedPercentage":null,
        // "durationOfManagement":null,
        // "propertyContractType":null,
        // "propertyCategory":null,
        // "propertySubcategory":null,
        // "rules":null,
        // "tenancyAgreement":null,
      }),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> updateListing(
      {
      // required List<File?>? images,
      required String title,
      required String address,
      required String city,
      required List<String> amenities,
      // List<Map<String, dynamic>>? fees,
      // required String country,
      // String? tags,
      // required String listingType,
      // required String propertySize,
      // required String propertyType,
      required String description,
      // required String? paymentPlan,
      required String state,
      required double price,
      // required int totalUnits,
      // required int availableUnits,
      // required int parkInDuration,
      // int? bedrooms,
      // int? bathrooms,
      required String id}) async {
    // List<MultipartFile>? fileItems = [];

    // if (images != null) {
    //   for (File? file in images) {
    //     if (file != null) {
    //       String fileName = file.path.split('/').last;
    //       fileItems.add(await MultipartFile.fromFile(
    //         file.path,
    //         filename: fileName,
    //       ));
    //     }
    //   }
    // }

    // String jsonFees = jsonEncode(fees);
    return putMth(updateListingUri(id: id), headers: apiHeaderWithToken, body: {
      'title': title,
      'address': address,
      'description': description,
      'city': city,
      'state': state,
      'country': 'Nigeria',
      'tags': ['Gym', 'Wi-Fi'],
      // 'listingType': listingType.isNotEmpty ? listingType : 'rent',
      // 'propertyType': propertyType,
      // 'propertySize': propertySize,
      'price': price,
      // 'totalUnits': totalUnits,
      // 'availableUnits': availableUnits,
      "amenities[]": amenities,
      // "bedrooms": bedrooms,
      // "bathrooms": bathrooms,
      // "paymentPlan": paymentPlan,
      // != 'one-time' ? paymentPlan:'one-time',
      // "fee": jsonFees,
      // 'images': fileItems,
      // 'parkInDuration': parkInDuration,
    });
  }

  Future<dynamic> fetchListingImage({required String uri}) async {
    return getMth(
      Uri.parse(uri),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchAllPosts() async {
    return getMth(
      fetchAllPostsUri,
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchAllCategories() async {
    return getMth(
      fetchAllCategoryUri,
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchNews() async {
    return getMth(
      fetchAllCategoryUri,
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> fetchPostByCategory({ required String slug}) async {
    return getMth(
      fetchPostByCategoryUri(slug: slug),
      headers: apiHeaderWithToken,
    );
  }

  Future<dynamic> createNewPost({
    required List<File?>? images,
    required String title,
    required String description,
    required String category_type,
    required String author,
    required String authToken,  // Pass the auth token here
  }) async {
    List<MultipartFile> fileItems = [];
    if (images != null) {
      for (File? file in images) {
        if (file != null) {
          String fileName = file.path.split('/').last;
          fileItems.add(await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ));
        }
      }
    }

    try {
      var formData = FormData.fromMap({
        'title': title,
        'description': description,
        'author': author,
        'category_type': category_type,
        'image': fileItems.isNotEmpty ? fileItems[0] : null, // Include the first image
      });

      var response = await Dio().post(
        'https://enuaniculturalforum.com/api/create-post',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      // Log the full response for debugging
      print("Response status: ${response.statusCode}");
      print("Response headers: ${response.headers}");
      print("Response body: ${response.data}");

      if (response.statusCode == 302) {
        print("Redirection detected. Location: ${response.headers['location']}");
      }

      final decodedResponse = response.data;
      return decodedResponse;
    } catch (e) {
      if (e is DioError) {
        print("DioError: ${e.response}");
        print("DioError Response data: ${e.response?.data}");
      } else {
        print("Error: $e");
      }
      rethrow;
    }
  }


  Future<dynamic> updatePost({
    required String title,
    required String description,
    required String category_type,
    required String author,
    required String authToken,
    required String slug, // Pass the auth token here
  }) async {
    try {
      logger.wtf('https://enuaniculturalforum.com/api/update-post/$slug');
      var jsonData = {
        'title': title,
        'description': description,
        'author': author,
        'category_type': category_type,
      };

      var response = await Dio().patch(
        'https://enuaniculturalforum.com/api/update-post/$slug',
        data: jsonData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json',
          },
        ),
      );

      // Log the full response for debugging
      print("Response status: ${response.statusCode}");
      print("Response headers: ${response.headers}");
      print("Response body: ${response.data}");

      if (response.statusCode == 302) {
        print("Redirection detected. Location: ${response.headers['location']}");
      }

      final decodedResponse = response.data;
      return decodedResponse;
    } catch (e) {
      if (e is DioError) {
        print("DioError: ${e.response}");
        print("DioError Response data: ${e.response?.data}");
      } else {
        print("Error: $e");
      }
      rethrow;
    }
  }


  // Future<dynamic> createNewPost({
  //   required List<File?>? images,
  //   required String title,
  //   required String description,
  //   required String category_type,
  //   required String author,
  // }) async {
  //   List<MultipartFile>? fileItems = [];
  //   if (images != null) {
  //     for (File? file in images) {
  //       if (file != null) {
  //         String fileName = file.path.split('/').last;
  //         fileItems.add(await MultipartFile.fromFile(
  //           file.path,
  //           filename: fileName,
  //         ));
  //       }
  //     }
  //   }
  //   return uploadMth(
  //     createNewPostUri,
  //     data: FormData.fromMap({
  //       'title': 'nh',
  //       "description": 'hjnkm',
  //       'author': 'jpojo',
  //       'category_type': 'iji',
  //       // 'image': fileItems[0],
  //       'image': 'ok'
  //     }),
  //     headers: apiHeaderWithFormData,
  //   );
  // }






}
