import 'package:jwt_decoder/jwt_decoder.dart';

class TokenUtils {
  static isTokenExpired({required String token}) {
    return JwtDecoder.isExpired(token);
  }
}
