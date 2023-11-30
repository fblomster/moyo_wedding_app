import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class WeddingDay extends StatefulWidget {
  const WeddingDay({Key? key}) : super(key: key);

  @override
  State<WeddingDay> createState() => _WeddingDayState();
}

class _WeddingDayState extends State<WeddingDay> {

  final  userNameController = TextEditingController();
  final  userLastnameController= TextEditingController();
  final  userEmailController =TextEditingController();
  final  userPhoneController =TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Guests');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Bröllopsdagen',
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
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  'Välkommen på',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Bröllop',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 6,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Datum: 15 juni 2024',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Tid: 14:00',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Klädsel: Kavaj och bekväma skor',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
            Text("Vigsel",
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
                SizedBox(
                  height: 10,
                ),
                Text("Den 15 juni 2024 gifter vi oss i Jomala kyrka, Åland och vi önskar att dela dagen med Er. Vigseln börjar kl. 14:00 och efterföljande middag och dans på ön Silverskär. Busstransport ordnas från kyrkan."),
                SizedBox(
                  height: 30,
                ),
                Text("Middag & Fest",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Vid ankomst till ön bjuds alla på Silverskärs traditionsenliga Ålandspannkaka och snaps."),
                SizedBox(
                  height: 30,
                ),
                Text("Brunch söndag 16 juni",
                  style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Vi hoppas att ni som övernattar får några timmars god sömn i era fina rum innan vi avslutar festhelgen men en härlig brunch. Det kan vara trevligt att avrunda kvällen vid den fina bastualtanen med två bastur, jacuzzi och trevliga relaxutrymmen, alternativt som morgonbastu!"),
                SizedBox(
                  height: 10,
                ),
                Text("Barnfritt"),
                Text("Namn på brudparet"),
                Text("OSA-datum samt till vem och vem man meddelar om tal/spex"),
                Text("Vägbeskrivning / övernattning"),
                Text("Infoblad om att ta ner appen (hur, varför)"),
                Text("Info i FAQ om klädsel"),
              ],
            ),
          ),
        ),
      ),
      //bottomNavigationBar:   menu(),
    );
  }
}
Widget menu() {
  return Container(
    color: Colors.black87,// const Color(0xFF3F5AA6),
    child: const TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Colors.greenAccent,
      tabs: [
        Tab(
          text: "Boende",
          icon: Icon(Icons.hotel),
        ),
        Tab(
          text: "Transport",
          icon: Icon(Icons.bus_alert),
        ),
        Tab(
          text: "Info",
          icon: Icon(Icons.info),
        ),
        Tab(
          text: "OSA",
          icon: Icon(Icons.mail),
        ),
      ],
    ),
  );
}