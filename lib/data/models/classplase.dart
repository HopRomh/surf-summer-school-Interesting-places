class Place {
  final int id;
  final String name;
  final double lat;
  final double lng;
  final String placeType;
  final String description;
  final List<String> urls;

  Place({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.placeType,
    required this.description,
    required this.urls,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
      placeType: json['placeType'],
      description: json['description'],
      urls: List<String>.from(json['urls']),
    );
  }
}
