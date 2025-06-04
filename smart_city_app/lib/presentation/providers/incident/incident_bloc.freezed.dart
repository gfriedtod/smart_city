// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'incident_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$IncidentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getIncidents,
    required TResult Function(IncidentDto incident, File image) createIncident,
    required TResult Function(ChangeIncidentStatusRequest incident)
    updateIncident,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getIncidents,
    TResult? Function(IncidentDto incident, File image)? createIncident,
    TResult? Function(ChangeIncidentStatusRequest incident)? updateIncident,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getIncidents,
    TResult Function(IncidentDto incident, File image)? createIncident,
    TResult Function(ChangeIncidentStatusRequest incident)? updateIncident,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetIncidents value) getIncidents,
    required TResult Function(_CreateIncident value) createIncident,
    required TResult Function(_UpdateIncident value) updateIncident,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetIncidents value)? getIncidents,
    TResult? Function(_CreateIncident value)? createIncident,
    TResult? Function(_UpdateIncident value)? updateIncident,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetIncidents value)? getIncidents,
    TResult Function(_CreateIncident value)? createIncident,
    TResult Function(_UpdateIncident value)? updateIncident,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentEventCopyWith<$Res> {
  factory $IncidentEventCopyWith(
    IncidentEvent value,
    $Res Function(IncidentEvent) then,
  ) = _$IncidentEventCopyWithImpl<$Res, IncidentEvent>;
}

/// @nodoc
class _$IncidentEventCopyWithImpl<$Res, $Val extends IncidentEvent>
    implements $IncidentEventCopyWith<$Res> {
  _$IncidentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$IncidentEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'IncidentEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getIncidents,
    required TResult Function(IncidentDto incident, File image) createIncident,
    required TResult Function(ChangeIncidentStatusRequest incident)
    updateIncident,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getIncidents,
    TResult? Function(IncidentDto incident, File image)? createIncident,
    TResult? Function(ChangeIncidentStatusRequest incident)? updateIncident,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getIncidents,
    TResult Function(IncidentDto incident, File image)? createIncident,
    TResult Function(ChangeIncidentStatusRequest incident)? updateIncident,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetIncidents value) getIncidents,
    required TResult Function(_CreateIncident value) createIncident,
    required TResult Function(_UpdateIncident value) updateIncident,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetIncidents value)? getIncidents,
    TResult? Function(_CreateIncident value)? createIncident,
    TResult? Function(_UpdateIncident value)? updateIncident,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetIncidents value)? getIncidents,
    TResult Function(_CreateIncident value)? createIncident,
    TResult Function(_UpdateIncident value)? updateIncident,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements IncidentEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetIncidentsImplCopyWith<$Res> {
  factory _$$GetIncidentsImplCopyWith(
    _$GetIncidentsImpl value,
    $Res Function(_$GetIncidentsImpl) then,
  ) = __$$GetIncidentsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetIncidentsImplCopyWithImpl<$Res>
    extends _$IncidentEventCopyWithImpl<$Res, _$GetIncidentsImpl>
    implements _$$GetIncidentsImplCopyWith<$Res> {
  __$$GetIncidentsImplCopyWithImpl(
    _$GetIncidentsImpl _value,
    $Res Function(_$GetIncidentsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetIncidentsImpl implements _GetIncidents {
  const _$GetIncidentsImpl();

  @override
  String toString() {
    return 'IncidentEvent.getIncidents()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetIncidentsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getIncidents,
    required TResult Function(IncidentDto incident, File image) createIncident,
    required TResult Function(ChangeIncidentStatusRequest incident)
    updateIncident,
  }) {
    return getIncidents();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getIncidents,
    TResult? Function(IncidentDto incident, File image)? createIncident,
    TResult? Function(ChangeIncidentStatusRequest incident)? updateIncident,
  }) {
    return getIncidents?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getIncidents,
    TResult Function(IncidentDto incident, File image)? createIncident,
    TResult Function(ChangeIncidentStatusRequest incident)? updateIncident,
    required TResult orElse(),
  }) {
    if (getIncidents != null) {
      return getIncidents();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetIncidents value) getIncidents,
    required TResult Function(_CreateIncident value) createIncident,
    required TResult Function(_UpdateIncident value) updateIncident,
  }) {
    return getIncidents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetIncidents value)? getIncidents,
    TResult? Function(_CreateIncident value)? createIncident,
    TResult? Function(_UpdateIncident value)? updateIncident,
  }) {
    return getIncidents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetIncidents value)? getIncidents,
    TResult Function(_CreateIncident value)? createIncident,
    TResult Function(_UpdateIncident value)? updateIncident,
    required TResult orElse(),
  }) {
    if (getIncidents != null) {
      return getIncidents(this);
    }
    return orElse();
  }
}

abstract class _GetIncidents implements IncidentEvent {
  const factory _GetIncidents() = _$GetIncidentsImpl;
}

