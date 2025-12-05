import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pgrkam/src/models/responses/job_data.dart';

import '../../../models/responses/responses.dart';
import '../../../models/responses/dashboard_stats.dart';
import 'api_service_impl.dart';

final apiServiceProvider = Provider<ApiService>(
  (ref) => ApiServiceImpl(),
);

abstract class ApiService {
  Future<ApiResponse<String>> signIn({
    required String email,
    required String password,
  });
  Future<ApiResponse<String>> verifyOtp({
    required String phone,
    required int code,
  });
  Future<ApiResponse<UserData>> fetchUserDetails({
    required String authToken,
  });
  Future<ApiResponse<List<ApplicantData>>> fetchUsersDetails();
  Future<ApiResponse<List<JobData>>> fetchJobsDetails();
  Future<ApiResponse<List<UserData>>> fetchUserList();
  Future<ApiResponse<List<Map<JobData, String>>>> fetchRecommendedJobsDetails({
    required String authToken,
  });
  Future<ApiResponse<Map<String, dynamic>>> fetchTrackData();
  Future<ApiResponse<String>> signUp({
    required String name,
    required String email,
    required String password,
    required String role,
    required int phone,
  });
  Future<ApiResponse<String>> addApplicant({
    required String location,
    required String userId,
    required String education,
    required String gender,
    required List<String> skills,
  });
  Future<ApiResponse<Map<String, dynamic>>> fetchDashboardStats({
    required String authToken,
  });
}
