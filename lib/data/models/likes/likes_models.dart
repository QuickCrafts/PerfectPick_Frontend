class SpecificLikeModel {
  String userToken;
  int id;
  String mediaID;
  String mediaType;

  SpecificLikeModel({
    required this.userToken,
    required this.id,
    required this.mediaID,
    required this.mediaType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userToken'] = userToken;
    data['id'] = id;
    data['mediaID'] = mediaID;
    data['mediaType'] = mediaType;
    return data;
  }
}

class SpecificLikeResponseModel {
  String mediaId;
  int userId;
  String type;
  String likeType;

  SpecificLikeResponseModel({
    required this.mediaId,
    required this.userId,
    required this.type,
    required this.likeType,
  });

  SpecificLikeResponseModel.fromJson(Map<String, dynamic> json)
      : mediaId = json['specificLike']['media_id'],
        userId = json['specificLike']['user_id'],
        type = json['specificLike']['type'],
        likeType = json['specificLike']['like_type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['specificLike'] = {
      'media_id': mediaId,
      'user_id': userId,
      'type': type,
      'like_type': likeType,
    };
    return data;
  }

  bool validate() {
    return mediaId.isNotEmpty &&
        userId != null &&
        type.isNotEmpty &&
        likeType.isNotEmpty;
  }
}

class WishlistByUserIDModel {
  String token;
  int id;

  WishlistByUserIDModel({
    required this.token,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    return data;
  }
}

class WishlistByUserIDResponseModel {
  List<Like> wishlist;

  WishlistByUserIDResponseModel({required this.wishlist});

  WishlistByUserIDResponseModel.fromJson(Map<String, dynamic> json)
      : wishlist = (json['wishlistByUserId'] as List)
            .map((item) => Like.fromJson(item))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wishlistByUserId'] = wishlist.map((like) => like.toJson()).toList();
    return data;
  }

  bool validate() {
    return wishlist.isNotEmpty;
  }
}

class Like {
  String mediaId;
  int userId;
  String type;
  String likeType;

  Like({
    required this.mediaId,
    required this.userId,
    required this.type,
    required this.likeType,
  });

  Like.fromJson(Map<String, dynamic> json)
      : mediaId = json['media_id'],
        userId = json['user_id'],
        type = json['type'],
        likeType = json['like_type'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['media_id'] = mediaId;
    data['user_id'] = userId;
    data['type'] = type;
    data['like_type'] = likeType;
    return data;
  }
}
