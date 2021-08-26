library home_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nabed_test/model/image_card/image_card.dart';
import 'package:nabed_test/model/image_card/image_list.dart';
import 'package:built_collection/built_collection.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  // fields go here

  String get error;

  bool get isLoading;

  bool get success;

  bool get isLogout;

  BuiltList<ImageCard> get images;

  bool get hasReachedEndOfResults;

  HomeState._();

  factory HomeState([updates(HomeStateBuilder b)]) = _$HomeState;

  factory HomeState.initail() {
    return HomeState((b) => b
      ..error = ""
      ..isLoading = false
      ..success = false
      ..isLogout = false
      ..hasReachedEndOfResults = true);
  }
}
