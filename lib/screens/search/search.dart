import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taqs/provider/weatherProvider.dart';
import 'package:taqs/screens/home/home_screen.dart';
import 'package:taqs/shared/componant/ui_utlis.dart';

class SearchByMap extends StatefulWidget {
  static const String routName = 'search';

  const SearchByMap({super.key});

  @override
  State<SearchByMap> createState() => _SearchByMapState();
}

class _SearchByMapState extends State<SearchByMap> {
  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context);
    var startLocation = LatLng(30.0596113, 31.3408665);
    // String googleApikey='AIzaSyC9ZwqMEFSatRomdDHIuNljKJd7W002WUA';
    // String location = "Search Location";
    return Scaffold(
      appBar: AppBar(
          title: Text('Search by Map'),
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routName);
              },
              icon: const Icon(Icons.home_filled))),

      body: Stack(
        children: [
          GoogleMap(
            onTap: (latLng) {
              weather.changeMarker(latLng);
              print(latLng);
              weather.lat = latLng.latitude;
              weather.long = latLng.longitude;
              weather.getWeather(context);

              weather.loading==false
                  ? weather.getWeather(context)
                  :Navigator.pushNamed(context, HomeScreen.routName) ;
            },
            mapType: MapType.hybrid,
            markers: weather.markers,
            initialCameraPosition: weather.myLocation == null
                ? CameraPosition(
                    //innital position in map
                    target: startLocation, //initial position
                    zoom: 14.0, //initial zoom level
                  )
                : weather.myLocation!,
            onMapCreated: (GoogleMapController controller) {
              // weather.mapController.complete(controller);
              weather.mapController = controller;
            },
          ),

          // Positioned(  //search input bar
          //     top:10,
          //     child: InkWell(
          //         onTap: () async {
          //           var place = await PlacesAutocomplete.show(
          //               context: context,
          //               apiKey: googleApikey,
          //               mode: Mode.overlay,
          //               types: [],
          //               strictbounds: false,
          //               components: [Component(Component.country, 'np')],
          //               //google_map_webservice package
          //               onError: (err){
          //                 print("mostafaffffff$err");
          //               }
          //           );
          //
          //           if(place != null){
          //             setState(() {
          //               location = place.description.toString();
          //             });
          //
          //             //form google_maps_webservice package
          //             final plist = GoogleMapsPlaces(apiKey:googleApikey,
          //               apiHeaders: await GoogleApiHeaders().getHeaders(),
          //               //from google_api_headers package
          //             );
          //             String placeid = place.placeId ?? "0";
          //             final detail = await plist.getDetailsByPlaceId(placeid);
          //             final geometry = detail.result.geometry!;
          //             final lat = geometry.location.lat;
          //             final lang = geometry.location.lng;
          //             var newlatlang = LatLng(lat, lang);
          //
          //
          //             //move map camera to selected place with animation
          //             weather.mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: newlatlang, zoom: 17)));
          //           }
          //         },
          //         child:Padding(
          //           padding: EdgeInsets.all(15),
          //           child: Card(
          //             child: Container(
          //                 padding: EdgeInsets.all(0),
          //                 width: MediaQuery.of(context).size.width - 40,
          //                 child: ListTile(
          //                   title:Text(location, style: TextStyle(fontSize: 18),),
          //                   trailing: Icon(Icons.search),
          //                   dense: true,
          //                 )
          //             ),
          //           ),
          //         )
          //     )
          // )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed:weather.myLocation,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }
}
