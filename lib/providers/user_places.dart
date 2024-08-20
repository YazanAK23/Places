import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plcaes/models/places.dart';

class UserPlacesNotiifer extends StateNotifier<List<Place>> {
  UserPlacesNotiifer() : super(const []);

  void addPlace(String title, File image) {
    final newPLace = Place(title: title, image: image);
    state = [newPLace, ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotiifer , List<Place>>(
  (ref) => UserPlacesNotiifer(),
);
