import 'package:tech_adventure/data/models/place.dart';
import 'package:tech_adventure/graphql/generated/graphql_api.graphql.dart';

class MinigameOutcome {
  int points;
  Place place;

  MinigameOutcome(this.place, this.points);
  MinigameOutcome.fromGraphQPMinigameOutcome(MinigameOutcome$RootMutationType$MinigameOutcome outcome)
      : place = Place.fromGraphqlMinigameOutcomePlace(outcome.place),
        points = outcome.reward;
}
