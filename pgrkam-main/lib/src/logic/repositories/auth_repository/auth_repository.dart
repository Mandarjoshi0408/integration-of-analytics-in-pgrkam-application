import 'dart:async';

import 'package:pgrkam/src/models/responses/job_data.dart';

import '../../../models/responses/api_response.dart';
import '../../../models/responses/user_data.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/api_services/api_service.dart';

import '../../services/preference_services.dart';

part 'auth_repository.freezed.dart';

final authRepositoryProvider = StateNotifierProvider<AuthRepository, AuthState>(
  (ref) => AuthRepository(
    apiService: ref.read(apiServiceProvider),
    preferenceService: ref.read(preferenceServiceProvider),
    ref: ref,
  ),
);

class AuthRepository extends StateNotifier<AuthState> {
  final ApiService apiService;
  late final StreamSubscription _subscription;
  final PreferenceService preferenceService;
  final StateNotifierProviderRef ref;

  AuthRepository({
    required this.apiService,
    required this.preferenceService,
    required this.ref,
  }) : super(const AuthState()) {
    // fetchUserDetails();
    // state = state.copyWith(
    //   status: AuthStatus.unauthenticated,
    // );
    fetchUserDetails();
    fetchUsersDetails();
    fetchJobsDetails();
  }

  fetchUserDetails() async {
    final authToken = preferenceService.getString(
      PreferenceService.authToken,
    );
    state = state.copyWith(
      status: AuthStatus.initial,
    );
    if (authToken != null) {
      debugPrint(authToken);
      final response = await apiService.fetchUserDetails(
        authToken: authToken,
      );

      if (response.status == ApiStatus.success) {
        state = state.copyWith(
          idToken: authToken,
          authUser: response.data,
        );
        if (state.authUser != null && state.authUser!.role == 'applicant') {
          fetchRecommendedJobsDetails();
        } else {
          state = state.copyWith(
            status: AuthStatus.unauthenticated,
          );
        }
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
        );
      }
    } else {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
      );
    }
  }

  fetchUsersDetails() async {
    // final authToken = preferenceService.getString(
    //   PreferenceService.authToken,
    // );
    // state = state.copyWith(
    //   status: AuthStatus.initial,
    // );
    // if (authToken != null) {
    //   debugPrint(authToken);
    final response = await apiService.fetchUsersDetails(
        // authToken: authToken,
        );

    if (response.status == ApiStatus.success) {
      state = state.copyWith(
        // status: AuthStatus.authenticated,
        // idToken: authToken,
        applicantData: response.data,
      );

      // fetchJobsDetails();
    } else {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
      );
    }
  }

  fetchRecommendedJobsDetails() async {
    final authToken = preferenceService.getString(
      PreferenceService.authToken,
    );

    if (authToken != null) {
      debugPrint(authToken);
      final response = await apiService.fetchRecommendedJobsDetails(
        authToken: authToken,
      );
      print('object2');

      if (response.status == ApiStatus.success) {
        state = state.copyWith(
          status: AuthStatus.authenticated,
          // idToken: authToken,
          recommmendedJobs: response.data,
        );
        // fetchJobsDetails();
      } else {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
        );
      }
    }
  }

  fetchJobsDetails() async {
    // final authToken = preferenceService.getString(
    //   PreferenceService.authToken,
    // );
    // state = state.copyWith(
    //   status: AuthStatus.initial,
    // );
    // if (authToken != null) {
    //   debugPrint(authToken);
    final response = await apiService.fetchJobsDetails(
        // authToken: authToken,
        );

    if (response.status == ApiStatus.success) {
      state = state.copyWith(
        // status: AuthStatus.authenticated,
        // idToken: authToken,
        jobData: response.data,
      );
      fetchUserList();
    } else {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
      );
    }
    // }
  }

  fetchUserList() async {
    // final authToken = preferenceService.getString(
    //   PreferenceService.authToken,
    // );
    // state = state.copyWith(
    //   status: AuthStatus.initial,
    // );
    // if (authToken != null) {
    //   debugPrint(authToken);
    final response = await apiService.fetchUserList(
        // authToken: authToken,
        );

    if (response.status == ApiStatus.success) {
      state = state.copyWith(
        // status: AuthStatus.authenticated,
        // idToken: authToken,
        users: response.data,
      );
    } else {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
      );
    }
    // }
  }

  signOut() {
    preferenceService.clear(PreferenceService.authToken);
    state = state.copyWith(
      status: AuthStatus.unauthenticated,
      authUser: null,
      recommmendedJobs: null,
      idToken: null,
    );
  }

  setInternetConnectedStatus() {
    state = state.copyWith(
      status: state.idToken != null
          ? AuthStatus.authenticated
          : AuthStatus.unauthenticated,
    );
  }

  changeState(AuthStatus authStatus) {
    state = state.copyWith(status: authStatus);
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(null) UserData? authUser,
    @Default(null) String? idToken,
    @Default(null) List<ApplicantData>? applicantData,
    @Default(null) List<JobData>? jobData,
    @Default(null) List<UserData>? users,
    @Default(null) List<Map<JobData, String>>? recommmendedJobs,
    @Default(AuthStatus.initial) AuthStatus status,
  }) = _AuthState;
}

enum AuthStatus {
  initial,
  unauthenticated,
  authenticated,
  noInternet,
}
