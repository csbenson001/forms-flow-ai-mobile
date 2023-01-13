import 'package:flutter_appauth/flutter_appauth.dart';

import '../core/api/utils/api_constants_url.dart';

class FlutterAuthUtils {
  static AuthorizationServiceConfiguration fetchAuthorizationConfiguration() {
    return AuthorizationServiceConfiguration(
      authorizationEndpoint:
          '${ApiConstantUrl.keycloakAuthBaseUrl}${ApiConstantUrl.fetchTokenOpenIdConnect}/auth',
      tokenEndpoint:
          '${ApiConstantUrl.keycloakAuthBaseUrl}${ApiConstantUrl.fetchTokenOpenIdConnect}/token',
      endSessionEndpoint:
          '${ApiConstantUrl.keycloakAuthBaseUrl}${ApiConstantUrl.fetchTokenOpenIdConnect}/logout',
    );
  }
}
