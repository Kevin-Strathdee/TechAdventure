import 'package:artemis/artemis.dart';
import 'package:http/http.dart' as http;
import 'package:japomo/data/credentials_util.dart';
import 'package:japomo/data/models/minigame_outcome.dart';
import 'package:japomo/data/models/place.dart';
import 'package:japomo/data/models/user.dart';
import 'package:japomo/graphql/generated/graphql_api.graphql.dart';

const String url = "https://japomo.prod.techadventure2023.jambit.space/graphql";

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

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String? accessToken = credentialUtil.getAccessToken();
    request.headers['Authorization'] = 'Bearer $accessToken';
    http.StreamedResponse response = await _inner.send(request);
    if (response.statusCode == 401 || response.statusCode == 403) {
      await credentialUtil.refreshCredential();
      String? accessToken = credentialUtil.getAccessToken();

      // To resend a request, we have to copy it
      var newRequest = _copyRequest(request);
      newRequest.headers['Authorization'] = 'Bearer $accessToken';
      response = await _inner.send(newRequest);
    }
    return response;
  }

  http.BaseRequest _copyRequest(http.BaseRequest request) {
    http.BaseRequest requestCopy;

    if (request is http.Request) {
      requestCopy = http.Request(request.method, request.url)
        ..encoding = request.encoding
        ..bodyBytes = request.bodyBytes;
    } else if (request is http.MultipartRequest) {
      requestCopy = http.MultipartRequest(request.method, request.url)
        ..fields.addAll(request.fields)
        ..files.addAll(request.files);
    } else if (request is http.StreamedRequest) {
      throw Exception('copying streamed requests is not supported');
    } else {
      throw Exception('request type is unknown, cannot copy');
    }

    requestCopy
      ..persistentConnection = request.persistentConnection
      ..followRedirects = request.followRedirects
      ..maxRedirects = request.maxRedirects
      ..headers.addAll(request.headers);

    return requestCopy;
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

  PlaceQuery placeQuery(String id) => PlaceQuery(variables: PlaceArguments(placeId: id));

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
    final query = MinigameOutcomeMutation(variables: MinigameOutcomeArguments(placeId: place.id, score: score));
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
