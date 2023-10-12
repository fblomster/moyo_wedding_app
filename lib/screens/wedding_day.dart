import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moyo/rsvp_form.dart';

class WeddingDay extends StatefulWidget {
  const WeddingDay({Key? key}) : super(key: key);

  @override
  State<WeddingDay> createState() => _InsertDataState();
}

class _InsertDataState extends State<WeddingDay> {

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
        title: Text('Bröllopsdagen'),
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
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Välkommen att fira med oss',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
          const Text("Vigsel"),
              const SizedBox(
                height: 30,
              ),
              const Text("Middag & Fest"),
              const SizedBox(
                height: 30,
              ),
              const Text("Brunch"),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  onPressed: () {
                    //Navigator.push(
                      //  context,
                        //MaterialPageRoute(
                          //  builder: (context) => const RSVPInsertData()));
                  },
                  child: const Text('OSA',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}