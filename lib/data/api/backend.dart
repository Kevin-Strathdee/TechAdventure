import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';

abstract class IBackend {
  Future<User> getUser();
  Future<Place> getPlace();
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


  String getUserInfo = """
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

  late GraphQLClient client;

  Backend(){
    final Link link = authLink.concat(httpLink);
    client = GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
  }

  Future<User> getUser() async {
    //TODO to be tested
    QueryOptions<User> queryOptions = QueryOptions<User>(
      document: gql(getUserInfo), // this is the query string you just created
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
}