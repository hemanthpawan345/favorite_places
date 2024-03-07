import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.latitiude,
    required this.longitude,
    required this.address,
  });

  final double latitiude;
  final double longitude;
  final String address;
}

class Place {
  Place({
    required this.place,
    required this.image,
    required this.location,
  }) : id = uuid.v4();
  final String id;
  final String place;
  final File image;
  final PlaceLocation location;
}
