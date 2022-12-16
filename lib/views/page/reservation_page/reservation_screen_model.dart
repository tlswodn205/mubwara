import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';

import '../../../dto/request/reservation_req_dto.dart';
import '../../../dto/response/reservation_resp_dto.dart';

final reservationScreenModel =
    StateNotifierProvider<ReservationScreenModel, ReservationDmo>((ref) {
  return ReservationScreenModel(ReservationDmo(), ref)..initViewModel();
});

class ReservationScreenModel extends StateNotifier<ReservationDmo> {
  Ref _ref;

  ReservationScreenModel(super.state, this._ref);

  void insertReservationPerson(
      ReservationSelectRespDto reservationSelectRespDto) {
    state.reservationPerson = reservationSelectRespDto.maxPeopleList;
  }

  void insertReservationTime(List<dynamic> timeList) {
    state.reservationTime = timeList;
    print(timeList.length);
  }

  void initViewModel() {
    state.reservationPerson = [];
    state.reservationTime = [];
  }
}

class ReservationDmo {
  late List<dynamic> reservationPerson;
  late List<dynamic> reservationTime;

  ReservationDmo();
}
