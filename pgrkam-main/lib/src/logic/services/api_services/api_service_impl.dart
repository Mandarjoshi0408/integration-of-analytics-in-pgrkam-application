// 📦 Package imports:

// 🌎 Project imports:

import 'package:pgrkam/src/models/responses/job_data.dart';

import '../../../models/responses/responses.dart';
import '/src/utils/network_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/requests/user_login_request.dart';
import 'api_service.dart';

import 'retrofit/auth_api_client/auth_api_client.dart';

class ApiServiceImpl extends ApiService {
  late final AuthApiClient _authApiClient;

  late final Dio dio;

  ApiServiceImpl() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 20000),
      ),
    );

    _authApiClient = AuthApiClient(dio);
  }

  @override
  Future<ApiResponse<String>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authApiClient.signIn(
        userLoginRequest: UserLoginRequest(
          email: email,
          password: password,
        ),
      ) as Map<String, dynamic>;
      if (response['success'] == true) {
        return ApiResponse.success(response['data']);
      } else {
        throw (response['error'] as Map)['explanation'] ??
            'Something Went Wrong';
      }
    } catch (e) {
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<String>.noInternet();
      }
      return ApiResponse<String>.error(e.toString());
    }
  }

  @override
  Future<ApiResponse<String>> verifyOtp({
    required String phone,
    required int code,
  }) async {
    try {
      final response = await _authApiClient.verifyOtp(
        userLoginRequest: UserLoginRequest(
          email: '',
          password: '',
        ),
      );
      return ApiResponse<String>.success(
        response.toString(),
      );
    } catch (e) {
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<String>.noInternet();
      }
      return ApiResponse<String>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<UserData>> fetchUserDetails({
    required String authToken,
  }) async {
    try {
      final response = await _authApiClient.fetchUserData(
        token: authToken,
      ) as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success(UserData.fromJson(response['data']));
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<UserData>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<UserData>.noInternet();
      }
      return ApiResponse<UserData>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<List<ApplicantData>>> fetchUsersDetails() async {
    try {
      final response =
          await _authApiClient.fetchUsersData() as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success((response['data'] as List)
            .map((e) => ApplicantData.fromJson(e))
            .toList());
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<List<ApplicantData>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<List<ApplicantData>>.noInternet();
      }
      return ApiResponse<List<ApplicantData>>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<List<JobData>>> fetchJobsDetails() async {
    try {
      final response =
          await _authApiClient.fetchJobsData() as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success((response['data'] as List)
            .map((e) => JobData.fromJson(e))
            .toList());
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<List<JobData>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<List<JobData>>.noInternet();
      }
      return ApiResponse<List<JobData>>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<List<UserData>>> fetchUserList() async {
    try {
      final response =
          await _authApiClient.fetchUsersList() as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success((response['data'] as List)
            .map((e) => UserData.fromJson(e))
            .toList());
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<List<UserData>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<List<UserData>>.noInternet();
      }
      return ApiResponse<List<UserData>>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<List<Map<JobData, String>>>> fetchRecommendedJobsDetails({
    required String authToken,
  }) async {
    try {
      final response = await _authApiClient.fetchRecommendedJobs(
        token: authToken,
      ) as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success((response['data'] as List)
            .map((e) => {
                  JobData.fromJson(e['job']): e['success_rate'].toString(),
                })
            .toList());
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<List<Map<JobData, String>>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<List<Map<JobData, String>>>.noInternet();
      }
      return ApiResponse<List<Map<JobData, String>>>.error(
          'Something went wrong');
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> fetchTrackData() async {
    try {
      final response =
          await _authApiClient.fetchTrackData() as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success((response['data']));
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<Map<String, dynamic>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<Map<String, dynamic>>.noInternet();
      }
      return ApiResponse<Map<String, dynamic>>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<String>> signUp({
    required String name,
    required String email,
    required String password,
    required String role,
    required int phone,
  }) async {
    try {
      final response = await _authApiClient.signUp(
          userLoginRequest: UserData(
              userId: '',
              userName: name,
              password: password,
              role: role,
              phone: phone,
              email: email)) as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success(((response['data'] as Map)['_id']));
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<String>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<String>.noInternet();
      }
      return ApiResponse<String>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<String>> addApplicant({
    required String location,
    required String userId,
    required String education,
    required String gender,
    required List<String> skills,
  }) async {
    try {
      final response = await _authApiClient.addApplicant(
          userLoginRequest: ApplicantData(
              userId: userId,
              highestEducation: education,
              gender: gender,
              agreement: false,
              location: location,
              skills: skills)) as Map<String, dynamic>;

      if (response['message'].toString().toLowerCase().trim() ==
          'Successfully completed the request'.toLowerCase()) {
        return ApiResponse.success(((response['data'] as Map)['_id']));
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<String>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<String>.noInternet();
      }
      return ApiResponse<String>.error('Something went wrong');
    }
  }

  @override
  Future<ApiResponse<Map<String, dynamic>>> fetchDashboardStats({
    required String authToken,
  }) async {
    try {
      final response = await _authApiClient.fetchDashboardStats(
        token: authToken,
      ) as Map<String, dynamic>;

      if (response['success'] == true) {
        return ApiResponse.success(response['data'] ?? response);
      } else {
        return ApiResponse.error('Something Went Wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      if (e.runtimeType == DioError &&
          (e as DioError).type == DioErrorType.badResponse &&
          e.response?.statusCode == 401) {
        return ApiResponse<Map<String, dynamic>>.authError();
      }
      final hasInternet = await hasInternetAccess();
      if (hasInternet != true) {
        return ApiResponse<Map<String, dynamic>>.noInternet();
      }
      return ApiResponse<Map<String, dynamic>>.error('Something went wrong');
    }
  }
}
