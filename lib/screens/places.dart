import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:favorite_places/provider/place_provider.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(placeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push<Place>(
                MaterialPageRoute(
                  builder: (context) {
                    return const NewPlace();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: PlacesList(places: places),
      ),
    );
  }
}
