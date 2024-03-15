class Chat {
  String? chatId;
  UserDataChat? senderUser;
  UserDataChat? receiverUser;
  String? message;
  MetaDataChat? metaData;

  Chat({
    this.chatId,
    this.senderUser,
    this.receiverUser,
    this.message,
    this.metaData,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatId: json['chatId'],
      senderUser: json['senderUser'] != null
          ? UserDataChat.fromJson(json['senderUser'])
          : null,
      receiverUser: json['receiverUser'] != null
          ? UserDataChat.fromJson(json['receiverUser'])
          : null,
      message: json['message'],
      metaData: json['metaData'] != null
          ? MetaDataChat.fromJson(json['metaData'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chatId': chatId,
      'senderUser': senderUser!.toJson(),
      'receiverUser': receiverUser!.toJson(),
      'message': message,
      'metaData': metaData!.toJson(),
    };
  }
}

class MetaDataChat {
  DateTime? createdTime;

  MetaDataChat({
    this.createdTime,
  });

  factory MetaDataChat.fromJson(Map<String, dynamic> json) {
    return MetaDataChat(
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime!.toIso8601String(),
    };
  }
}

class UserDataChat {
  String? username;
  String? userPic;

  UserDataChat({
    this.username,
    this.userPic,
  });

  factory UserDataChat.fromJson(Map<String, dynamic> json) {
    return UserDataChat(
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
