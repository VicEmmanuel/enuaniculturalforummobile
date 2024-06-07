class DurationTypeResponse {
  DurationTypeResponse({
      this.durationType,});

  DurationTypeResponse.fromJson(dynamic json) {
    if (json['DurationType'] != null) {
      durationType = [];
      json['DurationType'].forEach((v) {
        durationType?.add(DurationType.fromJson(v));
      });
    }
  }
  List<DurationType>? durationType;
DurationTypeResponse copyWith({  List<DurationType>? durationType,
}) => DurationTypeResponse(  durationType: durationType ?? this.durationType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (durationType != null) {
      map['DurationType'] = durationType?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DurationType {
  DurationType({
      this.name, 
      this.key,});

  DurationType.fromJson(dynamic json) {
    name = json['name'];
    key = json['key'];
  }
  String? name;
  String? key;
DurationType copyWith({  String? name,
  String? key,
}) => DurationType(  name: name ?? this.name,
  key: key ?? this.key,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['key'] = key;
    return map;
  }

}