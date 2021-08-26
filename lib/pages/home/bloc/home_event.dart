library home_event;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class GetImages extends HomeEvent
    implements Built<GetImages, GetImagesBuilder> {
  // fields go here

  GetImages._();

  factory GetImages([updates(GetImagesBuilder b)]) = _$GetImages;
}

abstract class Logout extends HomeEvent
    implements Built<Logout, LogoutBuilder> {
  // fields go here

  Logout._();

  factory Logout([updates(LogoutBuilder b)]) = _$Logout;
}

abstract class GetNext extends HomeEvent
    implements Built<GetNext, GetNextBuilder> {
  // fields go here

  GetNext._();

  factory GetNext([updates(GetNextBuilder b)]) = _$GetNext;
}
