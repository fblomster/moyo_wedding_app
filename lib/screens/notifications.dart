import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Notiser',
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Övernatta på Silverskär',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  "Silverskär ligger i Ålands norra skärgård och består av fyra öar; Silverskär, Klobben, Sviskär och Champagne Island."
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                  "Med tanke på att vi har valt att fira vår bröllopsdag på en avlägsen plats hoppas vi att de flesta av er väljer att övernatta på ön tillsammans med oss."),
              const SizedBox(
                height: 30,
              ),
              const Text(
                  "På Silverskär kan upp till 52 personer övernatta, utöver det kan upp till 40 personer övernatta i charmiga stugor på Klobben."
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
