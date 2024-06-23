class PostResponseModel {
  PostResponseModel({
      this.status, 
      this.message, 
      this.data,});

  PostResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;
PostResponseModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => PostResponseModel(  status: status ?? this.status,
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
      this.posts,});

  Data.fromJson(dynamic json) {
    if (json['posts'] != null) {
      posts = [];
      json['posts'].forEach((v) {
        posts?.add(Posts.fromJson(v));
      });
    }
  }
  List<Posts>? posts;
Data copyWith({  List<Posts>? posts,
}) => Data(  posts: posts ?? this.posts,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (posts != null) {
      map['posts'] = posts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Posts {
  Posts({
      this.id, 
      this.slug, 
      this.title, 
      this.description, 
      this.filePath, 
      this.userId, 
      this.categoryType, 
      this.createdAt, 
      this.updatedAt, 
      this.author,});

  Posts.fromJson(dynamic json) {
    id = json['id'];
    slug = json['slug'];
    title = json['title'];
    description = json['description'];
    filePath = json['file_path'];
    userId = json['user_id'];
    categoryType = json['category_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    author = json['author'];
  }
  num? id;
  String? slug;
  String? title;
  String? description;
  String? filePath;
  num? userId;
  String? categoryType;
  String? createdAt;
  String? updatedAt;
  String? author;
Posts copyWith({  num? id,
  String? slug,
  String? title,
  String? description,
  String? filePath,
  num? userId,
  String? categoryType,
  String? createdAt,
  String? updatedAt,
  String? author,
}) => Posts(  id: id ?? this.id,
  slug: slug ?? this.slug,
  title: title ?? this.title,
  description: description ?? this.description,
  filePath: filePath ?? this.filePath,
  userId: userId ?? this.userId,
  categoryType: categoryType ?? this.categoryType,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  author: author ?? this.author,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['slug'] = slug;
    map['title'] = title;
    map['description'] = description;
    map['file_path'] = filePath;
    map['user_id'] = userId;
    map['category_type'] = categoryType;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['author'] = author;
    return map;
  }

}