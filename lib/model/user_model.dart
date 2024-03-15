import 'package:signify/model/community_post_model.dart';

import 'comment_model.dart';

class UserModel {
  String? userId;
  UserData? userData;
  String? password;
  List<CallLog>? callLogs;
  List<PostData>? communityPost;
  List<Comment>? replies;
  Map<String, dynamic>? chat;

  UserModel({
    this.userId,
    this.userData,
    this.password,
    this.callLogs,
    this.communityPost,
    this.replies,
    this.chat,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      userData:
          json['userData'] != null ? UserData.fromJson(json['userData']) : null,
      password: json['password'],
      callLogs: json['callLogs'] != null
          ? (json['callLogs'] as List)
              .map((log) => CallLog.fromJson(log))
              .toList()
          : null,
      communityPost: json['communityPost'] != null
          ? (json['communityPost'] as List)
              .map((post) => PostData.fromJson(post))
              .toList()
          : null,
      replies: json['replies'] != null
          ? (json['replies'] as List)
              .map((reply) => Comment.fromJson(reply))
              .toList()
          : null,
      chat: json['chat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userData': userData!.toJson(),
      'password': password,
      'callLogs': callLogs!.map((log) => log.toJson()).toList(),
      'communityPost': communityPost!.map((post) => post.toJson()).toList(),
      'replies': replies!.map((reply) => reply.toJson()).toList(),
      'chat': chat,
    };
  }
}

class UserData {
  String? username;
  String? name;
  String? profilePicture;
  String? email;
  int? age;
  String? gender;
  String? origin;
  String? description;

  UserData({
    this.username,
    this.name,
    this.profilePicture,
    this.email,
    this.age,
    this.gender,
    this.origin,
    this.description,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      username: json['username'],
      name: json['name'],
      profilePicture: json['profilePicture'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      origin: json['origin'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'name': name,
      'profilePicture': profilePicture,
      'email': email,
      'age': age,
      'gender': gender,
      'origin': origin,
      'description': description,
    };
  }
}

class CallLog {
  String? callerId;
  DateTime? time;

  CallLog({
    this.callerId,
    this.time,
  });

  factory CallLog.fromJson(Map<String, dynamic> json) {
    return CallLog(
      callerId: json['callerId'],
      time: json['time'] != null ? DateTime.parse(json['time']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'callerId': callerId,
      'time': time != null ? time!.toIso8601String() : null,
    };
  }
}
