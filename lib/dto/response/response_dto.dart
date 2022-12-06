import 'dart:convert';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

class ResponseDto<T> {
  String code;
  String msg;
  T data;

  ResponseDto({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory ResponseDto.fromJson(Map<String, dynamic> json) => ResponseDto(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );
}
