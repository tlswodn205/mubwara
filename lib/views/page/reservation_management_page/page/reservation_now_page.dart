import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/controller/reservation_controller.dart';
import 'package:mubwara/dto/response/reservation_resp_dto.dart';
import 'package:mubwara/views/layout/default_layout.dart';
import 'package:mubwara/views/page/reservation_management_page/component/ordercard.dart';
import 'package:mubwara/views/page/reservation_management_page/model/reservation_model.dart';

class ReservationNowPage extends ConsumerStatefulWidget {
  const ReservationNowPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReservationNowPage> createState() => _ReservationNowPageState();
}

class _ReservationNowPageState extends ConsumerState<ReservationNowPage> {
  @override
  Widget build(BuildContext context) {
    final mr = ref.watch(shopReservationListModel);
    final mc = ref.read(reservationController);
    return DefaultLayout(
      title: '예약 리스트',
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => mc.refresh(),
          child: ListView.builder(
            itemCount: mr.length,
            itemBuilder: (context, index){
              return _buildReservation(index, mr, mc);
            },
          ),
        )
      ),
    );
  }
  Widget _buildReservation(int ListIndex, List<ReservationShopViewAllRespDto> mr, ReservationController mc){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: OrderCard(
        reservation_date: '${mr[ListIndex].reservationDate}',
        image: Image.asset(
          'assets/images/review/profile.jpg',
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        ),
        reservation_time: '${mr[ListIndex].reservationTime}',
        personal: '${mr[ListIndex].shopTableDto.maxPeople}',
        customer_name: '${mr[ListIndex].customerDto.name}',
        phone_number: '${mr[ListIndex].customerDto.phoneNumber}',
      ),
    );
  }
}
