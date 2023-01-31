import 'package:flutter/foundation.dart';

enum PlayType { cricket, football, tableTennis }

abstract class PlayFactory {
  factory PlayFactory(PlayType playType) {
    switch (playType) {
      case PlayType.football:
        return FootBall();
      case PlayType.cricket:
        return Cricket();
      case PlayType.tableTennis:
        return TableTennis();
      default:
        throw Exception("No play type found");
    }
  }
  void playTime();
}

class Cricket implements PlayFactory {
  @override
  void playTime() {
    if (kDebugMode) {
      print('cricket start from 10 am');
    }
  }
}

class FootBall implements PlayFactory {
  @override
  void playTime() {
    if (kDebugMode) {
      print('football start from 11 am');
    }
  }
}

class TableTennis implements PlayFactory {
  @override
  void playTime() {
    if (kDebugMode) {
      print("tableTennis start from 12 pm");
    }
  }
}