/// @nodoc
abstract class _$$CreateIncidentImplCopyWith<$Res> {
  factory _$$CreateIncidentImplCopyWith(
    _$CreateIncidentImpl value,
    $Res Function(_$CreateIncidentImpl) then,
  ) = __$$CreateIncidentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({IncidentDto incident, File image});
}

/// @nodoc
class __$$CreateIncidentImplCopyWithImpl<$Res>
    extends _$IncidentEventCopyWithImpl<$Res, _$CreateIncidentImpl>
    implements _$$CreateIncidentImplCopyWith<$Res> {
  __$$CreateIncidentImplCopyWithImpl(
    _$CreateIncidentImpl _value,
    $Res Function(_$CreateIncidentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? incident = null, Object? image = null}) {
    return _then(
      _$CreateIncidentImpl(
        incident: null == incident
            ? _value.incident
            : incident // ignore: cast_nullable_to_non_nullable
                  as IncidentDto,
        image: null == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as File,
      ),
    );
  }
}

/// @nodoc

class _$CreateIncidentImpl implements _CreateIncident {
  const _$CreateIncidentImpl({required this.incident, required this.image});

  @override
  final IncidentDto incident;
  @override
  final File image;

  @override
  String toString() {
    return 'IncidentEvent.createIncident(incident: $incident, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateIncidentImpl &&
            (identical(other.incident, incident) ||
                other.incident == incident) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incident, image);

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateIncidentImplCopyWith<_$CreateIncidentImpl> get copyWith =>
      __$$CreateIncidentImplCopyWithImpl<_$CreateIncidentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getIncidents,
    required TResult Function(IncidentDto incident, File image) createIncident,
    required TResult Function(ChangeIncidentStatusRequest incident)
    updateIncident,
  }) {
    return createIncident(incident, image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getIncidents,
    TResult? Function(IncidentDto incident, File image)? createIncident,
    TResult? Function(ChangeIncidentStatusRequest incident)? updateIncident,
  }) {
    return createIncident?.call(incident, image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getIncidents,
    TResult Function(IncidentDto incident, File image)? createIncident,
    TResult Function(ChangeIncidentStatusRequest incident)? updateIncident,
    required TResult orElse(),
  }) {
    if (createIncident != null) {
      return createIncident(incident, image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetIncidents value) getIncidents,
    required TResult Function(_CreateIncident value) createIncident,
    required TResult Function(_UpdateIncident value) updateIncident,
  }) {
    return createIncident(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetIncidents value)? getIncidents,
    TResult? Function(_CreateIncident value)? createIncident,
    TResult? Function(_UpdateIncident value)? updateIncident,
  }) {
    return createIncident?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetIncidents value)? getIncidents,
    TResult Function(_CreateIncident value)? createIncident,
    TResult Function(_UpdateIncident value)? updateIncident,
    required TResult orElse(),
  }) {
    if (createIncident != null) {
      return createIncident(this);
    }
    return orElse();
  }
}

abstract class _CreateIncident implements IncidentEvent {
  const factory _CreateIncident({
    required final IncidentDto incident,
    required final File image,
  }) = _$CreateIncidentImpl;

  IncidentDto get incident;
  File get image;

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateIncidentImplCopyWith<_$CreateIncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateIncidentImplCopyWith<$Res> {
  factory _$$UpdateIncidentImplCopyWith(
    _$UpdateIncidentImpl value,
    $Res Function(_$UpdateIncidentImpl) then,
  ) = __$$UpdateIncidentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ChangeIncidentStatusRequest incident});
}

/// @nodoc
class __$$UpdateIncidentImplCopyWithImpl<$Res>
    extends _$IncidentEventCopyWithImpl<$Res, _$UpdateIncidentImpl>
    implements _$$UpdateIncidentImplCopyWith<$Res> {
  __$$UpdateIncidentImplCopyWithImpl(
    _$UpdateIncidentImpl _value,
    $Res Function(_$UpdateIncidentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? incident = null}) {
    return _then(
      _$UpdateIncidentImpl(
        incident: null == incident
            ? _value.incident
            : incident // ignore: cast_nullable_to_non_nullable
                  as ChangeIncidentStatusRequest,
      ),
    );
  }
}

/// @nodoc

class _$UpdateIncidentImpl implements _UpdateIncident {
  const _$UpdateIncidentImpl({required this.incident});

  @override
  final ChangeIncidentStatusRequest incident;

