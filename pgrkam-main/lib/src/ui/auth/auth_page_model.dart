import 'package:pgrkam/src/logic/repositories/auth_repository/auth_repository.dart';
import 'package:pgrkam/src/logic/services/preference_services.dart';
import 'package:pgrkam/src/models/responses/api_response.dart';

import '/src/logic/services/api_services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_page_model.freezed.dart';

final authPageModelProvider =
    StateNotifierProvider.autoDispose<AuthPageModel, AuthPageState>(
  (ref) => AuthPageModel(
    apiService: ref.watch(apiServiceProvider),
    preferenceService: ref.read(preferenceServiceProvider),
    ref: ref,
  ),
);

class AuthPageModel extends StateNotifier<AuthPageState> {
  final ApiService apiService;
  final PreferenceService preferenceService;
  final AutoDisposeStateNotifierProviderRef ref;

  AuthPageModel({
    required this.apiService,
    required this.ref,
    required this.preferenceService,
  }) : super(const AuthPageState());

  setEmail(String value) => state = state.copyWith(
        mobile: value,
        status: AuthPageStatus.initial,
      );
  setPassword(String value) => state = state.copyWith(
        password: value,
        status: AuthPageStatus.initial,
      );
  setAuthScreenStatus(AuthScreen status) {
    state = state.copyWith(
      activeScreen: status,
      name: '',
      mobile: '',
      password: '',
      mobiles: 0,
      userType: UserType.employer,
    );
  }

  setMobile(int mobile) => state = state.copyWith(mobiles: mobile);
  setName(String name) => state = state.copyWith(name: name);
  setRole(UserType userType) => state = state.copyWith(userType: userType);

  Future<String> login() async {
    try {
      final res = await apiService.signIn(
          email: state.mobile, password: state.password);
      if (res.status != ApiStatus.success) {
        return res.errorMessage ?? 'Something Went Wrong';
      } else {
        await preferenceService.setString(
          PreferenceService.authToken,
          res.data!,
        );

        await ref.read(authRepositoryProvider.notifier).fetchUserDetails();
        return '';
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signIn(String? gender, String? education, String? district,
      List<String>? skills) async {
    try {
      if (state.name.trim().isEmpty) {
        return 'Please enter name';
      }
      if (state.mobile.trim().isEmpty) {
        return 'please enter email';
      }
      if (state.password.trim().isEmpty) {
        return 'please enter password';
      }
      if (state.mobiles == 0) {
        return 'please enter phone';
      }

      if (state.userType == UserType.employer) {
        if (gender == null || gender.trim().isEmpty) {
          return 'please enter gender';
        }
        if (education == null || education.trim().isEmpty) {
          return 'please enter eductaion';
        }
        if (district == null || district.trim().isEmpty) {
          return 'please enter district';
        }
        if (skills == null || skills.isEmpty) {
          return 'please enter skills';
        }
      }
      final res = await apiService.signUp(
          name: state.name,
          email: state.mobile,
          password: state.password,
          role: state.userType == UserType.applicant ? 'applicant' : 'employer',
          phone: 1223343435445);
      if (res.status != ApiStatus.success) {
        return res.errorMessage ?? 'Something Went Wrong';
      } else {
        if (mounted && state.userType != UserType.employer) {
          final res2 = await apiService.addApplicant(
              location: district!,
              userId: res.data!,
              education: education!,
              gender: gender!,
              skills: skills ?? []);
          if (res2.status != ApiStatus.success) {
            return 'Applicant Data Error';
          }
        }
      }
      return '';
    } catch (e) {
      return e.toString();
    }
  }

  setError(String? error) => state = state.copyWith(
        errorMessage: error,
        status: AuthPageStatus.error,
      );
}

@freezed
class AuthPageState with _$AuthPageState {
  const factory AuthPageState({
    @Default('') String mobile,
    @Default('') String password,
    @Default('') String name,
    @Default(0) int mobiles,
    @Default(UserType.applicant) UserType userType,
    @Default(AuthPageStatus.initial) AuthPageStatus status,
    // @Default(true) bool isTncAccepted,
    @Default(AuthScreen.signIn) AuthScreen activeScreen,
    String? errorMessage,
  }) = _AuthPageState;
}

enum AuthScreen {
  signIn,
  signUp,
}

enum AuthPageStatus {
  initial,
  processing,
  error,
}

enum UserType { employer, applicant }
