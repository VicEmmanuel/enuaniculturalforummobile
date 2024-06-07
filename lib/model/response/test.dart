class Test {
  Test({
      this.status, 
      this.message, 
      this.data,});

  Test.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;
Test copyWith({  bool? status,
  String? message,
  Data? data,
}) => Test(  status: status ?? this.status,
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

class Data {
  Data({
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
      this.user, 
      this.rentingStatus,});

  Data.fromJson(dynamic json) {
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
      json['Fees'].forEach((v) {
        fees?.add(Fees.fromJson(v));
      });
    }
    user = json['User'] != null ? User.fromJson(json['User']) : null;
    rentingStatus = json['rentingStatus'];
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
  List<Fees>? fees;
  User? user;
  num? rentingStatus;
Data copyWith({  String? listingId,
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
  List<Fees>? fees,
  User? user,
  num? rentingStatus,
}) => Data(  listingId: listingId ?? this.listingId,
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
  user: user ?? this.user,
  rentingStatus: rentingStatus ?? this.rentingStatus,
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
    if (user != null) {
      map['User'] = user?.toJson();
    }
    map['rentingStatus'] = rentingStatus;
    return map;
  }

}

class User {
  User({
      this.userId, 
      this.firstName, 
      this.lastName, 
      this.phoneNumber, 
      this.profileImage, 
      this.xampId, 
      this.email,});

  User.fromJson(dynamic json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    profileImage = json['profileImage'];
    xampId = json['xampId'];
    email = json['email'];
  }
  String? userId;
  String? firstName;
  String? lastName;
  dynamic phoneNumber;
  String? profileImage;
  String? xampId;
  String? email;
User copyWith({  String? userId,
  String? firstName,
  String? lastName,
  dynamic phoneNumber,
  String? profileImage,
  String? xampId,
  String? email,
}) => User(  userId: userId ?? this.userId,
  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  phoneNumber: phoneNumber ?? this.phoneNumber,
  profileImage: profileImage ?? this.profileImage,
  xampId: xampId ?? this.xampId,
  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['phoneNumber'] = phoneNumber;
    map['profileImage'] = profileImage;
    map['xampId'] = xampId;
    map['email'] = email;
    return map;
  }

}

class Fees {
  Fees({
      this.feeId, 
      this.listingId, 
      this.feeType, 
      this.amount,});

  Fees.fromJson(dynamic json) {
    feeId = json['feeId'];
    listingId = json['listingId'];
    feeType = json['feeType'];
    amount = json['amount'];
  }
  String? feeId;
  String? listingId;
  String? feeType;
  num? amount;
Fees copyWith({  String? feeId,
  String? listingId,
  String? feeType,
  num? amount,
}) => Fees(  feeId: feeId ?? this.feeId,
  listingId: listingId ?? this.listingId,
  feeType: feeType ?? this.feeType,
  amount: amount ?? this.amount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['feeId'] = feeId;
    map['listingId'] = listingId;
    map['feeType'] = feeType;
    map['amount'] = amount;
    return map;
  }

}