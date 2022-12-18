import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/shop_controller.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

import 'package:mubwara/dto/request/shop_req_dto.dart';


final weekAnalysis =
StateNotifierProvider<SearchPageModel, List<AnalysisWeekRespDto>>((ref) {
  return SearchPageModel([], ref)..initViewModel();
});

class SearchPageModel extends StateNotifier<List<AnalysisWeekRespDto>> {
  Ref _ref;
  SearchPageModel(super.state, this._ref);

  Future<void> initViewModel() async {
    AnalysisWeekReqDto analysisWeekReqDto = new AnalysisWeekReqDto( date: "${DateTime.now().year}${DateTime.now().month}${DateTime.now().day}");
    print("장날"+ analysisWeekReqDto.date);
    List<AnalysisWeekRespDto> analysisWeekRespDtoList = await _ref.read(shopController).weekAnalysis(analysisWeekReqDto);
    print("장날"+ analysisWeekRespDtoList.length.toString());
    state = analysisWeekRespDtoList;
  }
}