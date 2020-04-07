import '../models/place_model.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import "dart:convert";

class PlacesService {
  static final _service = new PlacesService();

  static PlacesService get() {
    return _service;
  }

  final String searchUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&key=AIzaSyBGh307Au_bmV_1dXXAJ7MYI9BmzVXxEDQ";

  Future<List<Place>> getNearbyPlaces() async {
    var reponse = await http.get(
        searchUrl, headers: {"Accept": "application/json"});
    var places = <Place>[];

    List data = json.decode(reponse.body)["results"];

    data.forEach((f) =>
        places.add(new Place(f["place_id"], f["name"],
            f["icon"])));

    return places;
  }
}
