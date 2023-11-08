import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {

  const UpdateRecord({Key? key, required this.guestKey}) : super(key: key);

  final String guestKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {

  final  userNameController = TextEditingController();
  final  userLastnameController = TextEditingController();
  final  userEmailController= TextEditingController();
  final  userPhoneController =TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Guests');
    getGuestData();
  }

  void getGuestData() async {
    DataSnapshot snapshot = await dbRef.child(widget.guestKey).get();

    Map guest = snapshot.value as Map;

    userNameController.text = guest['name'];
    userLastnameController.text = guest['lastname'];
    userEmailController.text = guest['email'];
    userPhoneController.text = guest['phone'];

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Updating record'),
      ),
      body:  Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Updating data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Förnamn',
                  hintText: 'Skriv ditt namn',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userLastnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Efternamn',
                  hintText: 'Skriv ditt efternamn',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userEmailController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-post',
                  hintText: 'Fyll i din e-postadress',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userPhoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Telefon',
                  hintText: 'Fyll i ditt telefonnummer',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {

                  Map<String, String> guests = {
                    'name': userNameController.text,
                    'lastname': userLastnameController.text,
                    'age': userEmailController.text,
                    'salary': userPhoneController.text
                  };

                  dbRef.child(widget.guestKey).update(guests)
                      .then((value) => {
                    Navigator.pop(context)
                  });

                },
                color: Colors.greenAccent,
                textColor: Colors.black,
                minWidth: 300,
                height: 40,
                child: const Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}