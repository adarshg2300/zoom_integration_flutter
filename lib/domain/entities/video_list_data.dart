class VideoListData {
  VideoListData({
    required this.statusCode,
    required this.message,
    required this.result,
  });

  final int? statusCode;
  final String? message;
  final VideoListDataResult? result;

  VideoListData copyWith({
    int? statusCode,
    String? message,
    VideoListDataResult? result,
  }) {
    return VideoListData(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }

  factory VideoListData.fromJson(Map<String, dynamic> json){
    return VideoListData(
      statusCode: json["statusCode"],
      message: json["message"],
      result: json["result"] == null ? null : VideoListDataResult.fromJson(json["result"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "message": message,
    "result": result?.toJson(),
  };

  @override
  String toString(){
    return "$statusCode, $message, $result, ";
  }
}

class VideoListDataResult {
  VideoListDataResult({
    required this.listing,
    required this.sideMenuItems,
  });

  final List<Listing> listing;
  final List<SideMenuItem> sideMenuItems;

  VideoListDataResult copyWith({
    List<Listing>? listing,
    List<SideMenuItem>? sideMenuItems,
  }) {
    return VideoListDataResult(
      listing: listing ?? this.listing,
      sideMenuItems: sideMenuItems ?? this.sideMenuItems,
    );
  }

  factory VideoListDataResult.fromJson(Map<String, dynamic> json){
    return VideoListDataResult(
      listing: json["listing"] == null ? [] : List<Listing>.from(json["listing"]!.map((x) => Listing.fromJson(x))),
      sideMenuItems: json["sideMenuItems"] == null ? [] : List<SideMenuItem>.from(json["sideMenuItems"]!.map((x) => SideMenuItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "listing": listing.map((x) => x?.toJson()).toList(),
    "sideMenuItems": sideMenuItems.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$listing, $sideMenuItems, ";
  }
}

class Listing {
  Listing({
    required this.id,
    required this.name,
    required this.result,
  });

  final String? id;
  final String? name;
  final List<ResultElement> result;

  Listing copyWith({
    String? id,
    String? name,
    List<ResultElement>? result,
  }) {
    return Listing(
      id: id ?? this.id,
      name: name ?? this.name,
      result: result ?? this.result,
    );
  }

  factory Listing.fromJson(Map<String, dynamic> json){
    return Listing(
      id: json["_id"],
      name: json["name"],
      result: json["result"] == null ? [] : List<ResultElement>.from(json["result"]!.map((x) => ResultElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "result": result.map((x) => x?.toJson()).toList(),
  };

  @override
  String toString(){
    return "$id, $name, $result, ";
  }
}

class ResultElement {
  ResultElement({
    required this.id,
    required this.resultId,
    required this.title,
    required this.description,
    required this.year,
    required this.thumbnails,
    required this.banners,
    required this.categories,
    required this.genres,
    required this.contentType,
    required this.discretion,
    required this.imdb,
    required this.playList,
    required this.cardType,
  });

  final String? id;
  final String? resultId;
  final String? title;
  final String? description;
  final int? year;
  final List<Banner> thumbnails;
  final List<Banner> banners;
  final List<SideMenuItem> categories;
  final List<SideMenuItem> genres;
  final SideMenuItem? contentType;
  final String? discretion;
  final String? imdb;
  final PlayList? playList;
  final String? cardType;

  ResultElement copyWith({
    String? id,
    String? resultId,
    String? title,
    String? description,
    int? year,
    List<Banner>? thumbnails,
    List<Banner>? banners,
    List<SideMenuItem>? categories,
    List<SideMenuItem>? genres,
    SideMenuItem? contentType,
    String? discretion,
    String? imdb,
    PlayList? playList,
    String? cardType,
  }) {
    return ResultElement(
      id: id ?? this.id,
      resultId: resultId ?? this.resultId,
      title: title ?? this.title,
      description: description ?? this.description,
      year: year ?? this.year,
      thumbnails: thumbnails ?? this.thumbnails,
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      genres: genres ?? this.genres,
      contentType: contentType ?? this.contentType,
      discretion: discretion ?? this.discretion,
      imdb: imdb ?? this.imdb,
      playList: playList ?? this.playList,
      cardType: cardType ?? this.cardType,
    );
  }

  factory ResultElement.fromJson(Map<String, dynamic> json){
    return ResultElement(
      id: json["_id"],
      resultId: json["id"],
      title: json["title"],
      description: json["description"],
      year: json["year"],
      thumbnails: json["thumbnails"] == null ? [] : List<Banner>.from(json["thumbnails"]!.map((x) => Banner.fromJson(x))),
      banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
      categories: json["categories"] == null ? [] : List<SideMenuItem>.from(json["categories"]!.map((x) => SideMenuItem.fromJson(x))),
      genres: json["genres"] == null ? [] : List<SideMenuItem>.from(json["genres"]!.map((x) => SideMenuItem.fromJson(x))),
      contentType: json["contentType"] == null ? null : SideMenuItem.fromJson(json["contentType"]),
      discretion: json["discretion"],
      imdb: json["imdb"],
      playList: json["playList"] == null ? null : PlayList.fromJson(json["playList"]),
      cardType: json["cardType"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": resultId,
    "title": title,
    "description": description,
    "year": year,
    "thumbnails": thumbnails.map((x) => x?.toJson()).toList(),
    "banners": banners.map((x) => x?.toJson()).toList(),
    "categories": categories.map((x) => x?.toJson()).toList(),
    "genres": genres.map((x) => x?.toJson()).toList(),
    "contentType": contentType?.toJson(),
    "discretion": discretion,
    "imdb": imdb,
    "playList": playList?.toJson(),
    "cardType": cardType,
  };

  @override
  String toString(){
    return "$id, $resultId, $title, $description, $year, $thumbnails, $banners, $categories, $genres, $contentType, $discretion, $imdb, $playList, $cardType, ";
  }
}

class Banner {
  Banner({
    required this.platform,
    required this.path,
    required this.type,
    required this.aspectRatio,
  });

  final String? platform;
  final String? path;
  final String? type;
  final String? aspectRatio;

  Banner copyWith({
    String? platform,
    String? path,
    String? type,
    String? aspectRatio,
  }) {
    return Banner(
      platform: platform ?? this.platform,
      path: path ?? this.path,
      type: type ?? this.type,
      aspectRatio: aspectRatio ?? this.aspectRatio,
    );
  }

  factory Banner.fromJson(Map<String, dynamic> json){
    return Banner(
      platform: json["platform"],
      path: json["path"],
      type: json["type"],
      aspectRatio: json["aspectRatio"],
    );
  }

  Map<String, dynamic> toJson() => {
    "platform": platform,
    "path": path,
    "type": type,
    "aspectRatio": aspectRatio,
  };

  @override
  String toString(){
    return "$platform, $path, $type, $aspectRatio, ";
  }
}

class SideMenuItem {
  SideMenuItem({
    required this.name,
    required this.id,
  });

  final String? name;
  final String? id;

  SideMenuItem copyWith({
    String? name,
    String? id,
  }) {
    return SideMenuItem(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  factory SideMenuItem.fromJson(Map<String, dynamic> json){
    return SideMenuItem(
      name: json["name"],
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "_id": id,
  };

  @override
  String toString(){
    return "$name, $id, ";
  }
}

class PlayList {
  PlayList({
    required this.hls,
  });

  final Hls? hls;

  PlayList copyWith({
    Hls? hls,
  }) {
    return PlayList(
      hls: hls ?? this.hls,
    );
  }

  factory PlayList.fromJson(Map<String, dynamic> json){
    return PlayList(
      hls: json["hls"] == null ? null : Hls.fromJson(json["hls"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "hls": hls?.toJson(),
  };

  @override
  String toString(){
    return "$hls, ";
  }
}

class Hls {
  Hls({
    required this.type,
    required this.url,
  });

  final String? type;
  final String? url;

  Hls copyWith({
    String? type,
    String? url,
  }) {
    return Hls(
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  factory Hls.fromJson(Map<String, dynamic> json){
    return Hls(
      type: json["type"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "url": url,
  };

  @override
  String toString(){
    return "$type, $url, ";
  }
}
