import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/dto/request/reservation_req_dto.dart';

import '../../dto/response/reservation_resp_dto.dart';

// 리턴 : Stream<List<Chat>>
final reservationStreamProvider =
    StreamProvider.autoDispose<List<ReservationAlarmRespDto>>((ref) {
  //ref.onDispose(() { });
  final db = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> stream =
      db.collection("alarm").snapshots();
  Stream<List<ReservationAlarmRespDto>> reservationAlarmRespDtoList =
      stream.map((snapshot) => snapshot.docs
          .map(
              (doc) => ReservationAlarmRespDto.fromJson(doc.data(), id: doc.id))
          .toList());
  reservationAlarmRespDtoList.map(
      (snapshot) => snapshot.where((doc) => doc.isCheck == false).toList());
  return reservationAlarmRespDtoList;
});

final countAlarm =
    StreamProvider.autoDispose<List<ReservationAlarmRespDto>>((ref) {
  //ref.onDispose(() { });
  final db = FirebaseFirestore.instance;
  Stream<QuerySnapshot<Map<String, dynamic>>> stream =
      db.collection("alarm").snapshots();
  Stream<List<ReservationAlarmRespDto>> reservationAlarmRespDtoList =
      stream.map((snapshot) => snapshot.docs
          .map(
              (doc) => ReservationAlarmRespDto.fromJson(doc.data(), id: doc.id))
          .toList());
  return reservationAlarmRespDtoList.map(
      (snapshot) => snapshot.where((doc) => doc.isCheck == false).toList());
});

final reservationFirestoreRepositoryProvider = Provider((ref) {
  return ReservationFirestoreRepository();
});

class ReservationFirestoreRepository {
  final db = FirebaseFirestore.instance;

  Future<DocumentReference> insert(
      ReservationAlarmReqDto reservationAlarmReqDto) {
    return db.collection("alarm").add(reservationAlarmReqDto.toJson());
  }

  Future<void> update(String id) async {
    print(id);
    db.collection("alarm").doc(id).update({
      'isCheck': true,
    });
  }
}
