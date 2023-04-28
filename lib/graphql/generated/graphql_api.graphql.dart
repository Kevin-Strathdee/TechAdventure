// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class MinigameOutcome$RootMutationType$MinigameOutcome$Place$Geometry
    extends JsonSerializable with EquatableMixin {
  MinigameOutcome$RootMutationType$MinigameOutcome$Place$Geometry();

  factory MinigameOutcome$RootMutationType$MinigameOutcome$Place$Geometry.fromJson(
          Map<String, dynamic> json) =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$Place$GeometryFromJson(
          json);

  @JsonKey(unknownEnumValue: MapLayer.artemisUnknown)
  late MapLayer mapLayer;

  late double x;

  late double y;

  @override
  List<Object?> get props => [mapLayer, x, y];
  @override
  Map<String, dynamic> toJson() =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$Place$GeometryToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class MinigameOutcome$RootMutationType$MinigameOutcome$Place$User
    extends JsonSerializable with EquatableMixin {
  MinigameOutcome$RootMutationType$MinigameOutcome$Place$User();

  factory MinigameOutcome$RootMutationType$MinigameOutcome$Place$User.fromJson(
          Map<String, dynamic> json) =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$Place$UserFromJson(
          json);

  late String id;

  late String username;

  late String name;

  late String email;

  late int score;

  late int rank;

  @override
  List<Object?> get props => [id, username, name, email, score, rank];
  @override
  Map<String, dynamic> toJson() =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$Place$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MinigameOutcome$RootMutationType$MinigameOutcome$Place$Minigame
    extends JsonSerializable with EquatableMixin {
  MinigameOutcome$RootMutationType$MinigameOutcome$Place$Minigame();

  factory MinigameOutcome$RootMutationType$MinigameOutcome$Place$Minigame.fromJson(
          Map<String, dynamic> json) =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$Place$MinigameFromJson(
          json);

  late String type;

  late int score;

  @override
  List<Object?> get props => [type, score];
  @override
  Map<String, dynamic> toJson() =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$Place$MinigameToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class MinigameOutcome$RootMutationType$MinigameOutcome$Place
    extends JsonSerializable with EquatableMixin {
  MinigameOutcome$RootMutationType$MinigameOutcome$Place();

  factory MinigameOutcome$RootMutationType$MinigameOutcome$Place.fromJson(
          Map<String, dynamic> json) =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$PlaceFromJson(json);

  late String id;

  late String name;

  MinigameOutcome$RootMutationType$MinigameOutcome$Place$Geometry? geometry;

  MinigameOutcome$RootMutationType$MinigameOutcome$Place$User? owner;

  late MinigameOutcome$RootMutationType$MinigameOutcome$Place$Minigame minigame;

  String? image;

  @override
  List<Object?> get props => [id, name, geometry, owner, minigame, image];
  @override
  Map<String, dynamic> toJson() =>
      _$MinigameOutcome$RootMutationType$MinigameOutcome$PlaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MinigameOutcome$RootMutationType$MinigameOutcome extends JsonSerializable
    with EquatableMixin {
  MinigameOutcome$RootMutationType$MinigameOutcome();

  factory MinigameOutcome$RootMutationType$MinigameOutcome.fromJson(
          Map<String, dynamic> json) =>
      _$MinigameOutcome$RootMutationType$MinigameOutcomeFromJson(json);

  late int reward;

  late MinigameOutcome$RootMutationType$MinigameOutcome$Place place;

  @override
  List<Object?> get props => [reward, place];
  @override
  Map<String, dynamic> toJson() =>
      _$MinigameOutcome$RootMutationType$MinigameOutcomeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MinigameOutcome$RootMutationType extends JsonSerializable
    with EquatableMixin {
  MinigameOutcome$RootMutationType();

  factory MinigameOutcome$RootMutationType.fromJson(
          Map<String, dynamic> json) =>
      _$MinigameOutcome$RootMutationTypeFromJson(json);

  late MinigameOutcome$RootMutationType$MinigameOutcome minigameOutcome;

  @override
  List<Object?> get props => [minigameOutcome];
  @override
  Map<String, dynamic> toJson() =>
      _$MinigameOutcome$RootMutationTypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User$RootQueryType$User$Place$User extends JsonSerializable
    with EquatableMixin {
  User$RootQueryType$User$Place$User();

  factory User$RootQueryType$User$Place$User.fromJson(
          Map<String, dynamic> json) =>
      _$User$RootQueryType$User$Place$UserFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$User$RootQueryType$User$Place$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User$RootQueryType$User$Place$Minigame extends JsonSerializable
    with EquatableMixin {
  User$RootQueryType$User$Place$Minigame();

  factory User$RootQueryType$User$Place$Minigame.fromJson(
          Map<String, dynamic> json) =>
      _$User$RootQueryType$User$Place$MinigameFromJson(json);

  late String type;

  late int score;

  @override
  List<Object?> get props => [type, score];
  @override
  Map<String, dynamic> toJson() =>
      _$User$RootQueryType$User$Place$MinigameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User$RootQueryType$User$Place$Geometry extends JsonSerializable
    with EquatableMixin {
  User$RootQueryType$User$Place$Geometry();

  factory User$RootQueryType$User$Place$Geometry.fromJson(
          Map<String, dynamic> json) =>
      _$User$RootQueryType$User$Place$GeometryFromJson(json);

  @JsonKey(unknownEnumValue: MapLayer.artemisUnknown)
  late MapLayer mapLayer;

  late double x;

  late double y;

  @override
  List<Object?> get props => [mapLayer, x, y];
  @override
  Map<String, dynamic> toJson() =>
      _$User$RootQueryType$User$Place$GeometryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User$RootQueryType$User$Place extends JsonSerializable
    with EquatableMixin {
  User$RootQueryType$User$Place();

  factory User$RootQueryType$User$Place.fromJson(Map<String, dynamic> json) =>
      _$User$RootQueryType$User$PlaceFromJson(json);

  late String id;

  late String name;

  late String type;

  String? image;

  User$RootQueryType$User$Place$User? owner;

  late User$RootQueryType$User$Place$Minigame minigame;

  User$RootQueryType$User$Place$Geometry? geometry;

  @override
  List<Object?> get props => [id, name, type, image, owner, minigame, geometry];
  @override
  Map<String, dynamic> toJson() => _$User$RootQueryType$User$PlaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User$RootQueryType$User extends JsonSerializable with EquatableMixin {
  User$RootQueryType$User();

  factory User$RootQueryType$User.fromJson(Map<String, dynamic> json) =>
      _$User$RootQueryType$UserFromJson(json);

  late String id;

  late String username;

  late String name;

  late List<User$RootQueryType$User$Place> places;

  late String email;

  late int score;

  late int rank;

  @override
  List<Object?> get props => [id, username, name, places, email, score, rank];
  @override
  Map<String, dynamic> toJson() => _$User$RootQueryType$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User$RootQueryType extends JsonSerializable with EquatableMixin {
  User$RootQueryType();

  factory User$RootQueryType.fromJson(Map<String, dynamic> json) =>
      _$User$RootQueryTypeFromJson(json);

  late User$RootQueryType$User currentUser;

  @override
  List<Object?> get props => [currentUser];
  @override
  Map<String, dynamic> toJson() => _$User$RootQueryTypeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Place$RootQueryType$Place$Geometry extends JsonSerializable
    with EquatableMixin {
  Place$RootQueryType$Place$Geometry();

  factory Place$RootQueryType$Place$Geometry.fromJson(
          Map<String, dynamic> json) =>
      _$Place$RootQueryType$Place$GeometryFromJson(json);

  @JsonKey(unknownEnumValue: MapLayer.artemisUnknown)
  late MapLayer mapLayer;

  late double x;

  late double y;

  @override
  List<Object?> get props => [mapLayer, x, y];
  @override
  Map<String, dynamic> toJson() =>
      _$Place$RootQueryType$Place$GeometryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Place$RootQueryType$Place$User extends JsonSerializable
    with EquatableMixin {
  Place$RootQueryType$Place$User();

  factory Place$RootQueryType$Place$User.fromJson(Map<String, dynamic> json) =>
      _$Place$RootQueryType$Place$UserFromJson(json);

  late String id;

  late String username;

  late String name;

  late String email;

  late int score;

  late int rank;

  @override
  List<Object?> get props => [id, username, name, email, score, rank];
  @override
  Map<String, dynamic> toJson() => _$Place$RootQueryType$Place$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Place$RootQueryType$Place$Minigame extends JsonSerializable
    with EquatableMixin {
  Place$RootQueryType$Place$Minigame();

  factory Place$RootQueryType$Place$Minigame.fromJson(
          Map<String, dynamic> json) =>
      _$Place$RootQueryType$Place$MinigameFromJson(json);

  late String type;

  late int score;

  @override
  List<Object?> get props => [type, score];
  @override
  Map<String, dynamic> toJson() =>
      _$Place$RootQueryType$Place$MinigameToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Place$RootQueryType$Place extends JsonSerializable with EquatableMixin {
  Place$RootQueryType$Place();

  factory Place$RootQueryType$Place.fromJson(Map<String, dynamic> json) =>
      _$Place$RootQueryType$PlaceFromJson(json);

  late String id;

  late String name;

  late String type;

  Place$RootQueryType$Place$Geometry? geometry;

  Place$RootQueryType$Place$User? owner;

  late Place$RootQueryType$Place$Minigame minigame;

  String? image;

  @override
  List<Object?> get props => [id, name, type, geometry, owner, minigame, image];
  @override
  Map<String, dynamic> toJson() => _$Place$RootQueryType$PlaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Place$RootQueryType extends JsonSerializable with EquatableMixin {
  Place$RootQueryType();

  factory Place$RootQueryType.fromJson(Map<String, dynamic> json) =>
      _$Place$RootQueryTypeFromJson(json);

  late List<Place$RootQueryType$Place> place;

  @override
  List<Object?> get props => [place];
  @override
  Map<String, dynamic> toJson() => _$Place$RootQueryTypeToJson(this);
}

enum MapLayer {
  @JsonValue('ERFURT_1')
  erfurt1,
  @JsonValue('LEIPZIG_1')
  leipzig1,
  @JsonValue('LEIPZIG_2')
  leipzig2,
  @JsonValue('LEIPZIG_3')
  leipzig3,
  @JsonValue('MUNICH_13')
  munich13,
  @JsonValue('MUNICH_4')
  munich4,
  @JsonValue('MUNICH_5')
  munich5,
  @JsonValue('MUNICH_6')
  munich6,
  @JsonValue('STUTTGART_6')
  stuttgart6,
  @JsonValue('YEREVAN_2')
  yerevan2,
  @JsonValue('YEREVAN_3')
  yerevan3,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class MinigameOutcomeArguments extends JsonSerializable with EquatableMixin {
  MinigameOutcomeArguments({
    required this.placeId,
    required this.score,
  });

  @override
  factory MinigameOutcomeArguments.fromJson(Map<String, dynamic> json) =>
      _$MinigameOutcomeArgumentsFromJson(json);

  late String placeId;

  late int score;

  @override
  List<Object?> get props => [placeId, score];
  @override
  Map<String, dynamic> toJson() => _$MinigameOutcomeArgumentsToJson(this);
}

final MINIGAME_OUTCOME_MUTATION_DOCUMENT_OPERATION_NAME = 'minigameOutcome';
final MINIGAME_OUTCOME_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'minigameOutcome'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'placeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'score')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'minigameOutcome'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'placeId'),
            value: VariableNode(name: NameNode(value: 'placeId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'score'),
            value: VariableNode(name: NameNode(value: 'score')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reward'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'place'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'geometry'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'mapLayer'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'x'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'y'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'owner'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'username'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'score'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'rank'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'minigame'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'score'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class MinigameOutcomeMutation extends GraphQLQuery<
    MinigameOutcome$RootMutationType, MinigameOutcomeArguments> {
  MinigameOutcomeMutation({required this.variables});

  @override
  final DocumentNode document = MINIGAME_OUTCOME_MUTATION_DOCUMENT;

  @override
  final String operationName =
      MINIGAME_OUTCOME_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final MinigameOutcomeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  MinigameOutcome$RootMutationType parse(Map<String, dynamic> json) =>
      MinigameOutcome$RootMutationType.fromJson(json);
}

final USER_QUERY_DOCUMENT_OPERATION_NAME = 'user';
final USER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'user'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'currentUser'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'username'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'places'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'image'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'owner'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'minigame'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'type'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'score'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'geometry'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'mapLayer'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'x'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'y'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'score'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'rank'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class UserQuery extends GraphQLQuery<User$RootQueryType, JsonSerializable> {
  UserQuery();

  @override
  final DocumentNode document = USER_QUERY_DOCUMENT;

  @override
  final String operationName = USER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  User$RootQueryType parse(Map<String, dynamic> json) =>
      User$RootQueryType.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class PlaceArguments extends JsonSerializable with EquatableMixin {
  PlaceArguments({this.placeId});

  @override
  factory PlaceArguments.fromJson(Map<String, dynamic> json) =>
      _$PlaceArgumentsFromJson(json);

  final String? placeId;

  @override
  List<Object?> get props => [placeId];
  @override
  Map<String, dynamic> toJson() => _$PlaceArgumentsToJson(this);
}

final PLACE_QUERY_DOCUMENT_OPERATION_NAME = 'place';
final PLACE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'place'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'placeId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'place'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'placeId'),
            value: VariableNode(name: NameNode(value: 'placeId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'type'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'geometry'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'mapLayer'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'x'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'y'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'owner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'username'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'email'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'score'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'rank'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'minigame'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'score'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'image'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class PlaceQuery extends GraphQLQuery<Place$RootQueryType, PlaceArguments> {
  PlaceQuery({required this.variables});

  @override
  final DocumentNode document = PLACE_QUERY_DOCUMENT;

  @override
  final String operationName = PLACE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final PlaceArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Place$RootQueryType parse(Map<String, dynamic> json) =>
      Place$RootQueryType.fromJson(json);
}
