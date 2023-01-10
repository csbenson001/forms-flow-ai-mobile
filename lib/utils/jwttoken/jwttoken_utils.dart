import 'package:jwt_decoder/jwt_decoder.dart';

class TokenUtils {
  static isTokenExpired({required String token}) {
    try {
      return JwtDecoder.isExpired(token);
    } catch (e) {
      return true;
    }
  }

  static Duration tokenExpiryTime({required String token}) {
    try {
      return JwtDecoder.getRemainingTime(token);
    } catch (e) {
      return const Duration(seconds: -1);
    }
  }
}

class InvalidTokenException {}
