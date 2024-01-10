import 'package:basreng/database.dart';

class LocationMarker {
  final int id;
  final String lat;
  final String long;
  final String name;
  final String description;

  LocationMarker({
    required this.id,
    required this.lat,
    required this.long,
    required this.name,
    required this.description,
  });

  static Future<List<LocationMarker>> findAll() async {
    List<LocationMarker> ret = [];

    final markers =
        await Database.instance!.query("SELECT * FROM location_markers");
    for (var row in markers) {
      ret.add(
        LocationMarker(
          id: row['id'],
          lat: row['lat'].toString(),
          long: row['long'].toString(),
          name: row['name'].toString(),
          description: row['description'].toString(),
        ),
      );
    }

    return ret;
  }
}
