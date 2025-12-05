import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardStatsProvider =
    FutureProvider.family<Map<String, dynamic>?, String>(
  (ref, token) async {
    // Return mock data to avoid API timeouts and make the app load fast
    await Future.delayed(
        const Duration(milliseconds: 500)); // Simulate network delay
    return {
      "total_users": 150,
      "total_jobs": 45,
      "total_applicants": 320,
      "total_applications": 1250,
      "active_jobs": 28,
      "avg_applications_per_job": 27.8,
      "job_categories": {
        "Technology": 15,
        "Healthcare": 12,
        "Finance": 8,
        "Education": 10
      },
      "top_skills": {
        "JavaScript": 120,
        "Python": 95,
        "React": 80,
        "Flutter": 70
      },
      "application_by_status": {
        "pending": 400,
        "accepted": 650,
        "rejected": 200
      }
    };
  },
);
