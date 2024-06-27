class NewsResponse {
  NewsResponse({
    this.status,
    this.message,
    this.data,
  });

  NewsResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
  }

  bool? status;
  String? message;
  DataModel? data;

  NewsResponse copyWith({
    bool? status,
    String? message,
    DataModel? data,
  }) =>
      NewsResponse(
        status: status ?? this.status,
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

class DataModel {
  DataModel({
    this.news,
  });

  DataModel.fromJson(dynamic json) {
    news = json['news'] != null ? News.fromJson(json['news']) : null;
  }

  News? news;

  DataModel copyWith({
    News? news,
  }) =>
      DataModel(
        news: news ?? this.news,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (news != null) {
      map['news'] = news?.toJson();
    }
    return map;
  }
}

class News {
  News({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  News.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(NewsData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
  }

  num? currentPage;
  List<NewsData>? data;
  String? firstPageUrl;
  num? from;
  String? nextPageUrl;
  String? path;
  num? perPage;
  dynamic prevPageUrl;
  num? to;

  News copyWith({
    num? currentPage,
    List<NewsData>? data,
    String? firstPageUrl,
    num? from,
    String? nextPageUrl,
    String? path,
    num? perPage,
    dynamic prevPageUrl,
    num? to,
  }) =>
      News(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    return map;
  }
}

class NewsData {
  NewsData({
    this.id,
    this.articleId,
    this.title,
    this.link,
    this.keywords,
    this.creator,
    this.description,
    this.content,
    this.pubDate,
    this.imageUrl,
    this.sourceId,
    this.sourceUrl,
    this.sourceIcon,
    this.language,
    this.country,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  NewsData.fromJson(dynamic json) {
    id = json['id'];
    articleId = json['article_id'];
    title = json['title'];
    link = json['link'];
    keywords = json['keywords'];
    creator = json['creator'];
    description = json['description'];
    content = json['content'];
    pubDate = json['pubDate'];
    imageUrl = json['image_url'];
    sourceId = json['source_id'];
    sourceUrl = json['source_url'];
    sourceIcon = json['source_icon'];
    language = json['language'];
    country = json['country'];
    category = json['category'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  num? id;
  String? articleId;
  String? title;
  String? link;
  String? keywords;
  String? creator;
  String? description;
  dynamic content;
  String? pubDate;
  String? imageUrl;
  String? sourceId;
  String? sourceUrl;
  String? sourceIcon;
  String? language;
  String? country;
  String? category;
  String? createdAt;
  String? updatedAt;

  NewsData copyWith({
    num? id,
    String? articleId,
    String? title,
    String? link,
    String? keywords,
    String? creator,
    String? description,
    dynamic content,
    String? pubDate,
    String? imageUrl,
    String? sourceId,
    String? sourceUrl,
    String? sourceIcon,
    String? language,
    String? country,
    String? category,
    String? createdAt,
    String? updatedAt,
  }) =>
      NewsData(
        id: id ?? this.id,
        articleId: articleId ?? this.articleId,
        title: title ?? this.title,
        link: link ?? this.link,
        keywords: keywords ?? this.keywords,
        creator: creator ?? this.creator,
        description: description ?? this.description,
        content: content ?? this.content,
        pubDate: pubDate ?? this.pubDate,
        imageUrl: imageUrl ?? this.imageUrl,
        sourceId: sourceId ?? this.sourceId,
        sourceUrl: sourceUrl ?? this.sourceUrl,
        sourceIcon: sourceIcon ?? this.sourceIcon,
        language: language ?? this.language,
        country: country ?? this.country,
        category: category ?? this.category,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['article_id'] = articleId;
    map['title'] = title;
    map['link'] = link;
    map['keywords'] = keywords;
    map['creator'] = creator;
    map['description'] = description;
    map['content'] = content;
    map['pubDate'] = pubDate;
    map['image_url'] = imageUrl;
    map['source_id'] = sourceId;
    map['source_url'] = sourceUrl;
    map['source_icon'] = sourceIcon;
    map['language'] = language;
    map['country'] = country;
    map['category'] = category;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
