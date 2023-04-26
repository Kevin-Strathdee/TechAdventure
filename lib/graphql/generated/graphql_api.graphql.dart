// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

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

  @override
  List<Object?> get props => [id, name, type, image];
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

  @override
  List<Object?> get props => [id, username, name, places, email, score];
  @override
  Map<String, dynamic> toJson() => _$User$RootQueryType$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User$RootQueryType extends JsonSerializable with EquatableMixin {
  User$RootQueryType();

  factory User$RootQueryType.fromJson(Map<String, dynamic> json) =>
      _$User$RootQueryTypeFromJson(json);

  late List<User$RootQueryType$User> user;

  @override
  List<Object?> get props => [user];
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

  @override
  List<Object?> get props => [id, username, name, email, score];
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
class UserArguments extends JsonSerializable with EquatableMixin {
  UserArguments({this.userId});

  @override
  factory UserArguments.fromJson(Map<String, dynamic> json) =>
      _$UserArgumentsFromJson(json);

  final String? userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$UserArgumentsToJson(this);
}

final USER_QUERY_DOCUMENT_OPERATION_NAME = 'user';
final USER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'user'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
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
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'userId'),
            value: VariableNode(name: NameNode(value: 'userId')),
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
        ]),
      )
    ]),
  )
]);

class UserQuery extends GraphQLQuery<User$RootQueryType, UserArguments> {
  UserQuery({required this.variables});

  @override
  final DocumentNode document = USER_QUERY_DOCUMENT;

  @override
  final String operationName = USER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final UserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
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
