import 'package:minibieb/core/keys/api.dart';
import 'package:minibieb/core/services/db_service_abstract.dart';
import 'package:graphql/client.dart';

class DbServiceGraphQL extends DbServiceAbstract {
  GraphQLClient getClient({String sessionToken}) {
    final HttpLink _httpLink = HttpLink(uri: kB4UriGraphQl, headers: {
      "X-Parse-Application-Id": kB4ApplicationId,
      "X-Parse-Client-Key": kB4ClientKey,
      "X-Parse-Session-Token": sessionToken != null ? sessionToken : '',
    });

    return GraphQLClient(
        link: _httpLink,
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject));
  }
}
