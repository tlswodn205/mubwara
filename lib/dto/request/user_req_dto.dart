class LoginReqDto {
  String? username;
  String? password;

  LoginReqDto.origin();

  LoginReqDto({required this.username, required this.password});

  void setUsername(String Text) {
    this.username = Text;
  }

  void setPassword(String Text) {
    this.password = Text;
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
