import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/customer/customer_http_repository.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';

final reservationListModel = StateNotifierProvider<ReservationListModel,
    List<CustomerMyPageReservationRespDto>>((ref) {
  return ReservationListModel([], ref)..initViewModel();
});

class ReservationListModel
    extends StateNotifier<List<CustomerMyPageReservationRespDto>> {
  Ref _ref;
  ReservationListModel(super.state, this._ref);

  void initViewModel() async {
    List<CustomerMyPageReservationRespDto> mypageReservationDtoList =
        await _ref.read(customerHttpRepository).myPageReservationList();
    state = mypageReservationDtoList;
  }

  //
  void refresh(
      List<CustomerMyPageReservationRespDto> mypageReservationDtoList) {
    state = mypageReservationDtoList;
  }
}
