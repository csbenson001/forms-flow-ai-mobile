// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'socket_event_bus_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SocketEventBusDMTearOff {
  const _$SocketEventBusDMTearOff();

  _SocketEventBusDM call({String? taskId, String? eventName}) {
    return _SocketEventBusDM(
      taskId: taskId,
      eventName: eventName,
    );
  }
}

/// @nodoc
const $SocketEventBusDM = _$SocketEventBusDMTearOff();

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
      _$SocketEventBusDMCopyWithImpl<$Res>;
  $Res call({String? taskId, String? eventName});
}

/// @nodoc
class _$SocketEventBusDMCopyWithImpl<$Res>
    implements $SocketEventBusDMCopyWith<$Res> {
  _$SocketEventBusDMCopyWithImpl(this._value, this._then);

  final SocketEventBusDM _value;
  // ignore: unused_field
  final $Res Function(SocketEventBusDM) _then;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? eventName = freezed,
  }) {
    return _then(_value.copyWith(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: eventName == freezed
          ? _value.eventName
          : eventName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SocketEventBusDMCopyWith<$Res>
    implements $SocketEventBusDMCopyWith<$Res> {
  factory _$SocketEventBusDMCopyWith(
          _SocketEventBusDM value, $Res Function(_SocketEventBusDM) then) =
      __$SocketEventBusDMCopyWithImpl<$Res>;
  @override
  $Res call({String? taskId, String? eventName});
}

/// @nodoc
class __$SocketEventBusDMCopyWithImpl<$Res>
    extends _$SocketEventBusDMCopyWithImpl<$Res>
    implements _$SocketEventBusDMCopyWith<$Res> {
  __$SocketEventBusDMCopyWithImpl(
      _SocketEventBusDM _value, $Res Function(_SocketEventBusDM) _then)
      : super(_value, (v) => _then(v as _SocketEventBusDM));

  @override
  _SocketEventBusDM get _value => super._value as _SocketEventBusDM;

  @override
  $Res call({
    Object? taskId = freezed,
    Object? eventName = freezed,
  }) {
    return _then(_SocketEventBusDM(
      taskId: taskId == freezed
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      eventName: eventName == freezed
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
        (other is _SocketEventBusDM &&
            (identical(other.taskId, taskId) ||
                const DeepCollectionEquality().equals(other.taskId, taskId)) &&
            (identical(other.eventName, eventName) ||
                const DeepCollectionEquality()
                    .equals(other.eventName, eventName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(taskId) ^
      const DeepCollectionEquality().hash(eventName);

  @JsonKey(ignore: true)
  @override
  _$SocketEventBusDMCopyWith<_SocketEventBusDM> get copyWith =>
      __$SocketEventBusDMCopyWithImpl<_SocketEventBusDM>(this, _$identity);
}

abstract class _SocketEventBusDM implements SocketEventBusDM {
  const factory _SocketEventBusDM({String? taskId, String? eventName}) =
      _$_SocketEventBusDM;

  @override
  String? get taskId => throw _privateConstructorUsedError;
  @override
  String? get eventName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SocketEventBusDMCopyWith<_SocketEventBusDM> get copyWith =>
      throw _privateConstructorUsedError;
}
