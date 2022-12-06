class LoginRespDto {
  String username;
  String password;

  LoginRespDto({required this.username, required this.password});

  factory LoginRespDto.fromJson(Map<String, dynamic> json) => LoginRespDto(
        username: json["username"],
        password: json["password"],
      );
}
