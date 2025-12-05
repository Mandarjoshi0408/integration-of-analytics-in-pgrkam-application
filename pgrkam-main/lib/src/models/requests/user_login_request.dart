import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_login_request.g.dart';

@JsonSerializable()
class UserLoginRequest {
  String? email;
  String? password;

  UserLoginRequest({
    this.email,
    this.password,
  });
  Map<String, dynamic> toJson() => _$UserLoginRequestToJson(this);
}
