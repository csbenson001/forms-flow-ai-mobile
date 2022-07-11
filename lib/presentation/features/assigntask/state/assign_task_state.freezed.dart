// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'assign_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AssignTaskStateTearOff {
  const _$AssignTaskStateTearOff();

  _AssignTaskState call(
      {required ViewState viewState,
      required bool enableAssignButton,
      required List<MembersDM> membersList,
      required ViewMembersFilterDM selectedMemberFilter}) {
    return _AssignTaskState(
      viewState: viewState,
      enableAssignButton: enableAssignButton,
      membersList: membersList,
      selectedMemberFilter: selectedMemberFilter,
    );
  }
}

/// @nodoc
const $AssignTaskState = _$AssignTaskStateTearOff();

/// @nodoc
mixin _$AssignTaskState {
  ViewState get viewState => throw _privateConstructorUsedError;
  bool get enableAssignButton => throw _privateConstructorUsedError;
  List<MembersDM> get membersList => throw _privateConstructorUsedError;
  ViewMembersFilterDM get selectedMemberFilter =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssignTaskStateCopyWith<AssignTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignTaskStateCopyWith<$Res> {
  factory $AssignTaskStateCopyWith(
          AssignTaskState value, $Res Function(AssignTaskState) then) =
      _$AssignTaskStateCopyWithImpl<$Res>;
  $Res call(
      {ViewState viewState,
      bool enableAssignButton,
      List<MembersDM> membersList,
      ViewMembersFilterDM selectedMemberFilter});
}

/// @nodoc
class _$AssignTaskStateCopyWithImpl<$Res>
    implements $AssignTaskStateCopyWith<$Res> {
  _$AssignTaskStateCopyWithImpl(this._value, this._then);

  final AssignTaskState _value;
  // ignore: unused_field
  final $Res Function(AssignTaskState) _then;

  @override
  $Res call({
    Object? viewState = freezed,
    Object? enableAssignButton = freezed,
    Object? membersList = freezed,
    Object? selectedMemberFilter = freezed,
  }) {
    return _then(_value.copyWith(
      viewState: viewState == freezed
          ? _value.viewState
          : viewState // ignore: cast_nullable_to_non_nullable
              as ViewState,
      enableAssignButton: enableAssignButton == freezed
          ? _value.enableAssignButton
          : enableAssignButton // ignore: cast_nullable_to_non_nullable
              as bool,
      membersList: membersList == freezed
          ? _value.membersList
          : membersList // ignore: cast_nullable_to_non_nullable
              as List<MembersDM>,
      selectedMemberFilter: selectedMemberFilter == freezed
          ? _value.selectedMemberFilter
          : selectedMemberFilter // ignore: cast_nullable_to_non_nullable
              as ViewMembersFilterDM,
    ));
  }
}

/// @nodoc
abstract class _$AssignTaskStateCopyWith<$Res>
    implements $AssignTaskStateCopyWith<$Res> {
  factory _$AssignTaskStateCopyWith(
          _AssignTaskState value, $Res Function(_AssignTaskState) then) =
      __$AssignTaskStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {ViewState viewState,
      bool enableAssignButton,
      List<MembersDM> membersList,
      ViewMembersFilterDM selectedMemberFilter});
}

/// @nodoc
class __$AssignTaskStateCopyWithImpl<$Res>
    extends _$AssignTaskStateCopyWithImpl<$Res>
    implements _$AssignTaskStateCopyWith<$Res> {
  __$AssignTaskStateCopyWithImpl(
      _AssignTaskState _value, $Res Function(_AssignTaskState) _then)
      : super(_value, (v) => _then(v as _AssignTaskState));

  @override
  _AssignTaskState get _value => super._value as _AssignTaskState;

  @override
  $Res call({
    Object? viewState = freezed,
    Object? enableAssignButton = freezed,
    Object? membersList = freezed,
    Object? selectedMemberFilter = freezed,
  }) {
    return _then(_AssignTaskState(
      viewState: viewState == freezed
          ? _value.viewState
          : viewState // ignore: cast_nullable_to_non_nullable
              as ViewState,
      enableAssignButton: enableAssignButton == freezed
          ? _value.enableAssignButton
          : enableAssignButton // ignore: cast_nullable_to_non_nullable
              as bool,
      membersList: membersList == freezed
          ? _value.membersList
          : membersList // ignore: cast_nullable_to_non_nullable
              as List<MembersDM>,
      selectedMemberFilter: selectedMemberFilter == freezed
          ? _value.selectedMemberFilter
          : selectedMemberFilter // ignore: cast_nullable_to_non_nullable
              as ViewMembersFilterDM,
    ));
  }
}

/// @nodoc

class _$_AssignTaskState implements _AssignTaskState {
  const _$_AssignTaskState(
      {required this.viewState,
      required this.enableAssignButton,
      required this.membersList,
      required this.selectedMemberFilter});

  @override
  final ViewState viewState;
  @override
  final bool enableAssignButton;
  @override
  final List<MembersDM> membersList;
  @override
  final ViewMembersFilterDM selectedMemberFilter;

  @override
  String toString() {
    return 'AssignTaskState(viewState: $viewState, enableAssignButton: $enableAssignButton, membersList: $membersList, selectedMemberFilter: $selectedMemberFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AssignTaskState &&
            (identical(other.viewState, viewState) ||
                const DeepCollectionEquality()
                    .equals(other.viewState, viewState)) &&
            (identical(other.enableAssignButton, enableAssignButton) ||
                const DeepCollectionEquality()
                    .equals(other.enableAssignButton, enableAssignButton)) &&
            (identical(other.membersList, membersList) ||
                const DeepCollectionEquality()
                    .equals(other.membersList, membersList)) &&
            (identical(other.selectedMemberFilter, selectedMemberFilter) ||
                const DeepCollectionEquality()
                    .equals(other.selectedMemberFilter, selectedMemberFilter)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(viewState) ^
      const DeepCollectionEquality().hash(enableAssignButton) ^
      const DeepCollectionEquality().hash(membersList) ^
      const DeepCollectionEquality().hash(selectedMemberFilter);

  @JsonKey(ignore: true)
  @override
  _$AssignTaskStateCopyWith<_AssignTaskState> get copyWith =>
      __$AssignTaskStateCopyWithImpl<_AssignTaskState>(this, _$identity);
}

abstract class _AssignTaskState implements AssignTaskState {
  const factory _AssignTaskState(
      {required ViewState viewState,
      required bool enableAssignButton,
      required List<MembersDM> membersList,
      required ViewMembersFilterDM selectedMemberFilter}) = _$_AssignTaskState;

  @override
  ViewState get viewState => throw _privateConstructorUsedError;
  @override
  bool get enableAssignButton => throw _privateConstructorUsedError;
  @override
  List<MembersDM> get membersList => throw _privateConstructorUsedError;
  @override
  ViewMembersFilterDM get selectedMemberFilter =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AssignTaskStateCopyWith<_AssignTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
