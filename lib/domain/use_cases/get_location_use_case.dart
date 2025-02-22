import 'package:geolocator/geolocator.dart';
import 'package:weather_clean/domain/entities/location.dart';

class GetLocationUseCase {
  Future<Location?> getCurrentLocation() async {
    try {
      final permission = await Geolocator.checkPermission();
      if(permission != LocationPermission.always || permission != LocationPermission.whileInUse) {
        await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      return Location(position.latitude, position.longitude);
    } catch (e) {
      return null;
    }
  }
}
