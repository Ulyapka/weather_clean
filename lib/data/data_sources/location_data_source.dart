import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../dto/location_dto.dart';

@singleton
class LocationDataSource {
  Future<LocationDto> getCurrentLocation() async {
    try {
      final permission = await Geolocator.checkPermission();
      if(permission != LocationPermission.always || permission != LocationPermission.whileInUse) {
        await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      return LocationDto(position.latitude, position.longitude);
    } catch (e) {
      return Future.error(e);
    }
  }
}
