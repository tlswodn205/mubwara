import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mubwara/domain/http_connector.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = Provider<AuthProvider>((ref) {
  return AuthProvider();
});

class AuthProvider {
  String? jwtToken;
  bool isLogin = false;
  String? role;

  Future<void> initProvider(Ref ref) async {
    final prefs = await SharedPreferences.getInstance();
    String? JwtToken = prefs.getString("jwtToken");
    String? Role = prefs.getString("role");

    if (JwtToken != null) {
      this.jwtToken = JwtToken;
      isLogin = true;
      this.role = Role;
      ref.read(httpConnector).AddJWT(JwtToken);
    }
  }
}
