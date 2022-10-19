import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String phone;
  final String photoUrl;
  final int steps;
  final int walletBalance;
  final List<String> registeredContests;

  const UserData({
    this.uid = '',
    this.email = '',
    this.name = '',
    this.phone = '',
    this.photoUrl = '',
    this.steps = 0,
    this.walletBalance = 0,
    this.registeredContests = const [],
  });

  static UserData fromUser(User user) {
    return UserData(
      uid: user.uid,
      email: user.email ?? '',
    );
  }

  static const UserData empty = UserData(uid: '');

  const UserData.init() : this(uid: '');

  UserData.fromJson(Map<String, dynamic> json, String uid)
      : this(
          uid: uid,
          email: json['email'],
          name: json['name'],
          phone: json['phone'],
          photoUrl: json['photoUrl'],
          steps: json['steps'],
          walletBalance: json['walletBalance'],
          registeredContests:
              (json['registeredContests'] as List<dynamic>).cast<String>(),
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['photoUrl'] = photoUrl;
    data['steps'] = steps;
    data['walletBalance'] = walletBalance;
    data['registeredContests'] = registeredContests;
    return data;
  }

  UserData copyWith({
    String? uid,
    String? email,
    String? name,
    String? phone,
    String? photoUrl,
    int? steps,
    int? walletBalance,
    List<String>? registeredContests,
  }) {
    return UserData(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      photoUrl: photoUrl ?? this.photoUrl,
      steps: steps ?? this.steps,
      walletBalance: walletBalance ?? this.walletBalance,
      registeredContests: registeredContests ?? this.registeredContests,
    );
  }

  bool get isEmpty => this == UserData.empty;

  bool get isNotEmpty => this != UserData.empty;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        uid,
        email,
        name,
        phone,
        photoUrl,
        steps,
        walletBalance,
        registeredContests,
      ];
}
