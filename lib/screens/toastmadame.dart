import 'package:flutter/material.dart';

class Toastmadame extends StatefulWidget {
  const Toastmadame({Key? key}) : super(key: key);

  @override
  State<Toastmadame> createState() => _ToastmadameState();
}

class _ToastmadameState extends State<Toastmadame> {

  final  userNameController = TextEditingController();
  final  userLastnameController= TextEditingController();
  final  userEmailController =TextEditingController();
  final  userPhoneController =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Toastmadame',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.black87,
        //elevation: 0.0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/jenny.jpg'),
                  radius: 40.0,
                ),
              ),
              Divider(
                height: 60.0,
                color: Colors.greenAccent,
              ),
              Text(
                'Namn',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
          Text("Jenny Hedlöf",
            style: TextStyle(
              letterSpacing: 2.0,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*@override
Widget build(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      initialCenter: LatLng(51.509364, -0.128928),
      initialZoom: 9.2,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
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
  );
}*/