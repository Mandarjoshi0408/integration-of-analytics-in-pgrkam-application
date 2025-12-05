// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_repository.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  UserData? get authUser => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  List<ApplicantData>? get applicantData => throw _privateConstructorUsedError;
  List<JobData>? get jobData => throw _privateConstructorUsedError;
  List<UserData>? get users => throw _privateConstructorUsedError;
  List<Map<JobData, String>>? get recommmendedJobs =>
      throw _privateConstructorUsedError;
  AuthStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {UserData? authUser,
      String? idToken,
      List<ApplicantData>? applicantData,
      List<JobData>? jobData,
      List<UserData>? users,
      List<Map<JobData, String>>? recommmendedJobs,
      AuthStatus status});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = freezed,
    Object? idToken = freezed,
    Object? applicantData = freezed,
    Object? jobData = freezed,
    Object? users = freezed,
    Object? recommmendedJobs = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      authUser: freezed == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      applicantData: freezed == applicantData
          ? _value.applicantData
          : applicantData // ignore: cast_nullable_to_non_nullable
              as List<ApplicantData>?,
      jobData: freezed == jobData
          ? _value.jobData
          : jobData // ignore: cast_nullable_to_non_nullable
              as List<JobData>?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      recommmendedJobs: freezed == recommmendedJobs
          ? _value.recommmendedJobs
          : recommmendedJobs // ignore: cast_nullable_to_non_nullable
              as List<Map<JobData, String>>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserData? authUser,
      String? idToken,
      List<ApplicantData>? applicantData,
      List<JobData>? jobData,
      List<UserData>? users,
      List<Map<JobData, String>>? recommmendedJobs,
      AuthStatus status});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authUser = freezed,
    Object? idToken = freezed,
    Object? applicantData = freezed,
    Object? jobData = freezed,
    Object? users = freezed,
    Object? recommmendedJobs = freezed,
    Object? status = null,
  }) {
    return _then(_$AuthStateImpl(
      authUser: freezed == authUser
          ? _value.authUser
          : authUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      applicantData: freezed == applicantData
          ? _value._applicantData
          : applicantData // ignore: cast_nullable_to_non_nullable
              as List<ApplicantData>?,
      jobData: freezed == jobData
          ? _value._jobData
          : jobData // ignore: cast_nullable_to_non_nullable
              as List<JobData>?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserData>?,
      recommmendedJobs: freezed == recommmendedJobs
          ? _value._recommmendedJobs
          : recommmendedJobs // ignore: cast_nullable_to_non_nullable
              as List<Map<JobData, String>>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl with DiagnosticableTreeMixin implements _AuthState {
  const _$AuthStateImpl(
      {this.authUser = null,
      this.idToken = null,
      final List<ApplicantData>? applicantData = null,
      final List<JobData>? jobData = null,
      final List<UserData>? users = null,
      final List<Map<JobData, String>>? recommmendedJobs = null,
      this.status = AuthStatus.initial})
      : _applicantData = applicantData,
        _jobData = jobData,
        _users = users,
        _recommmendedJobs = recommmendedJobs;

  @override
  @JsonKey()
  final UserData? authUser;
  @override
  @JsonKey()
  final String? idToken;
  final List<ApplicantData>? _applicantData;
  @override
  @JsonKey()
  List<ApplicantData>? get applicantData {
    final value = _applicantData;
    if (value == null) return null;
    if (_applicantData is EqualUnmodifiableListView) return _applicantData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<JobData>? _jobData;
  @override
  @JsonKey()
  List<JobData>? get jobData {
    final value = _jobData;
    if (value == null) return null;
    if (_jobData is EqualUnmodifiableListView) return _jobData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserData>? _users;
  @override
  @JsonKey()
  List<UserData>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Map<JobData, String>>? _recommmendedJobs;
  @override
  @JsonKey()
  List<Map<JobData, String>>? get recommmendedJobs {
    final value = _recommmendedJobs;
    if (value == null) return null;
    if (_recommmendedJobs is EqualUnmodifiableListView)
      return _recommmendedJobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final AuthStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(authUser: $authUser, idToken: $idToken, applicantData: $applicantData, jobData: $jobData, users: $users, recommmendedJobs: $recommmendedJobs, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('authUser', authUser))
      ..add(DiagnosticsProperty('idToken', idToken))
      ..add(DiagnosticsProperty('applicantData', applicantData))
      ..add(DiagnosticsProperty('jobData', jobData))
      ..add(DiagnosticsProperty('users', users))
      ..add(DiagnosticsProperty('recommmendedJobs', recommmendedJobs))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.authUser, authUser) ||
                other.authUser == authUser) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            const DeepCollectionEquality()
                .equals(other._applicantData, _applicantData) &&
            const DeepCollectionEquality().equals(other._jobData, _jobData) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality()
                .equals(other._recommmendedJobs, _recommmendedJobs) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      authUser,
      idToken,
      const DeepCollectionEquality().hash(_applicantData),
      const DeepCollectionEquality().hash(_jobData),
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_recommmendedJobs),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final UserData? authUser,
      final String? idToken,
      final List<ApplicantData>? applicantData,
      final List<JobData>? jobData,
      final List<UserData>? users,
      final List<Map<JobData, String>>? recommmendedJobs,
      final AuthStatus status}) = _$AuthStateImpl;

  @override
  UserData? get authUser;
  @override
  String? get idToken;
  @override
  List<ApplicantData>? get applicantData;
  @override
  List<JobData>? get jobData;
  @override
  List<UserData>? get users;
  @override
  List<Map<JobData, String>>? get recommmendedJobs;
  @override
  AuthStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
