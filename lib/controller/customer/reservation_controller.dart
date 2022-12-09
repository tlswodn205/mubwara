import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/customer/customer_http_repository.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/component/model/reservation_list_model.dart';

final reservationController = Provider<ReservationController>((ref) {
  return ReservationController(ref);
});

class ReservationController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  ReservationController(this._ref);

  void myReviewList() async {
    _ref.read(reservationListModel.notifier).initViewModel();
  }

  Future<void> refresh() async {
    List<CustomerMyPageReservationRespDto> myReservationDtoList =
    await _ref.read(customerHttpRepository).myPageReservationList();
    print("밥소세지" + myReservationDtoList.toString());
    _ref.read(reservationListModel.notifier).refresh(myReservationDtoList);
    return null;
  }
}