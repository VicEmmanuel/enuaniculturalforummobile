class ListingTypeResponse {
  ListingTypeResponse({
      this.listingType,});

  ListingTypeResponse.fromJson(dynamic json) {
    if (json['ListingType'] != null) {
      listingType = [];
      json['ListingType'].forEach((v) {
        listingType?.add(ListingType.fromJson(v));
      });
    }
  }
  List<ListingType>? listingType;
ListingTypeResponse copyWith({  List<ListingType>? listingType,
}) => ListingTypeResponse(  listingType: listingType ?? this.listingType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (listingType != null) {
      map['ListingType'] = listingType?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ListingType {
  ListingType({
      this.name, 
      this.id,});

  ListingType.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
  }
  String? name;
  String? id;
ListingType copyWith({  String? name,
  String? id,
}) => ListingType(  name: name ?? this.name,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    return map;
  }

}