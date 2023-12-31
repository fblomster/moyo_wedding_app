import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({Key? key}) : super(key: key);

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Transport',
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
                'Hur du tar dig till Åland',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Var ska jag vara och när?"
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  "Tid: 14:00 (finsk tid)"
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Datum:: 14:00 (finsk tid)"
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Var: Jomala kyrka (Godbyvägen 445, 22150 Jomala)"
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Parkering: Finns i anslutning till kyrkan. Parkera gärna på andra sidan vägen i första hand så det inte är helt fullt på den parkeringen närmast kyrkan vid eventuella andra evenemang de har under helgen."
              ),
            ],
          ),
        ),
      ),
    );
  }
}
