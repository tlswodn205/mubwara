import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/shop/shop_http_repository.dart';
import 'package:mubwara/dto/response/shop_resp_dto.dart';
import 'package:mubwara/dto/response/user_resp_dto.dart';

final loginPageModel =
    StateNotifierProvider<LoginPageModel, LoginRespDto>((ref) {
  return LoginPageModel(LoginRespDto(username: "cos", password: "123"), ref)
    ..initViewModel();
});

class LoginPageModel extends StateNotifier<LoginRespDto> {
  Ref _ref;
  LoginPageModel(super.state, this._ref);

  void initViewModel() async {}

  void login(String data) async {
    state.username = data;
  }
//
// void refresh(List<Product> productsDto) {
//   state = productsDto;
// }
//
// void addProduct(Product productRespDto) {
//   state = [...state, productRespDto];
// }
//
// void removeProduct(int id) {
//   state = state.where((product) => product.id != id).toList();
// }
//
// void updateProduct(Product productRespDto) {
//   state = state.map((product) {
//     if (product.id == productRespDto.id) {
//       return productRespDto;
//     } else {
//       return product;
//     }
//   }).toList();
// }
}
