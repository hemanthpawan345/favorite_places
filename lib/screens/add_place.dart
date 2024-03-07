import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/loaction_input.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/provider/place_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  void _onAdd() {
    if (_titleController.text.trim().isEmpty || _selectedImage==null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure a valid title was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    
    ref.read(placeProvider.notifier).addPlace(
          Place(
            place: _titleController.text,
            image: _selectedImage!,
            location: ,
          ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                label: Text(
                  'Place',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20,
                      ),
                ),
              ),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const LocationInput(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: _onAdd,
              icon: const Icon(Icons.add),
              label: const Text('Add  place'),
            ),
          ],
        ),
      ),
    );
  }
}
