import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider<AuthProvider>((ref) {
  return AuthProvider();
});

class AuthProvider {
  String? jwtToken;
  bool isLogin = false;
  String? role;
}
