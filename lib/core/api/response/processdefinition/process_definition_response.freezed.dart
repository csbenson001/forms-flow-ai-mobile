// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'process_definition_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProcessDefinitionResponse _$ProcessDefinitionResponseFromJson(
    Map<String, dynamic> json) {
  return _ProcessDefinitionResponse.fromJson(json);
}

/// @nodoc
class _$ProcessDefinitionResponseTearOff {
  const _$ProcessDefinitionResponseTearOff();

  _ProcessDefinitionResponse call(
      {String? id,
      String? key,
      String? category,
      dynamic description = "",
      String? name,
      int? version,
      String? resource,
      String? deploymentId,
      dynamic diagram = "",
      bool? suspended,
      dynamic tenantId = "",
      String? versionTag,
      dynamic historyTimeToLive = false,
      bool? startableInTasklist}) {
    return _ProcessDefinitionResponse(
      id: id,
      key: key,
      category: category,
      description: description,
      name: name,
      version: version,
      resource: resource,
      deploymentId: deploymentId,
      diagram: diagram,
      suspended: suspended,
      tenantId: tenantId,
      versionTag: versionTag,
      historyTimeToLive: historyTimeToLive,
      startableInTasklist: startableInTasklist,
    );
  }

  ProcessDefinitionResponse fromJson(Map<String, Object> json) {
    return ProcessDefinitionResponse.fromJson(json);
  }
}

/// @nodoc
const $ProcessDefinitionResponse = _$ProcessDefinitionResponseTearOff();

/// @nodoc
mixin _$ProcessDefinitionResponse {
  String? get id => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  dynamic get description => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get version => throw _privateConstructorUsedError;
  String? get resource => throw _privateConstructorUsedError;
  String? get deploymentId => throw _privateConstructorUsedError;
  dynamic get diagram => throw _privateConstructorUsedError;
  bool? get suspended => throw _privateConstructorUsedError;
  dynamic get tenantId => throw _privateConstructorUsedError;
  String? get versionTag => throw _privateConstructorUsedError;
  dynamic get historyTimeToLive => throw _privateConstructorUsedError;
  bool? get startableInTasklist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProcessDefinitionResponseCopyWith<ProcessDefinitionResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessDefinitionResponseCopyWith<$Res> {
  factory $ProcessDefinitionResponseCopyWith(ProcessDefinitionResponse value,
          $Res Function(ProcessDefinitionResponse) then) =
      _$ProcessDefinitionResponseCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? key,
      String? category,
      dynamic description,
      String? name,
      int? version,
      String? resource,
      String? deploymentId,
      dynamic diagram,
      bool? suspended,
      dynamic tenantId,
      String? versionTag,
      dynamic historyTimeToLive,
      bool? startableInTasklist});
}

/// @nodoc
class _$ProcessDefinitionResponseCopyWithImpl<$Res>
    implements $ProcessDefinitionResponseCopyWith<$Res> {
  _$ProcessDefinitionResponseCopyWithImpl(this._value, this._then);

  final ProcessDefinitionResponse _value;
  // ignore: unused_field
  final $Res Function(ProcessDefinitionResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? name = freezed,
    Object? version = freezed,
    Object? resource = freezed,
    Object? deploymentId = freezed,
    Object? diagram = freezed,
    Object? suspended = freezed,
    Object? tenantId = freezed,
    Object? versionTag = freezed,
    Object? historyTimeToLive = freezed,
    Object? startableInTasklist = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      resource: resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
      deploymentId: deploymentId == freezed
          ? _value.deploymentId
          : deploymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      diagram: diagram == freezed
          ? _value.diagram
          : diagram // ignore: cast_nullable_to_non_nullable
              as dynamic,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      versionTag: versionTag == freezed
          ? _value.versionTag
          : versionTag // ignore: cast_nullable_to_non_nullable
              as String?,
      historyTimeToLive: historyTimeToLive == freezed
          ? _value.historyTimeToLive
          : historyTimeToLive // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startableInTasklist: startableInTasklist == freezed
          ? _value.startableInTasklist
          : startableInTasklist // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$ProcessDefinitionResponseCopyWith<$Res>
    implements $ProcessDefinitionResponseCopyWith<$Res> {
  factory _$ProcessDefinitionResponseCopyWith(_ProcessDefinitionResponse value,
          $Res Function(_ProcessDefinitionResponse) then) =
      __$ProcessDefinitionResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? key,
      String? category,
      dynamic description,
      String? name,
      int? version,
      String? resource,
      String? deploymentId,
      dynamic diagram,
      bool? suspended,
      dynamic tenantId,
      String? versionTag,
      dynamic historyTimeToLive,
      bool? startableInTasklist});
}

