import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:mubwara/provider/auth_provider.dart';

final subscribeHttpRepository = Provider<SubscribeHttpRepository>((ref) {
  return SubscribeHttpRepository(ref);
});

class SubscribeHttpRepository {
  Ref _ref;
  SubscribeHttpRepository(this._ref);

  void deleteSubscribe(int shopId) {}

  void insertSubscribe(int shopId) {
    _ref.read(httpConnector).get("/auth/${shopId}/subscribe");
  }
}
