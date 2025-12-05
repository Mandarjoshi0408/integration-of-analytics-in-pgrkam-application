import 'package:json_annotation/json_annotation.dart';

part 'dashboard_stats.g.dart';

@JsonSerializable()
class DashboardStats {
  @JsonKey(name: 'total_users')
  final int totalUsers;

  @JsonKey(name: 'total_jobs')
  final int totalJobs;

  @JsonKey(name: 'total_applicants')
  final int totalApplicants;

  @JsonKey(name: 'total_applications')
  final int totalApplications;

  @JsonKey(name: 'active_jobs')
  final int activeJobs;

  @JsonKey(name: 'avg_applications_per_job')
  final double avgApplicationsPerJob;

  @JsonKey(name: 'job_categories')
  final Map<String, int>? jobCategories;

  @JsonKey(name: 'top_skills')
  final Map<String, int>? topSkills;

  @JsonKey(name: 'application_by_status')
  final Map<String, int>? applicationByStatus;

  DashboardStats({
    required this.totalUsers,
    required this.totalJobs,
    required this.totalApplicants,
    required this.totalApplications,
    required this.activeJobs,
    required this.avgApplicationsPerJob,
    this.jobCategories,
    this.topSkills,
    this.applicationByStatus,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) =>
      _$DashboardStatsFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardStatsToJson(this);
}
