import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class JwtTokenUtils {
  static String signJwtToken(
      String userResourceID, List<String> roles, String? email) {
    final jwt = JWT(
      {
        'form': {'_id': userResourceID},
        'user': {'_id': 'external', 'roles': roles}
      },
    );

    return jwt.sign(SecretKey('--- change me now ---'));
  }
}
