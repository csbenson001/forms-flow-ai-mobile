class JwtTokenUtils {
  // static String signJwtToken(
  //     {String? userResourceId, List<String>? roles, String? email}) {
  //   final jwt = JWT(
  //     {
  //       'form': {
  //         '_id': !GeneralUtil.isStringEmpty(userResourceId)
  //             ? userResourceId!
  //             : reviewerRoleId
  //       },
  //       'user': {
  //         '_id': 'external',
  //         'roles':
  //             (roles != null && roles.isNotEmpty) ? roles : [reviewerRoleId]
  //       }
  //     },
  //   );
  //
  //   return jwt
  //       .sign(SecretKey(dotenv.get(EnvKeyConstants.envFormioJwtSecretKey)));
  // }
}
