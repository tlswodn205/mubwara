class LoginRespDto {
  String username;
  String role;

  LoginRespDto({required this.username, required this.role});

  factory LoginRespDto.fromJson(Map<String, dynamic> json) => LoginRespDto(
        username: json["username"],
        role: json["role"],
      );
}
