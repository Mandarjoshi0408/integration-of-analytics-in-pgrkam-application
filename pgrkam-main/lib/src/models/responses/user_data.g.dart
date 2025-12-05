// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      userId: json['_id'] as String,
      userName: json['name'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      phone: json['phone'] as int?,
      email: json['email'] as String,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      '_id': instance.userId,
      'name': instance.userName,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'updatedAt': instance.updatedAt,
      'phone': instance.phone,
    };
