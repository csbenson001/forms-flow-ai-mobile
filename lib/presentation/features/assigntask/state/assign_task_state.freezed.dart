// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assign_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$AssignTaskStateCopyWithImpl<$Res, AssignTaskState>;
  @useResult
  $Res call(
      {ViewState viewState,
      bool enableAssignButton,
      List<MembersDM> membersList,
      ViewMembersFilterDM selectedMemberFilter});
}

/// @nodoc
class _$AssignTaskStateCopyWithImpl<$Res, $Val extends AssignTaskState>
    implements $AssignTaskStateCopyWith<$Res> {
  _$AssignTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? enableAssignButton = null,
    Object? membersList = null,
    Object? selectedMemberFilter = null,
  }) {
    return _then(_value.copyWith(
      viewState: null == viewState
          ? _value.viewState
          : viewState // ignore: cast_nullable_to_non_nullable
              as ViewState,
      enableAssignButton: null == enableAssignButton
          ? _value.enableAssignButton
          : enableAssignButton // ignore: cast_nullable_to_non_nullable
              as bool,
      membersList: null == membersList
          ? _value.membersList
          : membersList // ignore: cast_nullable_to_non_nullable
              as List<MembersDM>,
      selectedMemberFilter: null == selectedMemberFilter
          ? _value.selectedMemberFilter
          : selectedMemberFilter // ignore: cast_nullable_to_non_nullable
              as ViewMembersFilterDM,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssignTaskStateCopyWith<$Res>
    implements $AssignTaskStateCopyWith<$Res> {
  factory _$$_AssignTaskStateCopyWith(
          _$_AssignTaskState value, $Res Function(_$_AssignTaskState) then) =
      __$$_AssignTaskStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ViewState viewState,
      bool enableAssignButton,
      List<MembersDM> membersList,
      ViewMembersFilterDM selectedMemberFilter});
}

/// @nodoc
class __$$_AssignTaskStateCopyWithImpl<$Res>
    extends _$AssignTaskStateCopyWithImpl<$Res, _$_AssignTaskState>
    implements _$$_AssignTaskStateCopyWith<$Res> {
  __$$_AssignTaskStateCopyWithImpl(
      _$_AssignTaskState _value, $Res Function(_$_AssignTaskState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? viewState = null,
    Object? enableAssignButton = null,
    Object? membersList = null,
    Object? selectedMemberFilter = null,
  }) {
    return _then(_$_AssignTaskState(
      viewState: null == viewState
          ? _value.viewState
          : viewState // ignore: cast_nullable_to_non_nullable
              as ViewState,
      enableAssignButton: null == enableAssignButton
          ? _value.enableAssignButton
          : enableAssignButton // ignore: cast_nullable_to_non_nullable
              as bool,
      membersList: null == membersList
          ? _value._membersList
          : membersList // ignore: cast_nullable_to_non_nullable
              as List<MembersDM>,
      selectedMemberFilter: null == selectedMemberFilter
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
      required final List<MembersDM> membersList,
      required this.selectedMemberFilter})
      : _membersList = membersList;

  @override
  final ViewState viewState;
  @override
  final bool enableAssignButton;
  final List<MembersDM> _membersList;
  @override
  List<MembersDM> get membersList {
    if (_membersList is EqualUnmodifiableListView) return _membersList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_membersList);
  }

  @override
  final ViewMembersFilterDM selectedMemberFilter;

  @override
  String toString() {
    return 'AssignTaskState(viewState: $viewState, enableAssignButton: $enableAssignButton, membersList: $membersList, selectedMemberFilter: $selectedMemberFilter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssignTaskState &&
            (identical(other.viewState, viewState) ||
                other.viewState == viewState) &&
            (identical(other.enableAssignButton, enableAssignButton) ||
                other.enableAssignButton == enableAssignButton) &&
            const DeepCollectionEquality()
                .equals(other._membersList, _membersList) &&
            (identical(other.selectedMemberFilter, selectedMemberFilter) ||
                other.selectedMemberFilter == selectedMemberFilter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, viewState, enableAssignButton,
      const DeepCollectionEquality().hash(_membersList), selectedMemberFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssignTaskStateCopyWith<_$_AssignTaskState> get copyWith =>
      __$$_AssignTaskStateCopyWithImpl<_$_AssignTaskState>(this, _$identity);
}

abstract class _AssignTaskState implements AssignTaskState {
  const factory _AssignTaskState(
          {required final ViewState viewState,
          required final bool enableAssignButton,
          required final List<MembersDM> membersList,
          required final ViewMembersFilterDM selectedMemberFilter}) =
      _$_AssignTaskState;

  @override
  ViewState get viewState;
  @override
  bool get enableAssignButton;
  @override
  List<MembersDM> get membersList;
  @override
  ViewMembersFilterDM get selectedMemberFilter;
  @override
  @JsonKey(ignore: true)
  _$$_AssignTaskStateCopyWith<_$_AssignTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}
