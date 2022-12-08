import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/customer/customer_http_repository.dart';
import 'package:mubwara/dto/request/customer_req_dto.dart';
import 'package:mubwara/dto/response/customer_resp_dto.dart';
import 'package:mubwara/main.dart';
import 'package:mubwara/views/component/model/review_list_model.dart';

final customerController = Provider<CustomerController>((ref) {
  return CustomerController(ref);
});

class CustomerController {
  final context = navigatorKey.currentContext!;
  final Ref _ref;
  CustomerController(this._ref);

  Future<void> joinCustomer(JoinCustomerReqDto joinCustomerReqDto) async {
    _ref.read(customerHttpRepository).joinCustomer(joinCustomerReqDto);
  }
}
