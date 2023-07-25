// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reading _$ReadingFromJson(Map<String, dynamic> json) {
  return _Reading.fromJson(json);
}

/// @nodoc
mixin _$Reading {
  String get reading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadingCopyWith<Reading> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingCopyWith<$Res> {
  factory $ReadingCopyWith(Reading value, $Res Function(Reading) then) =
      _$ReadingCopyWithImpl<$Res, Reading>;
  @useResult
  $Res call({String reading});
}

/// @nodoc
class _$ReadingCopyWithImpl<$Res, $Val extends Reading>
    implements $ReadingCopyWith<$Res> {
  _$ReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
  }) {
    return _then(_value.copyWith(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReadingCopyWith<$Res> implements $ReadingCopyWith<$Res> {
  factory _$$_ReadingCopyWith(
          _$_Reading value, $Res Function(_$_Reading) then) =
      __$$_ReadingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String reading});
}

/// @nodoc
class __$$_ReadingCopyWithImpl<$Res>
    extends _$ReadingCopyWithImpl<$Res, _$_Reading>
    implements _$$_ReadingCopyWith<$Res> {
  __$$_ReadingCopyWithImpl(_$_Reading _value, $Res Function(_$_Reading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reading = null,
  }) {
    return _then(_$_Reading(
      reading: null == reading
          ? _value.reading
          : reading // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reading implements _Reading {
  const _$_Reading({required this.reading});

  factory _$_Reading.fromJson(Map<String, dynamic> json) =>
      _$$_ReadingFromJson(json);

  @override
  final String reading;

  @override
  String toString() {
    return 'Reading(reading: $reading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reading &&
            (identical(other.reading, reading) || other.reading == reading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReadingCopyWith<_$_Reading> get copyWith =>
      __$$_ReadingCopyWithImpl<_$_Reading>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadingToJson(
      this,
    );
  }
}

abstract class _Reading implements Reading {
  const factory _Reading({required final String reading}) = _$_Reading;

  factory _Reading.fromJson(Map<String, dynamic> json) = _$_Reading.fromJson;

  @override
  String get reading;
  @override
  @JsonKey(ignore: true)
  _$$_ReadingCopyWith<_$_Reading> get copyWith =>
      throw _privateConstructorUsedError;
}
