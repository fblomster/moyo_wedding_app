import 'package:flutter/material.dart';

class DinnerMenu extends StatefulWidget {
  const DinnerMenu({Key? key}) : super(key: key);

  @override
  State<DinnerMenu> createState() => _DinnerMenuState();
}

class _DinnerMenuState extends State<DinnerMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Schema',
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
                    'Bröllopsmeny',
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
                      "Traditionell pärta med fyra åländska hemgjorda smakbitar"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Åländsk ryggbiff serveras med rostad lökpuré, hemkokt sky, nypotatis och sommarprimörer"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Liten ostassiett med åländska ostar"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Grannasjuice-inkokt rabarber med hemgjord glass och anissmaksatt kryddflarn"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Kaffe, avec"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Nattmatspajer med olika smaker, sallad och dressing"
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
