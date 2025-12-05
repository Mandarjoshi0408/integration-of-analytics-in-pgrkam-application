// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthPageState {
  String get mobile => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get mobiles => throw _privateConstructorUsedError;
  UserType get userType => throw _privateConstructorUsedError;
  AuthPageStatus get status =>
      throw _privateConstructorUsedError; // @Default(true) bool isTncAccepted,
  AuthScreen get activeScreen => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthPageStateCopyWith<AuthPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthPageStateCopyWith<$Res> {
  factory $AuthPageStateCopyWith(
          AuthPageState value, $Res Function(AuthPageState) then) =
      _$AuthPageStateCopyWithImpl<$Res, AuthPageState>;
  @useResult
  $Res call(
      {String mobile,
      String password,
      String name,
      int mobiles,
      UserType userType,
      AuthPageStatus status,
      AuthScreen activeScreen,
      String? errorMessage});
}

/// @nodoc
class _$AuthPageStateCopyWithImpl<$Res, $Val extends AuthPageState>
    implements $AuthPageStateCopyWith<$Res> {
  _$AuthPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobile = null,
    Object? password = null,
    Object? name = null,
    Object? mobiles = null,
    Object? userType = null,
    Object? status = null,
    Object? activeScreen = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobiles: null == mobiles
          ? _value.mobiles
          : mobiles // ignore: cast_nullable_to_non_nullable
              as int,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthPageStatus,
      activeScreen: null == activeScreen
          ? _value.activeScreen
          : activeScreen // ignore: cast_nullable_to_non_nullable
              as AuthScreen,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthPageStateImplCopyWith<$Res>
    implements $AuthPageStateCopyWith<$Res> {
  factory _$$AuthPageStateImplCopyWith(
          _$AuthPageStateImpl value, $Res Function(_$AuthPageStateImpl) then) =
      __$$AuthPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mobile,
      String password,
      String name,
      int mobiles,
      UserType userType,
      AuthPageStatus status,
      AuthScreen activeScreen,
      String? errorMessage});
}

/// @nodoc
class __$$AuthPageStateImplCopyWithImpl<$Res>
    extends _$AuthPageStateCopyWithImpl<$Res, _$AuthPageStateImpl>
    implements _$$AuthPageStateImplCopyWith<$Res> {
  __$$AuthPageStateImplCopyWithImpl(
      _$AuthPageStateImpl _value, $Res Function(_$AuthPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mobile = null,
    Object? password = null,
    Object? name = null,
    Object? mobiles = null,
    Object? userType = null,
    Object? status = null,
    Object? activeScreen = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthPageStateImpl(
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mobiles: null == mobiles
          ? _value.mobiles
          : mobiles // ignore: cast_nullable_to_non_nullable
              as int,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthPageStatus,
      activeScreen: null == activeScreen
          ? _value.activeScreen
          : activeScreen // ignore: cast_nullable_to_non_nullable
              as AuthScreen,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthPageStateImpl
    with DiagnosticableTreeMixin
    implements _AuthPageState {
  const _$AuthPageStateImpl(
      {this.mobile = '',
      this.password = '',
      this.name = '',
      this.mobiles = 0,
      this.userType = UserType.applicant,
      this.status = AuthPageStatus.initial,
      this.activeScreen = AuthScreen.signIn,
      this.errorMessage});

  @override
  @JsonKey()
  final String mobile;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int mobiles;
  @override
  @JsonKey()
  final UserType userType;
  @override
  @JsonKey()
  final AuthPageStatus status;
// @Default(true) bool isTncAccepted,
  @override
  @JsonKey()
  final AuthScreen activeScreen;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthPageState(mobile: $mobile, password: $password, name: $name, mobiles: $mobiles, userType: $userType, status: $status, activeScreen: $activeScreen, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthPageState'))
      ..add(DiagnosticsProperty('mobile', mobile))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('mobiles', mobiles))
      ..add(DiagnosticsProperty('userType', userType))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('activeScreen', activeScreen))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthPageStateImpl &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.mobiles, mobiles) || other.mobiles == mobiles) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activeScreen, activeScreen) ||
                other.activeScreen == activeScreen) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobile, password, name, mobiles,
      userType, status, activeScreen, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthPageStateImplCopyWith<_$AuthPageStateImpl> get copyWith =>
      __$$AuthPageStateImplCopyWithImpl<_$AuthPageStateImpl>(this, _$identity);
}

abstract class _AuthPageState implements AuthPageState {
  const factory _AuthPageState(
      {final String mobile,
      final String password,
      final String name,
      final int mobiles,
      final UserType userType,
      final AuthPageStatus status,
      final AuthScreen activeScreen,
      final String? errorMessage}) = _$AuthPageStateImpl;

  @override
  String get mobile;
  @override
  String get password;
  @override
  String get name;
  @override
  int get mobiles;
  @override
  UserType get userType;
  @override
  AuthPageStatus get status;
  @override // @Default(true) bool isTncAccepted,
  AuthScreen get activeScreen;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthPageStateImplCopyWith<_$AuthPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
