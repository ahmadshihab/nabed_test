library app_event;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'app_event.g.dart';

abstract class AppEvent {}

abstract class LoginState extends AppEvent
    implements Built<LoginState, LoginStateBuilder> {
  LoginState._();

  factory LoginState([updates(LoginStateBuilder b)]) = _$LoginState;
}
