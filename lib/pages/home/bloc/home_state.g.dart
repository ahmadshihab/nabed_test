// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final bool isLogout;
  @override
  final BuiltList<ImageCard> images;
  @override
  final bool hasReachedEndOfResults;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._(
      {required this.error,
      required this.isLoading,
      required this.success,
      required this.isLogout,
      required this.images,
      required this.hasReachedEndOfResults})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, 'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(isLoading, 'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(success, 'HomeState', 'success');
    BuiltValueNullFieldError.checkNotNull(isLogout, 'HomeState', 'isLogout');
    BuiltValueNullFieldError.checkNotNull(images, 'HomeState', 'images');
    BuiltValueNullFieldError.checkNotNull(
        hasReachedEndOfResults, 'HomeState', 'hasReachedEndOfResults');
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        error == other.error &&
        isLoading == other.isLoading &&
        success == other.success &&
        isLogout == other.isLogout &&
        images == other.images &&
        hasReachedEndOfResults == other.hasReachedEndOfResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                    success.hashCode),
                isLogout.hashCode),
            images.hashCode),
        hasReachedEndOfResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('isLogout', isLogout)
          ..add('images', images)
          ..add('hasReachedEndOfResults', hasReachedEndOfResults))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  bool? _isLogout;
  bool? get isLogout => _$this._isLogout;
  set isLogout(bool? isLogout) => _$this._isLogout = isLogout;

  ListBuilder<ImageCard>? _images;
  ListBuilder<ImageCard> get images =>
      _$this._images ??= new ListBuilder<ImageCard>();
  set images(ListBuilder<ImageCard>? images) => _$this._images = images;

  bool? _hasReachedEndOfResults;
  bool? get hasReachedEndOfResults => _$this._hasReachedEndOfResults;
  set hasReachedEndOfResults(bool? hasReachedEndOfResults) =>
      _$this._hasReachedEndOfResults = hasReachedEndOfResults;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _success = $v.success;
      _isLogout = $v.isLogout;
      _images = $v.images.toBuilder();
      _hasReachedEndOfResults = $v.hasReachedEndOfResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeState build() {
    _$HomeState _$result;
    try {
      _$result = _$v ??
          new _$HomeState._(
              error: BuiltValueNullFieldError.checkNotNull(
                  error, 'HomeState', 'error'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'HomeState', 'isLoading'),
              success: BuiltValueNullFieldError.checkNotNull(
                  success, 'HomeState', 'success'),
              isLogout: BuiltValueNullFieldError.checkNotNull(
                  isLogout, 'HomeState', 'isLogout'),
              images: images.build(),
              hasReachedEndOfResults: BuiltValueNullFieldError.checkNotNull(
                  hasReachedEndOfResults,
                  'HomeState',
                  'hasReachedEndOfResults'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'images';
        images.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
