import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.guestKey}) : super(key: key);

  final String guestKey;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Profil',
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
          Row(
            children: [
              Text(userNameController.text,
                style: const TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(userLastnameController.text,
                style: const TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
              SizedBox(
                height: 30,
              ),
              Text(userNameController.text),
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
            ],
          ),
        ),
      ),
    );
  }
}