import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';
//
// ResponseDto responseDtoFromJson(String str) =>
//     ResponseDto.fromJson(json.decode(str));
//
// String responseDtoToJson(ResponseDto data) => json.encode(data.toJson());
//
// class ResponseDto<T> {
//   String code;
//   String msg;
//   T data;
//
//   ResponseDto<T>({
//     this.code,
//     this.msg,
//     this.data,
//   });
//
//   factory ResponseDto.fromJson(Map<String, dynamic> json) =>
//       ResponseDto(code: json["code"], msg: json["msg"], data: json["data"]);
//
//   Map<String, dynamic> toJson() => {
//         "code": code,
//         "msg": msg,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }
