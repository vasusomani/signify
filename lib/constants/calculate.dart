import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calculate {
  String calculateTimeAgo(Duration difference) {
    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 31) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 365) {
      final int months = (difference.inDays / 30).floor();
      return '$months months ago';
    } else {
      final int years = (difference.inDays / 365).floor();
      return '$years years ago';
    }
  }

  String generatePassword() {
    const allowedChars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const passwordLength = 10;
    final random = Random();
    final password = List.generate(passwordLength, (index) {
      return allowedChars[random.nextInt(allowedChars.length)];
    }).join();
    return password;
  }

  String getAWSS3BaseImageUrl(String fullUrl) {
    RegExp regExp = RegExp(r'(^[^?]+)');
    Match? match = regExp.firstMatch(fullUrl);
    return match?.group(1) ?? '';
  }

  String getMessageTime(DateTime time) {
    final now = DateTime.now();
    if (time.day == now.day &&
        time.month == now.month &&
        time.year == now.year) {
      return 'Today';
    } else if (time.day == now.day - 1 &&
        time.month == now.month &&
        time.year == now.year) {
      return 'Yesterday';
    } else if (time.difference(now).inDays < 7 && time.weekday < now.weekday) {
      switch (time.weekday) {
        case 1:
          return 'Monday';
        case 2:
          return 'Tuesday';
        case 3:
          return 'Wednesday';
        case 4:
          return 'Thursday';
        case 5:
          return 'Friday';
        case 6:
          return 'Saturday';
        default:
          return '';
      }
    } else {
      return DateFormat('dd MMMM yyyy').format(time);
    }
  }
}
