// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User$RootQueryType$User$Place _$User$RootQueryType$User$PlaceFromJson(
        Map<String, dynamic> json) =>
    User$RootQueryType$User$Place()
      ..id = json['id'] as String
      ..name = json['name'] as String
      ..type = json['type'] as String
      ..image = json['image'] as String?;

Map<String, dynamic> _$User$RootQueryType$User$PlaceToJson(
        User$RootQueryType$User$Place instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'image': instance.image,
    };

User$RootQueryType$User _$User$RootQueryType$UserFromJson(
        Map<String, dynamic> json) =>
    User$RootQueryType$User()
      ..id = json['id'] as String
      ..username = json['username'] as String
      ..name = json['name'] as String
      ..places = (json['places'] as List<dynamic>)
          .map((e) =>
              User$RootQueryType$User$Place.fromJson(e as Map<String, dynamic>))
          .toList()
      ..email = json['email'] as String
      ..score = json['score'] as int;

Map<String, dynamic> _$User$RootQueryType$UserToJson(
        User$RootQueryType$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'places': instance.places.map((e) => e.toJson()).toList(),
      'email': instance.email,
      'score': instance.score,
    };

User$RootQueryType _$User$RootQueryTypeFromJson(Map<String, dynamic> json) =>
    User$RootQueryType()
      ..user = (json['user'] as List<dynamic>)
          .map((e) =>
              User$RootQueryType$User.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$User$RootQueryTypeToJson(User$RootQueryType instance) =>
    <String, dynamic>{
      'user': instance.user.map((e) => e.toJson()).toList(),
    };

Place$RootQueryType$Place$Geometry _$Place$RootQueryType$Place$GeometryFromJson(
        Map<String, dynamic> json) =>
    Place$RootQueryType$Place$Geometry()
      ..map = $enumDecode(_$MapLayerEnumMap, json['map'],
          unknownValue: MapLayer.artemisUnknown)
      ..x = (json['x'] as num).toDouble()
      ..y = (json['y'] as num).toDouble();

Map<String, dynamic> _$Place$RootQueryType$Place$GeometryToJson(
        Place$RootQueryType$Place$Geometry instance) =>
    <String, dynamic>{
      'map': _$MapLayerEnumMap[instance.map]!,
      'x': instance.x,
      'y': instance.y,
    };

const _$MapLayerEnumMap = {
  MapLayer.munich4th: 'MUNICH_4TH',
  MapLayer.munich5th: 'MUNICH_5TH',
  MapLayer.munich6th: 'MUNICH_6TH',
  MapLayer.munich13th: 'MUNICH_13TH',
  MapLayer.leipzig1st: 'LEIPZIG_1ST',
  MapLayer.leipzig2nd: 'LEIPZIG_2ND',
  MapLayer.leipzig3rd: 'LEIPZIG_3RD',
  MapLayer.stuttgart: 'STUTTGART',
  MapLayer.erfurt: 'ERFURT',
  MapLayer.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Place$RootQueryType$Place$User _$Place$RootQueryType$Place$UserFromJson(
        Map<String, dynamic> json) =>
    Place$RootQueryType$Place$User()
      ..id = json['id'] as String
      ..username = json['username'] as String
      ..name = json['name'] as String
      ..email = json['email'] as String
      ..score = json['score'] as int;

Map<String, dynamic> _$Place$RootQueryType$Place$UserToJson(
        Place$RootQueryType$Place$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'score': instance.score,
    };

Place$RootQueryType$Place$Minigame _$Place$RootQueryType$Place$MinigameFromJson(
        Map<String, dynamic> json) =>
    Place$RootQueryType$Place$Minigame()
      ..type = json['type'] as String
      ..score = json['score'] as int;

Map<String, dynamic> _$Place$RootQueryType$Place$MinigameToJson(
        Place$RootQueryType$Place$Minigame instance) =>
    <String, dynamic>{
      'type': instance.type,
      'score': instance.score,
    };

Place$RootQueryType$Place _$Place$RootQueryType$PlaceFromJson(
        Map<String, dynamic> json) =>
    Place$RootQueryType$Place()
      ..id = json['id'] as String
      ..name = json['name'] as String
      ..type = json['type'] as String
      ..geometry = json['geometry'] == null
          ? null
          : Place$RootQueryType$Place$Geometry.fromJson(
              json['geometry'] as Map<String, dynamic>)
      ..owner = json['owner'] == null
          ? null
          : Place$RootQueryType$Place$User.fromJson(
              json['owner'] as Map<String, dynamic>)
      ..minigame = Place$RootQueryType$Place$Minigame.fromJson(
          json['minigame'] as Map<String, dynamic>)
      ..image = json['image'] as String?;

Map<String, dynamic> _$Place$RootQueryType$PlaceToJson(
        Place$RootQueryType$Place instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'geometry': instance.geometry?.toJson(),
      'owner': instance.owner?.toJson(),
      'minigame': instance.minigame.toJson(),
      'image': instance.image,
    };

Place$RootQueryType _$Place$RootQueryTypeFromJson(Map<String, dynamic> json) =>
    Place$RootQueryType()
      ..place = (json['place'] as List<dynamic>)
          .map((e) =>
              Place$RootQueryType$Place.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Place$RootQueryTypeToJson(
        Place$RootQueryType instance) =>
    <String, dynamic>{
      'place': instance.place.map((e) => e.toJson()).toList(),
    };

UserArguments _$UserArgumentsFromJson(Map<String, dynamic> json) =>
    UserArguments(
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$UserArgumentsToJson(UserArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

PlaceArguments _$PlaceArgumentsFromJson(Map<String, dynamic> json) =>
    PlaceArguments(
      placeId: json['placeId'] as String?,
    );

Map<String, dynamic> _$PlaceArgumentsToJson(PlaceArguments instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
    };
