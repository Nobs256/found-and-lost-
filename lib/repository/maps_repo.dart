// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../models/place/place.dart';
// import '../models/place/places_suggestation.dart';
// import '../services/web_services/places_web_services.dart';

// class MapRepo {
//   final PlacesWebServices placesWebServices;
//   MapRepo(this.placesWebServices);
//   // MapRepo(this.placesWebServices) {}

//   Future<List<dynamic>> fetchSuggestations(
//       String place, String sessionToken, LatLng orgin) async {
//     final suggestions =
//         await placesWebServices.fetchSuggestions(place, sessionToken, orgin);
//     return suggestions
//         .map((suggestation) => PlacesSuggestion.fromJson(suggestation))
//         .toList();
//   }

//   Future<Place> getPlaceLocation(String placeId, String sessionToken) async {
//     final placeDetails =
//         await placesWebServices.getPlaceLocation(placeId, sessionToken);
//     return Place.fromJson(placeDetails);
//   }
// }
