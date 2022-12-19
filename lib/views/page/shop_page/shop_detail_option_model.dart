import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/option_controller.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/option_resp_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

import 'package:mubwara/dto/response/option_resp_dto.dart';

final shopDetailPageOptionModel =
StateNotifierProvider<ShopDetailPageOptionModel, List<OptionListRespDto>>(
        (ref) {
      return ShopDetailPageOptionModel([], ref)..initViewModel();
    });

class ShopDetailPageOptionModel extends StateNotifier<List<OptionListRespDto>> {
  Ref _ref;

  ShopDetailPageOptionModel(super.state, this._ref);

  void initViewModel() async {
    List<OptionListRespDto> optionRespDtoList =
    await _ref.read(optionController).optionList();
    state = optionRespDtoList;
    if(state.isEmpty){
      state = [];
    }
  }
}
