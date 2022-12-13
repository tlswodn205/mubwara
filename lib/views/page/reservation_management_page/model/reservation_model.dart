import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/reservation/reservation_http_repository.dart';
import 'package:mubwara/dto/response/reservation_resp_dto.dart';

final shopReservationListModel =
StateNotifierProvider<ShopReservationListModel, List<ReservationShopViewAllRespDto>>((ref) {
  return ShopReservationListModel([], ref)..initViewModel();
});

class ShopReservationListModel extends StateNotifier<List<ReservationShopViewAllRespDto>> {
  Ref _ref;
  ShopReservationListModel(super.state, this._ref);

  void initViewModel() async {
    List<ReservationShopViewAllRespDto> reservaitonList =
    await _ref.read(reservationHttpRepository).ShopReservationList();
    state = reservaitonList;
  }
  void refresh(List<ReservationShopViewAllRespDto> reservaitonList) {
    state = reservaitonList;
  }
}

