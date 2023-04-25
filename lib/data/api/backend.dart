import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';

abstract class IBackend {
  Future<User> getUser();
  Future<Place> getPlace();
  Future<User> updateUser(User user);
}

class Backend extends IBackend {
  //graphql
  final HttpLink httpLink = HttpLink(
    'https://api.github.com/graphql',
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  String userQuery = """
      query user (\$userId: ID) {
        user (userId: \$userId) {
            id
            username
            name
            email
            score
        }
    }
    """;

  String placeQuery = """query place (\$placeId: ID) {
        place (placeId: \$placeId) {
            id
            name
            type
            image
        }
    }""";

  late GraphQLClient client;

  Backend() {
    final Link link = authLink.concat(httpLink);
    client = GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
  }

  Future<User> getUser() async {
    //TODO to be tested
    QueryOptions<User> queryOptions = QueryOptions<User>(
      document: gql(userQuery), // this is the query string you just created
      variables: {
        'userId': 0,
      },
    );
    Future<QueryResult<User>> userInfo = client.query(queryOptions);
    //TODO
    return Future.value();
  }

  @override
  Future<Place> getPlace() {
    // TODO: implement getPlace
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
