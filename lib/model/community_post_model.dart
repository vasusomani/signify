import 'comment_model.dart';

class CommunityPost {
  String? postId;
  UserDataPost? userData;
  PostData? postData;
  MetaDataPost? metaData;
  List<Comment>? comments;

  CommunityPost({
    this.postId,
    this.userData,
    this.postData,
    this.metaData,
    this.comments,
  });

  factory CommunityPost.fromJson(Map<String, dynamic> json) {
    return CommunityPost(
      postId: json['postId'],
      userData: json['userData'] != null
          ? UserDataPost.fromJson(json['userData'])
          : null,
      postData:
          json['postData'] != null ? PostData.fromJson(json['postData']) : null,
      metaData: json['metaData'] != null
          ? MetaDataPost.fromJson(json['metaData'])
          : null,
      comments: json['comments'] != null
          ? (json['comments'] as List)
              .map((comment) => Comment.fromJson(comment))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userData': userData!.toJson(),
      'postData': postData!.toJson(),
      'metaData': metaData!.toJson(),
      'comments': comments!.map((comment) => comment.toJson()).toList(),
    };
  }
}

class UserDataPost {
  String? userId;
  String? username;
  String? userPic;

  UserDataPost({
    this.userId,
    this.username,
    this.userPic,
  });

  factory UserDataPost.fromJson(Map<String, dynamic> json) {
    return UserDataPost(
      userId: json['userId'],
      username: json['username'],
      userPic: json['userPic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'userPic': userPic,
    };
  }
}

class PostData {
  String? title;
  String? description;
  String? image;

  PostData({
    this.title,
    this.description,
    this.image,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
    };
  }
}

class MetaDataPost {
  DateTime? createdTime;
  int? likeCount;
  int? commentCount;

  MetaDataPost({
    this.createdTime,
    this.likeCount,
    this.commentCount,
  });

  factory MetaDataPost.fromJson(Map<String, dynamic> json) {
    return MetaDataPost(
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime!.toIso8601String(),
      'likeCount': likeCount,
      'commentCount': commentCount,
    };
  }
}
