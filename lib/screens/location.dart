import 'package:flutter_map/flutter_map.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Karta',
          style: TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.black87,
        //elevation: 0.0,
      ),
      body: /*Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget> [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Silverskär på kartan',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("sfkjfkjgh"),
                const SizedBox(
                  height: 30,
                ),*/

      FlutterMap(
        options: MapOptions(
          center: const LatLng(60.2153, 19.8702),
          zoom: 9.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: const LatLng(60.3598, 20.1412),
                width: 90,
                height: 90,
                builder: (context) {
                  return const Image(
                    //<a href="https://www.flaticon.com/free-icons/champagne-glass" title="champagne glass icons">Champagne glass icons created by Philine Klingel - Flaticon</a>
                    image: AssetImage('assets/champagne-glasses.png'),
                    //width: 40,
                    //height: 40,
                    color: Colors.red,
                  );
                },
              ),
              Marker(
                point: const LatLng(60.15503, 19.94842),
                width: 80,
                height: 80,
                builder: (context) {
                  return const Icon(
                    Icons.church_outlined,
                    color: Colors.red,
                    size: 40,
                  );
                },
              ),
              Marker(
                point: const LatLng(60.2251, 19.5385),
                width: 80,
                height: 80,
                builder: (context) {
                  return const Icon(
                    Icons.directions_ferry_outlined,
                    color: Colors.red,
                    size: 40,
                  );
                },
              ),
              Marker(
                point: const LatLng(60.09193, 19.92901),
                width: 80,
                height: 80,
                builder: (context) {
                  return const Icon(
                    Icons.directions_ferry_outlined,
                    color: Colors.red,
                    size: 40,
                  );
                },
              ),
            ],
          ),
          RichAttributionWidget(
            attributions: [
              TextSourceAttribution(
                'OpenStreetMap contributors',
                onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
              ),
            ],
          ),
        ],
      ),
    //],
      //),
     // ),
       //   ),
        //),
      );
  }
}