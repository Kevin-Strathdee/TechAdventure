enum Map {
  MUNICH_4,
  MUNICH_5,
  MUNICH_6,
  MUNICH_13,
  LEIPZIG_1,
  LEIPZIG_2,
  LEIPZIG_3,
  YEREVAN_2,
  YEREVAN_3,
  ERFURT_1,
  STUTTGART_6,
}

class Geometry {
  Map map;
  double? x;
  double? y;

  Geometry(this.map, this.x, this.y);
}
