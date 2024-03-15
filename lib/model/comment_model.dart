class Comment {
  String? commentId;
  String? postId;
  String? comment;
  MetaDataComment? metaData;
  UserDataComment? userData;
  List<Comment>? replies;

  Comment({
    this.commentId,
    this.postId,
    this.comment,
    this.metaData,
    this.userData,
    this.replies,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'],
      postId: json['postId'],
      comment: json['comment'],
      metaData: json['metaData'] != null
          ? MetaDataComment.fromJson(json['metaData'])
          : null,
      userData: json['userData'] != null
          ? UserDataComment.fromJson(json['userData'])
          : null,
      replies: json['replies'] != null
          ? (json['replies'] as List)
              .map((reply) => Comment.fromJson(reply))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'postId': postId,
      'comment': comment,
      'metaData': metaData!.toJson(),
      'userData': userData!.toJson(),
      'replies': replies!.map((reply) => reply.toJson()).toList(),
    };
  }
}

class MetaDataComment {
  DateTime? createdTime;
  int? likeCount;
  int? replyCount;

  MetaDataComment({
    this.createdTime,
    this.likeCount,
    this.replyCount,
  });

  factory MetaDataComment.fromJson(Map<String, dynamic> json) {
    return MetaDataComment(
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
      likeCount: json['likeCount'],
      replyCount: json['replyCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime!.toIso8601String(),
      'likeCount': likeCount,
      'replyCount': replyCount,
    };
  }
}

class UserDataComment {
  String? username;
  String? userPic;

  UserDataComment({
    this.username,
    this.userPic,
  });

  factory UserDataComment.fromJson(Map<String, dynamic> json) {
    return UserDataComment(
      username: json['username'],
      userPic: json['userPic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'userPic': userPic,
    };
  }
}
