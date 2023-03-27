// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'socket_event_bus_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SocketEventBusDM {
  String? get taskId => throw _privateConstructorUsedError;
  String? get eventName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SocketEventBusDMCopyWith<SocketEventBusDM> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocketEventBusDMCopyWith<$Res> {
  factory $SocketEventBusDMCopyWith(
          SocketEventBusDM value, $Res Function(SocketEventBusDM) then) =
      _$SocketEventBusDMCopyWithImpl<$Res, SocketEventBusDM>;
  @useResult
  $Res call({String? taskId, String? eventName});
}

/// @nodoc
class _$SocketEventBusDMCopyWithImpl<$Res, $Val extends SocketEventBusDM>
    implements $SocketEventBusDMCopyWith<$Res> {
  _$SocketEventBusDMCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? eventName = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SocketEventBusDMCopyWith<$Res>
    implements $SocketEventBusDMCopyWith<$Res> {
  factory _$$_SocketEventBusDMCopyWith(
          _$_SocketEventBusDM value, $Res Function(_$_SocketEventBusDM) then) =
      __$$_SocketEventBusDMCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? taskId, String? eventName});
}

/// @nodoc
class __$$_SocketEventBusDMCopyWithImpl<$Res>
    extends _$SocketEventBusDMCopyWithImpl<$Res, _$_SocketEventBusDM>
    implements _$$_SocketEventBusDMCopyWith<$Res> {
  __$$_SocketEventBusDMCopyWithImpl(
      _$_SocketEventBusDM _value, $Res Function(_$_SocketEventBusDM) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = freezed,
    Object? eventName = freezed,
  }) {
    return _then(_$_SocketEventBusDM(
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: freezed == eventName
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SocketEventBusDM implements _SocketEventBusDM {
  const _$_SocketEventBusDM({this.taskId, this.eventName});

  @override
  final String? taskId;
  @override
  final String? eventName;

  @override
  String toString() {
    return 'SocketEventBusDM(taskId: $taskId, eventName: $eventName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SocketEventBusDM &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, eventName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocketEventBusDMCopyWith<_$_SocketEventBusDM> get copyWith =>
      __$$_SocketEventBusDMCopyWithImpl<_$_SocketEventBusDM>(this, _$identity);
}

abstract class _SocketEventBusDM implements SocketEventBusDM {
  const factory _SocketEventBusDM(
      {final String? taskId, final String? eventName}) = _$_SocketEventBusDM;

  @override
  String? get taskId;
  @override
  String? get eventName;
  @override
  @JsonKey(ignore: true)
  _$$_SocketEventBusDMCopyWith<_$_SocketEventBusDM> get copyWith =>
      throw _privateConstructorUsedError;
}
