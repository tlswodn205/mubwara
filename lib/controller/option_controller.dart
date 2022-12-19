import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/option/option_http_repository.dart';
import 'package:mubwara/dto/request/option_req_dto.dart';
import 'package:mubwara/dto/response/option_resp_dto.dart';

import '../main.dart';

final optionController = Provider<OptionController>((ref) {
  return OptionController(ref);
});

class OptionController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  OptionController(this._ref);

  void optionSave(List<int> checkList) {
    _ref.read(optionHttpRepository).optionSave(checkList);
  }

  Future<List<OptionListRespDto>> optionList(){
    return _ref.read(optionHttpRepository).optionList();
  }
}
