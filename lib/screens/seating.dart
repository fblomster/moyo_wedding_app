import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Seating extends StatefulWidget {
  const Seating({Key? key}) : super(key: key);

  @override
  State<Seating> createState() => _SeatingState();
}

class _SeatingState extends State<Seating> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Bordsplacering',
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
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Bord 1',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Frida Blomster"
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "Med tanke på att vi har valt att fira vår bröllopsdag på en avlägsen plats hoppas vi att de flesta av er väljer att övernatta på ön tillsammans med oss."),
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
