enum Map {
  MUNICH_4("munich4"),
  MUNICH_5("munich5"),
  MUNICH_6("munich6"),
  MUNICH_13("munich13"),
  LEIPZIG_1("leipzig1"),
  LEIPZIG_2("leipzig2"),
  LEIPZIG_3("leipzig3"),
  YEREVAN_2("yerevan2"),
  YEREVAN_3("yerevan3"),
  ERFURT_1("erfurt1"),
  STUTTGART_6("stuttgart6");

  const Map(this.value);

  final String value;
}

class Geometry {
  Map map;
  double? x;
  double? y;

  Geometry(this.map, this.x, this.y);
}
