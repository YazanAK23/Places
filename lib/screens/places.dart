import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plcaes/models/places.dart';
import 'package:plcaes/providers/user_places.dart';
import 'package:plcaes/screens/add_place.dart';
import 'package:plcaes/widgets/placecs_list.dart';



class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Place> userPlace = ref.watch(userPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Places',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => AddPlaceScreen(),
                ),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacecsList(
          places: userPlace,
        ),
      ),
    );
  }
}
