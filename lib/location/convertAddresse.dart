import 'package:geocoding/geocoding.dart';

import 'location.dart';

Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
  try {
    // List<Location> locations = await locationFromAddress("Gronausestraat 710, Enschede");
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks != null && placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String address = '${placemark.administrativeArea}';
      // ${placemark.locality},
      return address;
    }
  } catch (e) {
    print(e);
  }
  return null;
}
