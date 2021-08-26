library image_list;

import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:nabed_test/model/image_card/image_card.dart';
import 'package:nabed_test/model/serializer/serializer.dart';

part 'image_list.g.dart';

abstract class ImageList implements Built<ImageList, ImageListBuilder> {
  int get total;

  int get totalHits;

  BuiltList<ImageCard> get hits;

  ImageList._();

  factory ImageList([updates(ImageListBuilder b)]) = _$ImageList;

  String toJson() {
    return json.encode(serializers.serializeWith(ImageList.serializer, this));
  }

  static ImageList? fromJson(String jsonString) {
    return serializers.deserializeWith(
        ImageList.serializer, json.decode(jsonString));
  }

  static Serializer<ImageList> get serializer => _$imageListSerializer;
}