  @override
  String toString() {
    return 'IncidentEvent.updateIncident(incident: $incident)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateIncidentImpl &&
            (identical(other.incident, incident) ||
                other.incident == incident));
  }

  @override
  int get hashCode => Object.hash(runtimeType, incident);

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateIncidentImplCopyWith<_$UpdateIncidentImpl> get copyWith =>
      __$$UpdateIncidentImplCopyWithImpl<_$UpdateIncidentImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getIncidents,
    required TResult Function(IncidentDto incident, File image) createIncident,
    required TResult Function(ChangeIncidentStatusRequest incident)
    updateIncident,
  }) {
    return updateIncident(incident);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getIncidents,
    TResult? Function(IncidentDto incident, File image)? createIncident,
    TResult? Function(ChangeIncidentStatusRequest incident)? updateIncident,
  }) {
    return updateIncident?.call(incident);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getIncidents,
    TResult Function(IncidentDto incident, File image)? createIncident,
    TResult Function(ChangeIncidentStatusRequest incident)? updateIncident,
    required TResult orElse(),
  }) {
    if (updateIncident != null) {
      return updateIncident(incident);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetIncidents value) getIncidents,
    required TResult Function(_CreateIncident value) createIncident,
    required TResult Function(_UpdateIncident value) updateIncident,
  }) {
    return updateIncident(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetIncidents value)? getIncidents,
    TResult? Function(_CreateIncident value)? createIncident,
    TResult? Function(_UpdateIncident value)? updateIncident,
  }) {
    return updateIncident?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetIncidents value)? getIncidents,
    TResult Function(_CreateIncident value)? createIncident,
    TResult Function(_UpdateIncident value)? updateIncident,
    required TResult orElse(),
  }) {
    if (updateIncident != null) {
      return updateIncident(this);
    }
    return orElse();
  }
}

abstract class _UpdateIncident implements IncidentEvent {
  const factory _UpdateIncident({
    required final ChangeIncidentStatusRequest incident,
  }) = _$UpdateIncidentImpl;

  ChangeIncidentStatusRequest get incident;

  /// Create a copy of IncidentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateIncidentImplCopyWith<_$UpdateIncidentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IncidentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncidentStateCopyWith<$Res> {
  factory $IncidentStateCopyWith(
    IncidentState value,
    $Res Function(IncidentState) then,
  ) = _$IncidentStateCopyWithImpl<$Res, IncidentState>;
}

/// @nodoc
class _$IncidentStateCopyWithImpl<$Res, $Val extends IncidentState>
    implements $IncidentStateCopyWith<$Res> {
  _$IncidentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$IncidentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'IncidentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements IncidentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$IncidentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'IncidentState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements IncidentState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<IncidentDto> incidents});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$IncidentStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? incidents = null}) {
    return _then(
      _$LoadedImpl(
        null == incidents
            ? _value._incidents
            : incidents // ignore: cast_nullable_to_non_nullable
                  as List<IncidentDto>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<IncidentDto> incidents)
    : _incidents = incidents;

  final List<IncidentDto> _incidents;
  @override
  List<IncidentDto> get incidents {
    if (_incidents is EqualUnmodifiableListView) return _incidents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incidents);
  }

  @override
  String toString() {
    return 'IncidentState.loaded(incidents: $incidents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(
              other._incidents,
              _incidents,
            ));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_incidents));

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) {
    return loaded(incidents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) {
    return loaded?.call(incidents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(incidents);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements IncidentState {
  const factory _Loaded(final List<IncidentDto> incidents) = _$LoadedImpl;

  List<IncidentDto> get incidents;

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<$Res> {
  factory _$$EmptyImplCopyWith(
    _$EmptyImpl value,
    $Res Function(_$EmptyImpl) then,
  ) = __$$EmptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<$Res>
    extends _$IncidentStateCopyWithImpl<$Res, _$EmptyImpl>
    implements _$$EmptyImplCopyWith<$Res> {
  __$$EmptyImplCopyWithImpl(
    _$EmptyImpl _value,
    $Res Function(_$EmptyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmptyImpl implements _Empty {
  const _$EmptyImpl();

  @override
  String toString() {
    return 'IncidentState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty implements IncidentState {
  const factory _Empty() = _$EmptyImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
    _$SuccessImpl value,
    $Res Function(_$SuccessImpl) then,
  ) = __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$IncidentStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
    _$SuccessImpl _value,
    $Res Function(_$SuccessImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'IncidentState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements IncidentState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$IncidentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'IncidentState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements IncidentState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatedImplCopyWith<$Res> {
  factory _$$UpdatedImplCopyWith(
    _$UpdatedImpl value,
    $Res Function(_$UpdatedImpl) then,
  ) = __$$UpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatedImplCopyWithImpl<$Res>
    extends _$IncidentStateCopyWithImpl<$Res, _$UpdatedImpl>
    implements _$$UpdatedImplCopyWith<$Res> {
  __$$UpdatedImplCopyWithImpl(
    _$UpdatedImpl _value,
    $Res Function(_$UpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IncidentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UpdatedImpl implements _Updated {
  const _$UpdatedImpl();

  @override
  String toString() {
    return 'IncidentState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<IncidentDto> incidents) loaded,
    required TResult Function() empty,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function() updated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<IncidentDto> incidents)? loaded,
    TResult? Function()? empty,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function()? updated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<IncidentDto> incidents)? loaded,
    TResult Function()? empty,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Empty value) empty,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_Updated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Empty value)? empty,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_Updated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Empty value)? empty,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_Updated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class _Updated implements IncidentState {
  const factory _Updated() = _$UpdatedImpl;
}
