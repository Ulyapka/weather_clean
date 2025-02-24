class FeelsLikeDto {
  num? day;
  num? night;
  num? eve;
  num? morn;

  FeelsLikeDto({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  FeelsLikeDto.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['night'] = night;
    data['eve'] = eve;
    data['morn'] = morn;
    return data;
  }
}