// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardStats _$DashboardStatsFromJson(Map<String, dynamic> json) =>
    DashboardStats(
      totalUsers: json['total_users'] as int,
      totalJobs: json['total_jobs'] as int,
      totalApplicants: json['total_applicants'] as int,
      totalApplications: json['total_applications'] as int,
      activeJobs: json['active_jobs'] as int,
      avgApplicationsPerJob:
          (json['avg_applications_per_job'] as num).toDouble(),
      jobCategories: json['job_categories'] as Map<String, int>?,
      topSkills: json['top_skills'] as Map<String, int>?,
      applicationByStatus: json['application_by_status'] as Map<String, int>?,
    );

Map<String, dynamic> _$DashboardStatsToJson(DashboardStats instance) =>
    <String, dynamic>{
      'total_users': instance.totalUsers,
      'total_jobs': instance.totalJobs,
      'total_applicants': instance.totalApplicants,
      'total_applications': instance.totalApplications,
      'active_jobs': instance.activeJobs,
      'avg_applications_per_job': instance.avgApplicationsPerJob,
      'job_categories': instance.jobCategories,
      'top_skills': instance.topSkills,
      'application_by_status': instance.applicationByStatus,
    };
