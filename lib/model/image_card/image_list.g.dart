// GENERATED CODE - DO NOT MODIFY BY HAND

part of image_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageList> _$imageListSerializer = new _$ImageListSerializer();

class _$ImageListSerializer implements StructuredSerializer<ImageList> {
  @override
  final Iterable<Type> types = const [ImageList, _$ImageList];
  @override
  final String wireName = 'ImageList';

  @override
  Iterable<Object?> serialize(Serializers serializers, ImageList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'total',
      serializers.serialize(object.total, specifiedType: const FullType(int)),
      'totalHits',
      serializers.serialize(object.totalHits,
          specifiedType: const FullType(int)),
      'hits',
      serializers.serialize(object.hits,
          specifiedType:
              const FullType(BuiltList, const [const FullType(ImageCard)])),
    ];

    return result;
  }

  @override
  ImageList deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'total':
          result.total = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'totalHits':
          result.totalHits = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hits':
          result.hits.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ImageCard)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ImageList extends ImageList {
  @override
  final int total;
  @override
  final int totalHits;
  @override
  final BuiltList<ImageCard> hits;

  factory _$ImageList([void Function(ImageListBuilder)? updates]) =>
      (new ImageListBuilder()..update(updates)).build();

  _$ImageList._(
      {required this.total, required this.totalHits, required this.hits})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(total, 'ImageList', 'total');
    BuiltValueNullFieldError.checkNotNull(totalHits, 'ImageList', 'totalHits');
    BuiltValueNullFieldError.checkNotNull(hits, 'ImageList', 'hits');
  }

  @override
  ImageList rebuild(void Function(ImageListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageListBuilder toBuilder() => new ImageListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageList &&
        total == other.total &&
        totalHits == other.totalHits &&
        hits == other.hits;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, total.hashCode), totalHits.hashCode), hits.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageList')
          ..add('total', total)
          ..add('totalHits', totalHits)
          ..add('hits', hits))
        .toString();
  }
}

class ImageListBuilder implements Builder<ImageList, ImageListBuilder> {
  _$ImageList? _$v;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  int? _totalHits;
  int? get totalHits => _$this._totalHits;
  set totalHits(int? totalHits) => _$this._totalHits = totalHits;

  ListBuilder<ImageCard>? _hits;
  ListBuilder<ImageCard> get hits =>
      _$this._hits ??= new ListBuilder<ImageCard>();
  set hits(ListBuilder<ImageCard>? hits) => _$this._hits = hits;

  ImageListBuilder();

  ImageListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _total = $v.total;
      _totalHits = $v.totalHits;
      _hits = $v.hits.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ImageList;
  }

  @override
  void update(void Function(ImageListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageList build() {
    _$ImageList _$result;
    try {
      _$result = _$v ??
          new _$ImageList._(
              total: BuiltValueNullFieldError.checkNotNull(
                  total, 'ImageList', 'total'),
              totalHits: BuiltValueNullFieldError.checkNotNull(
                  totalHits, 'ImageList', 'totalHits'),
              hits: hits.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'hits';
        hits.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ImageList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
