// GENERATED CODE - DO NOT MODIFY BY HAND

part of image_card;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageCard> _$imageCardSerializer = new _$ImageCardSerializer();

class _$ImageCardSerializer implements StructuredSerializer<ImageCard> {
  @override
  final Iterable<Type> types = const [ImageCard, _$ImageCard];
  @override
  final String wireName = 'ImageCard';

  @override
  Iterable<Object?> serialize(Serializers serializers, ImageCard object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userImageURL;
    if (value != null) {
      result
        ..add('userImageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ImageCard deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageCardBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'userImageURL':
          result.userImageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageCard extends ImageCard {
  @override
  final int? id;
  @override
  final String? userImageURL;

  factory _$ImageCard([void Function(ImageCardBuilder)? updates]) =>
      (new ImageCardBuilder()..update(updates)).build();

  _$ImageCard._({this.id, this.userImageURL}) : super._();

  @override
  ImageCard rebuild(void Function(ImageCardBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageCardBuilder toBuilder() => new ImageCardBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageCard &&
        id == other.id &&
        userImageURL == other.userImageURL;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), userImageURL.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageCard')
          ..add('id', id)
          ..add('userImageURL', userImageURL))
        .toString();
  }
}

class ImageCardBuilder implements Builder<ImageCard, ImageCardBuilder> {
  _$ImageCard? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _userImageURL;
  String? get userImageURL => _$this._userImageURL;
  set userImageURL(String? userImageURL) => _$this._userImageURL = userImageURL;

  ImageCardBuilder();

  ImageCardBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _userImageURL = $v.userImageURL;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageCard other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImageCard;
  }

  @override
  void update(void Function(ImageCardBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageCard build() {
    final _$result =
        _$v ?? new _$ImageCard._(id: id, userImageURL: userImageURL);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
