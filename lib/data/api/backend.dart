import 'package:artemis/artemis.dart';
import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/data/models/user.dart';
import 'package:tech_adventure/graphql/generated/graphql_api.graphql.dart';

abstract class IBackend {
  Future<User> getUser();

  Future<Place> getPlace();
}

class Backend extends IBackend {
  final client = ArtemisClient('/graphql');

  final userQuery = UserQuery(
    variables: UserArguments(userId: '0'),
  );
  final placeQuery = PlaceQuery(variables: PlaceArguments(placeId: "0"));

  Future<User> getUser() async {
    final response = await client.execute(userQuery);
    User$RootQueryType$User user =
        (response.data?.user ?? []).whereType<User$RootQueryType$User>().first;
    User appUser = User.fromGraphqlUser(user);
    return Future.value(appUser);
  }

  @override
  Future<Place> getPlace() async {
    final response = await client.execute(placeQuery);
    Place$RootQueryType$Place place = (response.data?.place ?? [])
        .whereType<Place$RootQueryType$Place>()
        .first;
    Place appPlace = Place.fromGraphqlPlace(place);
    return Future.value(appPlace);
  }
}
