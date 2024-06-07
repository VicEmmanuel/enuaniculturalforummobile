/// status : true
/// message : "Listing fetched successfully"
/// data : {"total":2,"listings":[{"listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","listingCode":9131591,"userId":"94dbe9ec-654f-4683-8985-812e7406fb38","title":"Cody's Place","address":"Cosmic road opp Slot plaza","city":"Asaba","state":"Delta","country":"Nigeria","tags":["Gym","Wi-Fi"],"listingType":"rent","propertyType":"flat","underXampContract":false,"agreedPercentage":null,"durationOfManagement":null,"propertyContractType":null,"propertySize":"null","propertyCategory":null,"propertySubcategory":null,"price":650000,"paymentPlan":"one-time","totalUnits":6,"availableUnits":6,"buildingsOnLand":null,"bedrooms":6,"bathrooms":6,"description":"Nice","amenities":["Water supply","Security","Power supply"],"rules":null,"images":["https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089746/xamp-production/listing-images/file_wwub8f.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089747/xamp-production/listing-images/file_vm77yk.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089747/xamp-production/listing-images/file_wirb1k.jpg"],"tenancyAgreement":null,"parkInDuration":6,"isVerified":false,"isApproved":true,"isFrozen":false,"createdAt":"2024-03-10T16:55:48.191Z","deletedAt":null,"Fees":[]},{"listingId":"fbbebda5-2191-4d88-a451-e31bdbc3fb65","listingCode":5536176,"userId":"94dbe9ec-654f-4683-8985-812e7406fb38","title":"Hhvh","address":"bhb","city":"bhjj","state":"Bayelsa","country":"Nigeria","tags":["Gym","Wi-Fi"],"listingType":"rent","propertyType":"flat","underXampContract":false,"agreedPercentage":null,"durationOfManagement":null,"propertyContractType":null,"propertySize":"null","propertyCategory":null,"propertySubcategory":null,"price":500000,"paymentPlan":"one-time","totalUnits":0,"availableUnits":0,"buildingsOnLand":null,"bedrooms":0,"bathrooms":0,"description":"bhbhb","amenities":null,"rules":null,"images":["https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089809/xamp-production/listing-images/file_yfxvav.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089810/xamp-production/listing-images/file_rrgm6c.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089811/xamp-production/listing-images/file_zrlczv.jpg"],"tenancyAgreement":null,"parkInDuration":50,"isVerified":false,"isApproved":true,"isFrozen":false,"createdAt":"2024-03-10T16:56:52.131Z","deletedAt":null,"Fees":[]}],"page":1,"lastPage":1}

class PersonalListingsResponse {
  PersonalListingsResponse({
      this.status, 
      this.message, 
      this.data,});

  PersonalListingsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  PData? data;
PersonalListingsResponse copyWith({  bool? status,
  String? message,
  PData? data,
}) => PersonalListingsResponse(  status: status ?? this.status,
  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// total : 2
/// listings : [{"listingId":"3044b44c-d424-401d-8465-60ef10a60fd2","listingCode":9131591,"userId":"94dbe9ec-654f-4683-8985-812e7406fb38","title":"Cody's Place","address":"Cosmic road opp Slot plaza","city":"Asaba","state":"Delta","country":"Nigeria","tags":["Gym","Wi-Fi"],"listingType":"rent","propertyType":"flat","underXampContract":false,"agreedPercentage":null,"durationOfManagement":null,"propertyContractType":null,"propertySize":"null","propertyCategory":null,"propertySubcategory":null,"price":650000,"paymentPlan":"one-time","totalUnits":6,"availableUnits":6,"buildingsOnLand":null,"bedrooms":6,"bathrooms":6,"description":"Nice","amenities":["Water supply","Security","Power supply"],"rules":null,"images":["https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089746/xamp-production/listing-images/file_wwub8f.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089747/xamp-production/listing-images/file_vm77yk.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089747/xamp-production/listing-images/file_wirb1k.jpg"],"tenancyAgreement":null,"parkInDuration":6,"isVerified":false,"isApproved":true,"isFrozen":false,"createdAt":"2024-03-10T16:55:48.191Z","deletedAt":null,"Fees":[]},{"listingId":"fbbebda5-2191-4d88-a451-e31bdbc3fb65","listingCode":5536176,"userId":"94dbe9ec-654f-4683-8985-812e7406fb38","title":"Hhvh","address":"bhb","city":"bhjj","state":"Bayelsa","country":"Nigeria","tags":["Gym","Wi-Fi"],"listingType":"rent","propertyType":"flat","underXampContract":false,"agreedPercentage":null,"durationOfManagement":null,"propertyContractType":null,"propertySize":"null","propertyCategory":null,"propertySubcategory":null,"price":500000,"paymentPlan":"one-time","totalUnits":0,"availableUnits":0,"buildingsOnLand":null,"bedrooms":0,"bathrooms":0,"description":"bhbhb","amenities":null,"rules":null,"images":["https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089809/xamp-production/listing-images/file_yfxvav.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089810/xamp-production/listing-images/file_rrgm6c.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089811/xamp-production/listing-images/file_zrlczv.jpg"],"tenancyAgreement":null,"parkInDuration":50,"isVerified":false,"isApproved":true,"isFrozen":false,"createdAt":"2024-03-10T16:56:52.131Z","deletedAt":null,"Fees":[]}]
/// page : 1
/// lastPage : 1

class PData {
  PData({
      this.total, 
      this.listings, 
      this.page, 
      this.lastPage,});

  PData.fromJson(dynamic json) {
    total = json['total'];
    if (json['listings'] != null) {
      listings = [];
      json['listings'].forEach((v) {
        listings?.add(PListingsData.fromJson(v));
      });
    }
    page = json['page'];
    lastPage = json['lastPage'];
  }
  num? total;
  List<PListingsData>? listings;
  num? page;
  num? lastPage;
PData copyWith({  num? total,
  List<PListingsData>? listings,
  num? page,
  num? lastPage,
}) => PData(  total: total ?? this.total,
  listings: listings ?? this.listings,
  page: page ?? this.page,
  lastPage: lastPage ?? this.lastPage,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    if (listings != null) {
      map['listings'] = listings?.map((v) => v.toJson()).toList();
    }
    map['page'] = page;
    map['lastPage'] = lastPage;
    return map;
  }

}

/// listingId : "3044b44c-d424-401d-8465-60ef10a60fd2"
/// listingCode : 9131591
/// userId : "94dbe9ec-654f-4683-8985-812e7406fb38"
/// title : "Cody's Place"
/// address : "Cosmic road opp Slot plaza"
/// city : "Asaba"
/// state : "Delta"
/// country : "Nigeria"
/// tags : ["Gym","Wi-Fi"]
/// listingType : "rent"
/// propertyType : "flat"
/// underXampContract : false
/// agreedPercentage : null
/// durationOfManagement : null
/// propertyContractType : null
/// propertySize : "null"
/// propertyCategory : null
/// propertySubcategory : null
/// price : 650000
/// paymentPlan : "one-time"
/// totalUnits : 6
/// availableUnits : 6
/// buildingsOnLand : null
/// bedrooms : 6
/// bathrooms : 6
/// description : "Nice"
/// amenities : ["Water supply","Security","Power supply"]
/// rules : null
/// images : ["https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089746/xamp-production/listing-images/file_wwub8f.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089747/xamp-production/listing-images/file_vm77yk.jpg","https://res.cloudinary.com/dfei5jk9p/image/upload/v1710089747/xamp-production/listing-images/file_wirb1k.jpg"]
/// tenancyAgreement : null
/// parkInDuration : 6
/// isVerified : false
/// isApproved : true
/// isFrozen : false
/// createdAt : "2024-03-10T16:55:48.191Z"
/// deletedAt : null
/// Fees : []

class PListingsData {
  PListingsData({
      this.listingId, 
      this.listingCode, 
      this.userId, 
      this.title, 
      this.address, 
      this.city, 
      this.state, 
      this.country, 
      this.tags, 
      this.listingType, 
      this.propertyType, 
      this.underXampContract, 
      this.agreedPercentage, 
      this.durationOfManagement, 
      this.propertyContractType, 
      this.propertySize, 
      this.propertyCategory, 
      this.propertySubcategory, 
      this.price, 
      this.paymentPlan, 
      this.totalUnits, 
      this.availableUnits, 
      this.buildingsOnLand, 
      this.bedrooms, 
      this.bathrooms, 
      this.description, 
      this.amenities, 
      this.rules, 
      this.images, 
      this.tenancyAgreement, 
      this.parkInDuration, 
      this.isVerified, 
      this.isApproved, 
      this.isFrozen, 
      this.createdAt, 
      this.deletedAt, 
      this.fees,
      this.renewalDate
  });

  PListingsData.fromJson(dynamic json) {
    listingId = json['listingId'];
    listingCode = json['listingCode'];
    userId = json['userId'];
    title = json['title'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    listingType = json['listingType'];
    propertyType = json['propertyType'];
    underXampContract = json['underXampContract'];
    agreedPercentage = json['agreedPercentage'];
    durationOfManagement = json['durationOfManagement'];
    propertyContractType = json['propertyContractType'];
    propertySize = json['propertySize'];
    propertyCategory = json['propertyCategory'];
    propertySubcategory = json['propertySubcategory'];
    price = json['price'];
    paymentPlan = json['paymentPlan'];
    totalUnits = json['totalUnits'];
    availableUnits = json['availableUnits'];
    buildingsOnLand = json['buildingsOnLand'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    description = json['description'];
    amenities = json['amenities'] != null ? json['amenities'].cast<String>() : [];
    rules = json['rules'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    tenancyAgreement = json['tenancyAgreement'];
    parkInDuration = json['parkInDuration'];
    isVerified = json['isVerified'];
    isApproved = json['isApproved'];
    isFrozen = json['isFrozen'];
    createdAt = json['createdAt'];
    deletedAt = json['deletedAt'];
    if (json['Fees'] != null) {
      fees = [];
      // json['Fees'].forEach((v) {
      //   fees?.add(Dynamic.fromJson(v));
      // });
    }
    renewalDate = json['renewalDate'];
  }
  String? listingId;
  num? listingCode;
  String? userId;
  String? title;
  String? address;
  String? city;
  String? state;
  String? country;
  List<String>? tags;
  String? listingType;
  String? propertyType;
  bool? underXampContract;
  dynamic agreedPercentage;
  dynamic durationOfManagement;
  dynamic propertyContractType;
  String? propertySize;
  dynamic propertyCategory;
  dynamic propertySubcategory;
  num? price;
  String? paymentPlan;
  num? totalUnits;
  num? availableUnits;
  dynamic buildingsOnLand;
  num? bedrooms;
  num? bathrooms;
  String? description;
  List<String>? amenities;
  dynamic rules;
  List<String>? images;
  dynamic tenancyAgreement;
  num? parkInDuration;
  bool? isVerified;
  bool? isApproved;
  bool? isFrozen;
  String? createdAt;
  dynamic deletedAt;
  List<dynamic>? fees;
  String? renewalDate;
PListingsData copyWith({  String? listingId,
  num? listingCode,
  String? userId,
  String? title,
  String? address,
  String? city,
  String? state,
  String? country,
  List<String>? tags,
  String? listingType,
  String? propertyType,
  bool? underXampContract,
  dynamic agreedPercentage,
  dynamic durationOfManagement,
  dynamic propertyContractType,
  String? propertySize,
  dynamic propertyCategory,
  dynamic propertySubcategory,
  num? price,
  String? paymentPlan,
  num? totalUnits,
  num? availableUnits,
  dynamic buildingsOnLand,
  num? bedrooms,
  num? bathrooms,
  String? description,
  List<String>? amenities,
  dynamic rules,
  List<String>? images,
  dynamic tenancyAgreement,
  num? parkInDuration,
  bool? isVerified,
  bool? isApproved,
  bool? isFrozen,
  String? createdAt,
  dynamic deletedAt,
  List<dynamic>? fees,
  String? renewalDate,
}) => PListingsData(  listingId: listingId ?? this.listingId,
  listingCode: listingCode ?? this.listingCode,
  userId: userId ?? this.userId,
  title: title ?? this.title,
  address: address ?? this.address,
  city: city ?? this.city,
  state: state ?? this.state,
  country: country ?? this.country,
  tags: tags ?? this.tags,
  listingType: listingType ?? this.listingType,
  propertyType: propertyType ?? this.propertyType,
  underXampContract: underXampContract ?? this.underXampContract,
  agreedPercentage: agreedPercentage ?? this.agreedPercentage,
  durationOfManagement: durationOfManagement ?? this.durationOfManagement,
  propertyContractType: propertyContractType ?? this.propertyContractType,
  propertySize: propertySize ?? this.propertySize,
  propertyCategory: propertyCategory ?? this.propertyCategory,
  propertySubcategory: propertySubcategory ?? this.propertySubcategory,
  price: price ?? this.price,
  paymentPlan: paymentPlan ?? this.paymentPlan,
  totalUnits: totalUnits ?? this.totalUnits,
  availableUnits: availableUnits ?? this.availableUnits,
  buildingsOnLand: buildingsOnLand ?? this.buildingsOnLand,
  bedrooms: bedrooms ?? this.bedrooms,
  bathrooms: bathrooms ?? this.bathrooms,
  description: description ?? this.description,
  amenities: amenities ?? this.amenities,
  rules: rules ?? this.rules,
  images: images ?? this.images,
  tenancyAgreement: tenancyAgreement ?? this.tenancyAgreement,
  parkInDuration: parkInDuration ?? this.parkInDuration,
  isVerified: isVerified ?? this.isVerified,
  isApproved: isApproved ?? this.isApproved,
  isFrozen: isFrozen ?? this.isFrozen,
  createdAt: createdAt ?? this.createdAt,
  deletedAt: deletedAt ?? this.deletedAt,
  fees: fees ?? this.fees,
  renewalDate: renewalDate ?? this.renewalDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['listingId'] = listingId;
    map['listingCode'] = listingCode;
    map['userId'] = userId;
    map['title'] = title;
    map['address'] = address;
    map['city'] = city;
    map['state'] = state;
    map['country'] = country;
    map['tags'] = tags;
    map['listingType'] = listingType;
    map['propertyType'] = propertyType;
    map['underXampContract'] = underXampContract;
    map['agreedPercentage'] = agreedPercentage;
    map['durationOfManagement'] = durationOfManagement;
    map['propertyContractType'] = propertyContractType;
    map['propertySize'] = propertySize;
    map['propertyCategory'] = propertyCategory;
    map['propertySubcategory'] = propertySubcategory;
    map['price'] = price;
    map['paymentPlan'] = paymentPlan;
    map['totalUnits'] = totalUnits;
    map['availableUnits'] = availableUnits;
    map['buildingsOnLand'] = buildingsOnLand;
    map['bedrooms'] = bedrooms;
    map['bathrooms'] = bathrooms;
    map['description'] = description;
    map['amenities'] = amenities;
    map['rules'] = rules;
    map['images'] = images;
    map['tenancyAgreement'] = tenancyAgreement;
    map['parkInDuration'] = parkInDuration;
    map['isVerified'] = isVerified;
    map['isApproved'] = isApproved;
    map['isFrozen'] = isFrozen;
    map['createdAt'] = createdAt;
    map['deletedAt'] = deletedAt;
    if (fees != null) {
      map['Fees'] = fees?.map((v) => v.toJson()).toList();
    }
    map['renewalDate'] = renewalDate;
    return map;
  }

}