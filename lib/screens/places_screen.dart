import 'package:eyentra/models/place_model.dart';
import 'package:eyentra/services/place_service.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  @override
  State createState() => new PlacesScreenState();
}

class PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
              appBar: new AppBar(
                title: new Text("Nearby places"),
                backgroundColor: Colors.green,
              ),
              body:_createcontent(),
            );
  }
  List<Place> _places;
  @override
  void initState() {
    super.initState();

    PlacesService.get().getNearbyPlaces().then((data){
      this.setState((){
        _places = data;
      });
    });

  }
  Widget _createcontent(){
    if(_places == null){
      return new Center(
        child: Text("null"),
      );
    }
    else{
      return new ListView(
        children: _places.map((f){
           return new ListTile(
             title: new Text(f.name),
             leading: new Image.network(f.icon),
             subtitle: new Text(f.id),
           );
      }).toList(),
      );
    }
  }
  }


