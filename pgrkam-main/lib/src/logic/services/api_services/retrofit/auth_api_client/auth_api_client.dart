import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pgrkam/src/models/responses/job_data.dart';
import 'package:pgrkam/src/models/responses/user_data.dart';

import '../../../../../models/requests/user_login_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@RestApi(baseUrl: 'https://pgrkam.onrender.com/api/v1')
abstract class AuthApiClient {
  factory AuthApiClient(
    Dio dio, {
    String baseUrl,
  }) = _AuthApiClient;

  @POST('/user/signin')
  Future signIn({
    @Body() required UserLoginRequest userLoginRequest,
  });
  @GET('/user/auth/me')
  Future fetchUserData({
    @Header('authorization') required String token,
  });
  @POST('/user/auth/verify_otp')
  Future verifyOtp({
    @Body() required UserLoginRequest userLoginRequest,
  });
  @GET('/applicant')
  Future fetchUsersData();
  @GET('/job')
  Future fetchJobsData();
  @GET('/user/recommend')
  Future fetchRecommendedJobs({
    @Header('authorization') required String token,
  });
  @GET('/user')
  Future fetchUsersList();
  @GET('/track/stats')
  Future fetchTrackData();
  @GET('/admin/dashboard/stats')
  Future fetchDashboardStats({
    @Header('authorization') required String token,
  });
  @POST('/user/signup')
  Future signUp({
    @Body() required UserData userLoginRequest,
  });
  @POST('/applicant')
  Future addApplicant({
    @Body() required ApplicantData userLoginRequest,
  });
}
