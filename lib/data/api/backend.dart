import 'package:artemis/artemis.dart';
import 'package:http/http.dart' as http;
import 'package:tech_adventure/data/credentials_util.dart';
import 'package:tech_adventure/data/models/minigame_outcome.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';
import 'package:tech_adventure/graphql/generated/graphql_api.graphql.dart';

const String url = "https://japomo.dev.techadventure2023.jambit.space/graphql";

abstract class IBackend {
  Future<User> getUser();

  Future<MinigameOutcome> submitScore(Place place, int score);

  Future<Place> getPlace(String id);

  Future<User> updateUser(User user);
}

class AuthenticatedClient extends http.BaseClient {
  CredentialUtil credentialUtil;

  AuthenticatedClient(this.credentialUtil);

  final http.Client _inner = http.Client();

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String? accessToken = credentialUtil.getAccessToken();
    request.headers['Authorization'] = 'Bearer $accessToken';
    http.StreamedResponse response = await _inner.send(request);
    if (response.statusCode == 401) {
      await credentialUtil.refreshCredential();
      response = await _inner.send(request);
    }
    return response;
  }
}

class Backend extends IBackend {
  CredentialUtil credentialUtil;

  Backend(this.credentialUtil) {
    client = ArtemisClient(
      url,
      httpClient: AuthenticatedClient(credentialUtil),
    );
  }

  late final ArtemisClient client;

  final userQuery = UserQuery();

  PlaceQuery placeQuery(String id) =>
      PlaceQuery(variables: PlaceArguments(placeId: id));

  @override
  Future<User> getUser() async {
    final response = await client.execute(userQuery);
    final currentUser = response.data?.currentUser;
    if (!response.hasErrors && currentUser != null) {
      return User.fromGraphqlUser(currentUser);
    } else {
      throw Exception();
    }
  }

  @override
  Future<MinigameOutcome> submitScore(Place place, int score) async {
    final query = MinigameOutcomeMutation(
        variables: MinigameOutcomeArguments(placeId: place.id, score: score));
    final result = await client.execute(query);
    final outcome = result.data?.minigameOutcome;
    if (!result.hasErrors && outcome != null) {
      return MinigameOutcome.fromGraphQPMinigameOutcome(outcome);
    } else {
      throw Exception();
    }
  }

  @override
  Future<Place> getPlace(String id) async {
    final response = await client.execute(placeQuery(id));
    Place$RootQueryType$Place place = (response.data?.place ?? [])
        .whereType<Place$RootQueryType$Place>()
        .first;
    Place appPlace = Place.fromGraphqlPlace(place);
    return Future.value(appPlace);
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
