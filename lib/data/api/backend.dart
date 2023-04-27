import 'package:artemis/artemis.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';
import 'package:tech_adventure/graphql/generated/graphql_api.graphql.dart';
import 'package:tech_adventure/main.dart';

const String url = "https://japomo.dev.techadventure2023.jambit.space/graphql";

abstract class IBackend {
  Future<User> getUser();
  Future<int> submitScore(Place place, int score);
  Future<Place> getPlace(String id);
  Future<User> updateUser(User user);
}

class AuthenticatedClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString(accessTokenKey);

    // request.headers['Authorization'] = 'Bearer $accessToken';
    request.headers['Authorization'] = 'User 1';
    //only for testing purpose
    // request.headers['User'] = '1';
    return _inner.send(request);
  }
}

class Backend extends IBackend {
  final client = ArtemisClient(
    url,
    httpClient: AuthenticatedClient(),
  );

  final userQuery = UserQuery(
    variables: UserArguments(userId: '1'),
  );
  PlaceQuery placeQuery(String id) => PlaceQuery(variables: PlaceArguments(placeId: id));

  @override
  Future<User> getUser() async {
    final response = await client.execute(userQuery);
    User$RootQueryType$User user = (response.data?.user ?? []).whereType<User$RootQueryType$User>().first;
    User appUser = User.fromGraphqlUser(user);
    return Future.value(appUser);
  }

  @override
  Future<int> submitScore(Place place, int score) async {
    final query = MinigameOutcomeMutation(variables: MinigameOutcomeArguments(placeId: place.id, score: score));
    final result = await client.execute(query);
    final reward = result.data?.minigameOutcome.reward;
    if (!result.hasErrors && reward != null) {
      return reward;
    } else {
      throw Exception();
    }
  }

  @override
  Future<Place> getPlace(String id) async {
    final response = await client.execute(placeQuery(id));
    Place$RootQueryType$Place place = (response.data?.place ?? []).whereType<Place$RootQueryType$Place>().first;
    Place appPlace = Place.fromGraphqlPlace(place);
    return Future.value(appPlace);
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
