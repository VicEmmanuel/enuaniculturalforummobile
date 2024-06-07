class PropertyTypeResponse {
  PropertyTypeResponse({
    this.propertyDetails,
  });

  PropertyTypeResponse.fromJson(dynamic json) {
    if (json['propertyDetails'] != null) {
      propertyDetails = [];
      json['propertyDetails'].forEach((v) {
        propertyDetails?.add(PropertyDetails.fromJson(v));
      });
    }
  }
  List<PropertyDetails>? propertyDetails;
  PropertyTypeResponse copyWith({
    List<PropertyDetails>? propertyDetails,
  }) =>
      PropertyTypeResponse(
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

class PropertyDetails {
  PropertyDetails({
    this.id,
    this.logo,
    this.key,
    this.isSelected,
    this.subText,
  });

  PropertyDetails.fromJson(dynamic json) {
    id = json['id'];
    logo = json['logo'];
    key = json['key'];
    subText = json['subText'];
  }
  String? id;
  String? logo;
  String? key;
  String? subText;
  bool? isSelected;
  PropertyDetails copyWith({
    String? id,
    String? logo,
    String? key,
    String? subText,
  }) =>
      PropertyDetails(
        id: id ?? this.id,
        logo: logo ?? this.logo,
        key: key ?? this.key,
        subText: subText ?? this.subText,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo'] = logo;
    map['key'] = key;
    map['subText'] = subText;
    return map;
  }
}
