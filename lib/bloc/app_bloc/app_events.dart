import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent([List props = const []]) : super();
}

class AppStarted extends AppEvent {
  @override
  String toString() => 'AppStarted';

  @override
  List<Object?> get props => [toString()];
}

class LoginUser extends AppEvent {
  final String email;
  final String password;

  const LoginUser({required this.email, required this.password});

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [email, password];
}

class SignupUser extends AppEvent {
  final String email;
  final String password;
  final String name;
  final String phone;
  final File? image;

  const SignupUser({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.image,
  });

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [email, password, name, phone, image];
}

class LogoutUser extends AppEvent {
  @override
  String toString() => 'LogoutUser';

  @override
  List<Object?> get props => [toString()];
}
