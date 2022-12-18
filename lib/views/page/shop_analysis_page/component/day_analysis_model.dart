import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/shop_controller.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/request/shop_req_dto.dart';
import 'package:mubwara/dto/response/board_resp_dto.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

final dayAnalysis =
StateNotifierProvider<SearchPageModel, List<AnalysisDateRespDto>>((ref) {
  return SearchPageModel([], ref)..initViewModel();
});

class SearchPageModel extends StateNotifier<List<AnalysisDateRespDto>> {
  Ref _ref;
  SearchPageModel(super.state, this._ref);

  Future<void> initViewModel() async {
    AnalysisDateReqDto analysisDateReqDto = new AnalysisDateReqDto(date: "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}");
    print("장날"+ analysisDateReqDto.date);
    List<AnalysisDateRespDto> analysisDateRespDtoList = await _ref.read(shopController).dayAnalysis(analysisDateReqDto);
    print("장날"+ analysisDateRespDtoList.length.toString());
    state = analysisDateRespDtoList;
  }
}