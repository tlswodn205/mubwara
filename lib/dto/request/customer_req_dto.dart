class JoinCustomerReqDto {
  String? username;
  String? password;
  String? name;
  String? address;
  String? phoneNumber;

  JoinCustomerReqDto.origin();

  JoinCustomerReqDto(
      this.username, this.password, this.name, this.address, this.phoneNumber);

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "name": name,
        "address": address,
        "phoneNumber": phoneNumber,
      };
}
