

enum Map {
  MUNICH_4TH,
  MUNICH_5TH,
  MUNICH_6TH,
  MUNICH_13TH,
  LEIPZIG_1ST,
  LEIPZIG_2ND,
  LEIPZIG_3RD,
  STUTTGART,
  ERFURT,
}

class Geometry {
  Map map;
  double? x;
  double? y;

  Geometry(this.map, this.x, this.y);
}
