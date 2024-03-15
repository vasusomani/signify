class VideoCall {
  String? callId;
  UserDataCall? callerUser;
  UserDataCall? receiverUser;
  MetaDataCall? metaData;

  VideoCall({
    this.callId,
    this.callerUser,
    this.receiverUser,
    this.metaData,
  });

  factory VideoCall.fromJson(Map<String, dynamic> json) {
    return VideoCall(
      callId: json['callId'],
      callerUser: json['callerUser'] != null
          ? UserDataCall.fromJson(json['callerUser'])
          : null,
      receiverUser: json['receiverUser'] != null
          ? UserDataCall.fromJson(json['receiverUser'])
          : null,
      metaData: json['metaData'] != null
          ? MetaDataCall.fromJson(json['metaData'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'callId': callId,
      'callerUser': callerUser!.toJson(),
      'receiverUser': receiverUser!.toJson(),
      'metaData': metaData!.toJson(),
    };
  }
}

class MetaDataCall {
  DateTime? createdTime;
  int? callDuration;

  MetaDataCall({
    this.createdTime,
    this.callDuration,
  });

  factory MetaDataCall.fromJson(Map<String, dynamic> json) {
    return MetaDataCall(
      createdTime: json['createdTime'] != null
          ? DateTime.parse(json['createdTime'])
          : null,
      callDuration: json['callDuration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'createdTime': createdTime!.toIso8601String(),
      'callDuration': callDuration,
    };
  }
}

class UserDataCall {
  String? userId;
  String? username;

  UserDataCall({
    this.userId,
    this.username,
  });

  factory UserDataCall.fromJson(Map<String, dynamic> json) {
    return UserDataCall(
      userId: json['userId'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
    };
  }
}
