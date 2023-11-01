import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {


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
                    'Schema för dagen',
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
                      "14:00 Vigsel i Jomala kyrka"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "14:45/15:00 Busstransport från kyrkan vidare till hamnen Skatan"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "15:30 Båttransfer över till Silverskär"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "16:00 Välkomstpannkaka och snaps"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "16:30 Incheckning för de som övernattar på Silverskär (Klobben-gäster får skjuts efter festligheterna med båt, väskförvaring."
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "17:15 Brudskål"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "17:30 Middag"
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "XX:00 Tårta??"
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Nattmat? Bastu? När ska turerna till land gå? Barnvakter åka över?"
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
