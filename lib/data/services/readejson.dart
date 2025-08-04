import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/classplase.dart';

class MockPlaceService {
  Future<List<Place>> fetchPlaces() async {
    final jsonString = await rootBundle.loadString('assets/json/places.json');
    final jsonMap = json.decode(jsonString);
    final placesJson = jsonMap['places'] as List;
    return placesJson.map((e) => Place.fromJson(e)).toList();
  }
}
