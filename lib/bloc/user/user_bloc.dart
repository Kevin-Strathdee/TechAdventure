import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:meta/meta.dart';
import 'package:tech_adventure/data/minigame.dart';
import 'package:tech_adventure/data/place.dart';
import 'package:tech_adventure/data/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {

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

  UserBloc() : super(UserInitial()) {
    final Link link = authLink.concat(httpLink);
    GraphQLClient client = GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));

    on<CoffeeBeansIncremented>((event, emit) {
      int newCount = max(state.numCoffeeBeans + event.numBeans, 0);
      emit(UserCoffeeBeans(newCount));
    });
    on<GetUser>((event, emit) async {
      //TODO to be tested
      QueryOptions<User> queryOptions = QueryOptions<User>(
        document: gql(getUserInfo), // this is the query string you just created
        variables: {
          'userId': 0,
        },
      );
      QueryResult<User> userInfo = await client.query(queryOptions);
      emit(UserInfo(userInfo.data as User));
    });
  }
  //Testing Data
  User getMockUser(){
    return User(1, "max.mustemann@jambit.com", "MadMax", "Max", "Mustermann", [getMockPlace()], "image", 300);
  }

  User getMockUser2(){
    return User(2, "grixon0@yahoo.com", "Garey", "Garey", "Rixon", [], "image", 0);
  }

  Place getMockPlace() {
    return Place(1, "Street", getMockUser2(), Minigame("DiceRolling", 5),"confrence room", "image", "tdb");
  }
}