import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_data.g.dart';

@JsonSerializable()
class ApplicantData {
  // @JsonKey(name: 'u')
  final String userId;
  @JsonKey(name: 'constituency')
  final String? location;
  final String gender;
  @JsonKey(name: 'highest_education')
  final String highestEducation;
  final bool agreement;
  final List<String> skills;

  ApplicantData({
    required this.userId,
    required this.highestEducation,
    required this.gender,
    this.agreement = false,
    this.location,
    required this.skills,
  });

  factory ApplicantData.fromJson(Map<String, dynamic> json) =>
      _$ApplicantDataFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicantDataToJson(this);
}

@JsonSerializable()
class JobData {
  @JsonKey(name: '_id')
  final String jobId;
  final String company_name;
  final String? educational_qualification;
  final String experience;
  final String job_description;
  final String post_date;
  final List<String> skills;
  final int no_of_vacancies;
  final int max_age;
  final String gender;
  final String location;
  final String salary;
  final String type;
  final String job_title;

  final List<String> industry;

  JobData({
    required this.industry,
    required this.jobId,
    required this.type,
    required this.company_name,
    this.educational_qualification,
    required this.experience,
    required this.gender,
    required this.job_description,
    required this.max_age,
    required this.location,
    required this.salary,
    required this.no_of_vacancies,
    required this.post_date,
    required this.skills,
    required this.job_title,
  });

  factory JobData.fromJson(Map<String, dynamic> json) =>
      _$JobDataFromJson(json);
}
