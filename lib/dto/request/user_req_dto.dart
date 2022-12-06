class LoginReqDto {
  String username;
  String password;

  LoginReqDto({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
