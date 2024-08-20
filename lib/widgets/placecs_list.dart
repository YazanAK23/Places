import 'package:flutter/material.dart';
import 'package:plcaes/models/places.dart';
import 'package:plcaes/screens/places_detail.dart';

class PlacecsList extends StatelessWidget {
  const PlacecsList({super.key, required this.places});

final List <Place> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return const Center(
        child: Text('No Places Added Yet'),
      );
    }
    return ListView.builder(
      
      itemCount: places.length,
      itemBuilder: (ctx, index)=> ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
      title:Text(places[index].title, 
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
        color: Theme.of(context).colorScheme.onSurface, 

      ),

      ),
      onTap: (){
         Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlacesDetailScreen(place: places[index],),
                ),
              );
      },

    ), 
    );
  }
}