import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:formsflowai/utils/general_util.dart';

import '../../../shared/env_key_constants.dart';

class JwtTokenUtils {
  static const String reviewerRoleId = "637676a99bc6b9aadd7a513b";

  static String signJwtToken(
      {String? userResourceId, List<String>? roles, String? email}) {
    final jwt = JWT(
      {
        'form': {
          '_id': !GeneralUtil.isStringEmpty(userResourceId)
              ? userResourceId!
              : reviewerRoleId
        },
        'user': {
          '_id': 'external',
          'roles':
              (roles != null && roles.isNotEmpty) ? roles : [reviewerRoleId]
        }
      },
    );

    return jwt
        .sign(SecretKey(dotenv.get(EnvKeyConstants.envFormioJwtSecretKey)));
  }
}
