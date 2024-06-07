class PropertyTypeResponseLandlord {
  PropertyTypeResponseLandlord({
    this.propertyDetails,
  });

  PropertyTypeResponseLandlord.fromJson(dynamic json) {
    if (json['propertyDetails'] != null) {
      propertyDetails = [];
      json['propertyDetails'].forEach((v) {
        propertyDetails?.add(LandlordPropertyDetails.fromJson(v));
      });
    }
  }
  List<LandlordPropertyDetails>? propertyDetails;
  PropertyTypeResponseLandlord copyWith({
    List<LandlordPropertyDetails>? propertyDetails,
  }) =>
      PropertyTypeResponseLandlord(
        propertyDetails: propertyDetails ?? this.propertyDetails,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (propertyDetails != null) {
      map['propertyDetails'] = propertyDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class LandlordPropertyDetails {
  LandlordPropertyDetails({
    this.name,
    this.id,
    this.isSelected,
    this.logo,
  });

  LandlordPropertyDetails.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    logo = json['logo'];
  }
  String? name;
  String? id;
  String? logo;
  bool? isSelected;
  LandlordPropertyDetails copyWith({
    String? name,
    String? id,
    String? logo,
  }) =>
      LandlordPropertyDetails(
        name: name ?? this.name,
        id: id ?? this.id,
        logo: logo ?? this.logo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['logo'] = logo;
    return map;
  }
}
