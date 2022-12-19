import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mubwara/dto/request/option_req_dto.dart';
import 'package:mubwara/dto/request/user_req_dto.dart';
import 'package:mubwara/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../dto/response/option_resp_dto.dart';
import '../../dto/response/response_dto.dart';
import '../../views/page/login_page/login_page_model.dart';
import '../http_connector.dart';
import 'package:http/http.dart';

final optionHttpRepository = Provider<OptionHttpRepository>((ref) {
  return OptionHttpRepository(ref);
});

class OptionHttpRepository {
  Ref _ref;
  OptionHttpRepository(this._ref);

  void optionSave(List<int> checkList) {
    String body = jsonEncode(checkList);
    print(body);
    _ref.read(httpConnector).post("/shop/option", body);
  }

  Future<List<OptionListRespDto>> optionList() async {
    Response response = await _ref.read(httpConnector).get("/shop/option");
    ResponseDto responseDto = ResponseDto.fromJson(jsonDecode(response.body));
    List<dynamic> dataList = responseDto.data;
    List<OptionListRespDto> optionListRespDtoList =
    dataList.map((x) => OptionListRespDto.fromJson(x)).toList();
    return optionListRespDtoList;
  }
}
