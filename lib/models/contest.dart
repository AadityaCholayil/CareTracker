import 'dart:convert';

import 'package:equatable/equatable.dart';

class Contest extends Equatable {
  final String contestId;
  final String contestName;
  final bool isLive;
  final int slots;
  final String time;
  final String timeUnit;
  final String winning;
  final int cost;
  final List<String> leaderboard;

  const Contest({
    this.contestId = '',
    this.contestName = '',
    this.isLive = false,
    this.slots = 0,
    this.time = '',
    this.timeUnit = '',
    this.winning = '',
    this.cost = 0,
    this.leaderboard = const [],
  });

  factory Contest.fromMap(Map<String, dynamic> data) => Contest(
        contestId: data['contestId'] as String,
        contestName: data['contestName'] as String,
        isLive: data['isLive'] as bool,
        slots: data['slots'] as int,
        time: data['time'] as String,
        timeUnit: data['timeUnit'] as String,
        winning: data['winning'] as String,
        cost: data['cost'] as int,
        leaderboard: data['leaderboard'] as List<String>,
      );

  Map<String, dynamic> toMap() => {
        'contestId': contestId,
        'contestName': contestName,
        'isLive': isLive,
        'slots': slots,
        'time': time,
        'timeUnit': timeUnit,
        'winning': winning,
        'cost': cost,
        'leaderboard': leaderboard,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Contest].
  factory Contest.fromJson(String data) {
    return Contest.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Contest] to a JSON string.
  String toJson() => json.encode(toMap());

  Contest copyWith({
    String? contestId,
    String? contestName,
    bool? isLive,
    int? slots,
    String? time,
    String? timeUnit,
    String? winning,
    int? cost,
    List<String>? leaderboard,
  }) {
    return Contest(
      contestId: contestId ?? this.contestId,
      contestName: contestName ?? this.contestName,
      isLive: isLive ?? this.isLive,
      slots: slots ?? this.slots,
      time: time ?? this.time,
      timeUnit: timeUnit ?? this.timeUnit,
      winning: winning ?? this.winning,
      cost: cost ?? this.cost,
      leaderboard: leaderboard ?? this.leaderboard,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      contestId,
      contestName,
      isLive,
      slots,
      time,
      timeUnit,
      winning,
      cost,
      leaderboard,
    ];
  }
}

var contestList = [
  {
    "contestId": "asdno124dnfqos",
    "contestName": "Daily Contest",
    "isLive": true,
    "slots": 20,
    "time": "10 mins",
    "winning": "100%",
    "cost": 5,
    "leaderboard": ["dasoidapsoicbcoa", "dabsudbassaidhas"]
  },
  {
    "contestId": "asdno124dnfqos",
    "contestName": "Regular Contest",
    "isLive": true,
    "slots": 10,
    "time": "10 mins",
    "winning": "100%",
    "cost": 2,
    "leaderboard": ["dasoidapsoicbcoa", "dabsudbassaidhas"]
  },
];
