library image_card;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nabed_test/model/serializer/serializer.dart';

part 'image_card.g.dart';

abstract class ImageCard implements Built<ImageCard, ImageCardBuilder> {
  int? get id;

  String? get userImageURL;

  ImageCard._();

  factory ImageCard([updates(ImageCardBuilder b)]) = _$ImageCard;

  String toJson() {
    return json.encode(serializers.serializeWith(ImageCard.serializer, this));
  }

  static ImageCard? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ImageCard.serializer, json.decode(jsonString));
  }

  static Serializer<ImageCard> get serializer => _$imageCardSerializer;
}
