import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/reservation/reservation_http_repository.dart';
import 'package:mubwara/dto/response/reservation_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/page/reservation_management_page/model/reservation_model.dart';

final reservationController = Provider<ReservationController>((ref) {
  return ReservationController(ref);
});

class ReservationController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  ReservationController(this._ref);

  void ShopReservationList() async {
    _ref.read(shopReservationListModel.notifier).initViewModel();
  }

  Future<void> refresh() async {
    List<ReservationShopViewAllRespDto> reservaitonList =
    await _ref.read(reservationHttpRepository).ShopReservationList();
    _ref.read(shopReservationListModel.notifier).refresh(reservaitonList);
    return null;
  }
}