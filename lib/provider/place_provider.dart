import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super([]);
  void addPlace(Place place) {
    state = [...state, place];
  }

  void removePlace(Place place) {
    state = state.where((element) => element.id != place.id).toList();
  }
}

final placeProvider =
    StateNotifierProvider<PlaceNotifier, List<Place>>((ref) => PlaceNotifier());