/// @nodoc
class __$ProcessDefinitionResponseCopyWithImpl<$Res>
    extends _$ProcessDefinitionResponseCopyWithImpl<$Res>
    implements _$ProcessDefinitionResponseCopyWith<$Res> {
  __$ProcessDefinitionResponseCopyWithImpl(_ProcessDefinitionResponse _value,
      $Res Function(_ProcessDefinitionResponse) _then)
      : super(_value, (v) => _then(v as _ProcessDefinitionResponse));

  @override
  _ProcessDefinitionResponse get _value =>
      super._value as _ProcessDefinitionResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? key = freezed,
    Object? category = freezed,
    Object? description = freezed,
    Object? name = freezed,
    Object? version = freezed,
    Object? resource = freezed,
    Object? deploymentId = freezed,
    Object? diagram = freezed,
    Object? suspended = freezed,
    Object? tenantId = freezed,
    Object? versionTag = freezed,
    Object? historyTimeToLive = freezed,
    Object? startableInTasklist = freezed,
  }) {
    return _then(_ProcessDefinitionResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int?,
      resource: resource == freezed
          ? _value.resource
          : resource // ignore: cast_nullable_to_non_nullable
              as String?,
      deploymentId: deploymentId == freezed
          ? _value.deploymentId
          : deploymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      diagram: diagram == freezed
          ? _value.diagram
          : diagram // ignore: cast_nullable_to_non_nullable
              as dynamic,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      tenantId: tenantId == freezed
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      versionTag: versionTag == freezed
          ? _value.versionTag
          : versionTag // ignore: cast_nullable_to_non_nullable
              as String?,
      historyTimeToLive: historyTimeToLive == freezed
          ? _value.historyTimeToLive
          : historyTimeToLive // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startableInTasklist: startableInTasklist == freezed
          ? _value.startableInTasklist
          : startableInTasklist // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProcessDefinitionResponse implements _ProcessDefinitionResponse {
  const _$_ProcessDefinitionResponse(
      {this.id,
      this.key,
      this.category,
      this.description = "",
      this.name,
      this.version,
      this.resource,
      this.deploymentId,
      this.diagram = "",
      this.suspended,
      this.tenantId = "",
      this.versionTag,
      this.historyTimeToLive = false,
      this.startableInTasklist});

  factory _$_ProcessDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ProcessDefinitionResponseFromJson(json);

  @override
  final String? id;
  @override
  final String? key;
  @override
  final String? category;
  @JsonKey(defaultValue: "")
  @override
  final dynamic description;
  @override
  final String? name;
  @override
  final int? version;
  @override
  final String? resource;
  @override
  final String? deploymentId;
  @JsonKey(defaultValue: "")
  @override
  final dynamic diagram;
  @override
  final bool? suspended;
  @JsonKey(defaultValue: "")
  @override
  final dynamic tenantId;
  @override
  final String? versionTag;
  @JsonKey(defaultValue: false)
  @override
  final dynamic historyTimeToLive;
  @override
  final bool? startableInTasklist;

  @override
  String toString() {
    return 'ProcessDefinitionResponse(id: $id, key: $key, category: $category, description: $description, name: $name, version: $version, resource: $resource, deploymentId: $deploymentId, diagram: $diagram, suspended: $suspended, tenantId: $tenantId, versionTag: $versionTag, historyTimeToLive: $historyTimeToLive, startableInTasklist: $startableInTasklist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProcessDefinitionResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.key, key) ||
                const DeepCollectionEquality().equals(other.key, key)) &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.version, version) ||
                const DeepCollectionEquality()
                    .equals(other.version, version)) &&
            (identical(other.resource, resource) ||
                const DeepCollectionEquality()
                    .equals(other.resource, resource)) &&
            (identical(other.deploymentId, deploymentId) ||
                const DeepCollectionEquality()
                    .equals(other.deploymentId, deploymentId)) &&
            (identical(other.diagram, diagram) ||
                const DeepCollectionEquality()
                    .equals(other.diagram, diagram)) &&
            (identical(other.suspended, suspended) ||
                const DeepCollectionEquality()
                    .equals(other.suspended, suspended)) &&
            (identical(other.tenantId, tenantId) ||
                const DeepCollectionEquality()
                    .equals(other.tenantId, tenantId)) &&
            (identical(other.versionTag, versionTag) ||
                const DeepCollectionEquality()
                    .equals(other.versionTag, versionTag)) &&
            (identical(other.historyTimeToLive, historyTimeToLive) ||
                const DeepCollectionEquality()
                    .equals(other.historyTimeToLive, historyTimeToLive)) &&
            (identical(other.startableInTasklist, startableInTasklist) ||
                const DeepCollectionEquality()
                    .equals(other.startableInTasklist, startableInTasklist)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(key) ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(version) ^
      const DeepCollectionEquality().hash(resource) ^
      const DeepCollectionEquality().hash(deploymentId) ^
      const DeepCollectionEquality().hash(diagram) ^
      const DeepCollectionEquality().hash(suspended) ^
      const DeepCollectionEquality().hash(tenantId) ^
      const DeepCollectionEquality().hash(versionTag) ^
      const DeepCollectionEquality().hash(historyTimeToLive) ^
      const DeepCollectionEquality().hash(startableInTasklist);

  @JsonKey(ignore: true)
  @override
  _$ProcessDefinitionResponseCopyWith<_ProcessDefinitionResponse>
      get copyWith =>
          __$ProcessDefinitionResponseCopyWithImpl<_ProcessDefinitionResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProcessDefinitionResponseToJson(this);
  }
}

