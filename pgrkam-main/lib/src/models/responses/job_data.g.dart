// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicantData _$ApplicantDataFromJson(Map<String, dynamic> json) =>
    ApplicantData(
      userId: json['userId'] as String,
      highestEducation: json['highest_education'] as String,
      gender: json['gender'] as String,
      agreement: json['agreement'] as bool? ?? false,
      location: json['constituency'] as String?,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ApplicantDataToJson(ApplicantData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'constituency': instance.location,
      'gender': instance.gender,
      'highest_education': instance.highestEducation,
      'agreement': instance.agreement,
      'skills': instance.skills,
    };

JobData _$JobDataFromJson(Map<String, dynamic> json) => JobData(
      industry:
          (json['industry'] as List<dynamic>).map((e) => e as String).toList(),
      jobId: json['_id'] as String,
      type: json['type'] as String,
      company_name: json['company_name'] as String,
      educational_qualification: json['educational_qualification'] as String?,
      experience: json['experience'] as String,
      gender: json['gender'] as String,
      job_description: json['job_description'] as String,
      max_age: json['max_age'] as int,
      location: json['location'] as String,
      salary: json['salary'] as String,
      no_of_vacancies: json['no_of_vacancies'] as int,
      post_date: json['post_date'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      job_title: json['job_title'] as String,
    );

Map<String, dynamic> _$JobDataToJson(JobData instance) => <String, dynamic>{
      '_id': instance.jobId,
      'company_name': instance.company_name,
      'educational_qualification': instance.educational_qualification,
      'experience': instance.experience,
      'job_description': instance.job_description,
      'post_date': instance.post_date,
      'skills': instance.skills,
      'no_of_vacancies': instance.no_of_vacancies,
      'max_age': instance.max_age,
      'gender': instance.gender,
      'location': instance.location,
      'salary': instance.salary,
      'type': instance.type,
      'job_title': instance.job_title,
      'industry': instance.industry,
    };
