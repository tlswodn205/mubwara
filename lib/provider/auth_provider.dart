import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authProvider = Provider<AuthProvider>((ref) {
  return AuthProvider()..initProvider();
});

class AuthProvider {
  String? jwtToken;
  bool isLogin = false;
  String? role;

  Future<void> initProvider() async {
    final prefs = await SharedPreferences.getInstance();
    String? JwtToken = prefs.getString("jwtToken");
    String? Role = prefs.getString("role");

    if (JwtToken != null) {
      this.jwtToken = JwtToken;
      isLogin = true;
      this.role = Role;
    }
  }
}
