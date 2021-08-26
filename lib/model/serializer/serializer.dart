library serializer;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:nabed_test/model/image_card/image_list.dart';
import 'package:nabed_test/model/image_card/image_card.dart';

part 'serializer.g.dart';

@SerializersFor(const [ImageList, ImageCard])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addBuilderFactory(
          (FullType(
            BuiltList,
            [
              const FullType(ImageCard),
            ],
          )),
          () => ListBuilder<ImageCard>()))
    .build();
