import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/reservation/reservation_http_repository.dart';
import 'package:mubwara/dto/response/reservation_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/page/reservation_management_page/model/reservation_model.dart';

import '../dto/request/reservation_req_dto.dart';
import '../views/page/reservation_page/reservation_screen_model.dart';

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

  Future<void> reservationPerson(DateTime selectTime, int id) async {
    ReservationSelectReqDto reservationSelectReqDto = ReservationSelectReqDto(
        shopId: id,
        maxPeople: null,
        date: '${selectTime.year}${selectTime.month}${selectTime.day}');
    ReservationSelectRespDto reservationSelectRespDto = await _ref
        .read(reservationHttpRepository)
        .reservationPerson(reservationSelectReqDto);
    _ref
        .read(reservationScreenModel.notifier)
        .insertReservationPerson(reservationSelectRespDto);
    return null;
  }

  Future<void> reservationTime(
      DateTime selectTime, int id, int maxPeople) async {
    ReservationSelectReqDto reservationSelectReqDto = ReservationSelectReqDto(
        shopId: id,
        maxPeople: maxPeople,
        date: '${selectTime.year}${selectTime.month}${selectTime.day}');
    print("장날" + '${reservationSelectReqDto.shopId}');
    print('${reservationSelectReqDto.maxPeople}');
    print('${reservationSelectReqDto.date}');
    List<dynamic> timeList = await _ref
        .read(reservationHttpRepository)
        .reservationTime(reservationSelectReqDto);
    _ref.read(reservationScreenModel.notifier).insertReservationTime(timeList);
    return null;
  }

  Future<void> refresh() async {
    List<ReservationShopViewAllRespDto> reservaitonList =
        await _ref.read(reservationHttpRepository).ShopReservationList();
    _ref.read(shopReservationListModel.notifier).refresh(reservaitonList);
    return null;
  }

  Future<void> reservation(ReservationSaveReqDto reservationSaveReqDto) async {
    await _ref
        .read(reservationHttpRepository)
        .reservation(reservationSaveReqDto);
  }
}
