library auth_event;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_event.g.dart';

abstract class AuthEvent {}

abstract class Login extends AuthEvent implements Built<Login, LoginBuilder> {
  // fields go here

  String get email;
  String get password;

  Login._();

  factory Login([updates(LoginBuilder b)]) = _$Login;
}

abstract class Register extends AuthEvent
    implements Built<Register, RegisterBuilder> {
  // fields go here

  String get email;
  String get password;

  Register._();

  factory Register([updates(RegisterBuilder b)]) = _$Register;
}
