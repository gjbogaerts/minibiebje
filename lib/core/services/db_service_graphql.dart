import 'package:minibieb/core/keys/api.dart';
import 'package:minibieb/core/services/db_service_abstract.dart';
import 'package:graphql/client.dart';

class DbServiceGraphQL extends DbServiceAbstract {
  final HttpLink _httpLink = HttpLink(uri: kB4UriGraphQl, headers: {
    "X-Parse-Application-Id": kB4ApplicationId,
    "X-Parse-Client-Key": kB4ClientKey,
  });

  GraphQLClient getClient() {
    final GraphQLClient _client = GraphQLClient(
        link: _httpLink,
        cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject));
    return _client;
  }
}
