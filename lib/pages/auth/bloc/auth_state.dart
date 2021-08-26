library auth_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  // fields go here

  String get error;

  bool get isLoading;

  bool get success;

  AuthState._();

  factory AuthState([updates(AuthStateBuilder b)]) = _$AuthState;

  factory AuthState.initail() {
    return AuthState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false);
  }
}
