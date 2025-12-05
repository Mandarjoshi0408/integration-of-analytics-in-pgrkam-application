import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String userId;
  @JsonKey(name: 'name')
  final String userName;

  final String email;

  final String password;
  @JsonKey(name: 'role')
  final String role;
  final String? updatedAt;
  final int? phone;

  UserData({
    required this.userId,
    required this.userName,
    required this.password,
    required this.role,
    this.phone,
    required this.email,
    this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

enum UserRole {
  admin,
  applicant,
  employer,
}
