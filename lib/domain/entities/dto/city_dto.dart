
import 'coord_dto.dart';

class CityDto {
  num? id;
  String? name;
  CoordDto? coord;
  String? country;
  num? population;
  num? timezone;

  CityDto({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
  });

  CityDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? CoordDto.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coord != null) {
      data['coord'] = coord!.toJson();
    }
    data['country'] = country;
    data['population'] = population;
    data['timezone'] = timezone;
    return data;
  }
}