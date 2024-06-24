class CategoryResponse {
  CategoryResponse({
      this.status, 
      this.message, 
      this.data,});

  CategoryResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CategoryData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  CategoryData? data;
CategoryResponse copyWith({  bool? status,
  String? message,
  CategoryData? data,
}) => CategoryResponse(  status: status ?? this.status,
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

class CategoryData {
  CategoryData({
      this.categories,});

  CategoryData.fromJson(dynamic json) {
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
  }
  List<String>? categories;
  CategoryData copyWith({  List<String>? categories,
}) => CategoryData(  categories: categories ?? this.categories,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categories'] = categories;
    return map;
  }

}