class StateResponseModel {
  StateResponseModel({
    this.code,
    this.name,
    this.isSelected = false,
    this.lgas,});

  StateResponseModel.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    lgas = json['lgas'] != null ? json['lgas'].cast<String>() : [];
  }
  String? code;
  String? name;
  bool? isSelected;
  List<String>? lgas;
  StateResponseModel copyWith({  String? code,
    String? name,
    List<String>? lgas,
  }) => StateResponseModel(  code: code ?? this.code,
    name: name ?? this.name,
    lgas: lgas ?? this.lgas,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['lgas'] = lgas;
    return map;
  }

}