abstract class _ProcessDefinitionResponse implements ProcessDefinitionResponse {
  const factory _ProcessDefinitionResponse(
      {String? id,
      String? key,
      String? category,
      dynamic description,
      String? name,
      int? version,
      String? resource,
      String? deploymentId,
      dynamic diagram,
      bool? suspended,
      dynamic tenantId,
      String? versionTag,
      dynamic historyTimeToLive,
      bool? startableInTasklist}) = _$_ProcessDefinitionResponse;

  factory _ProcessDefinitionResponse.fromJson(Map<String, dynamic> json) =
      _$_ProcessDefinitionResponse.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get key => throw _privateConstructorUsedError;
  @override
  String? get category => throw _privateConstructorUsedError;
  @override
  dynamic get description => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  int? get version => throw _privateConstructorUsedError;
  @override
  String? get resource => throw _privateConstructorUsedError;
  @override
  String? get deploymentId => throw _privateConstructorUsedError;
  @override
  dynamic get diagram => throw _privateConstructorUsedError;
  @override
  bool? get suspended => throw _privateConstructorUsedError;
  @override
  dynamic get tenantId => throw _privateConstructorUsedError;
  @override
  String? get versionTag => throw _privateConstructorUsedError;
  @override
  dynamic get historyTimeToLive => throw _privateConstructorUsedError;
  @override
  bool? get startableInTasklist => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProcessDefinitionResponseCopyWith<_ProcessDefinitionResponse>
      get copyWith => throw _privateConstructorUsedError;
}
