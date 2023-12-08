import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.guestKey}) : super(key: key);

  final String guestKey;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final userNameController = TextEditingController();
  final userLastnameController = TextEditingController();
  final userDescriptionController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Guests');
    //getGuestData();
  }

  /*void getGuestData() async {
    DataSnapshot snapshot = await dbRef.child(widget.guestKey).get();

    Map guest = snapshot.value as Map;

    userNameController.text = guest['name'];
    userLastnameController.text = guest['lastname'];
    userEmailController.text = guest['email'];
    userPhoneController.text = guest['phone'];

  }*/

  Future<Map> getGuestData() async {
    DataSnapshot snapshot = await dbRef.child(widget.guestKey).get();
    Map guest = snapshot.value as Map;
    return guest;
  }

  /*Future uploadProfilePicture(User user, File profilePicture) async {
    UploadTask uploadTask = _storage
        .ref()
        .child('userProfilePictures/${user.uid}/profilePicture.jpg')
        .putFile(profilePicture);

    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    String downloadURL = await taskSnapshot.ref.getDownloadURL();

    return downloadURL;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black87,
        //elevation: 0.0,
      ),
      body: FutureBuilder(
          future: getGuestData(),
          builder: (context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While waiting for data, you can show a loading indicator.
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // If an error occurs, you can handle it here.
              return Text('Error: ${snapshot.error}');
            } else {
              // If data is available, update the UI with the fetched data.
              Map guest = snapshot.data!;
              userNameController.text = guest['name'];
              userLastnameController.text = guest['lastname'];
              userDescriptionController.text = guest['description'];

              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    // using Image.network to load an image from the network
                    //image: Image.network('${data['profilePictureURL']}')
                    image:
                        AssetImage('assets/wood-plank-texture-background.jpg'),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/jenny.jpg'),
                            radius: 40.0,
                          ),
                        ),
                        const Divider(
                          height: 60.0,
                          color: Colors.greenAccent,
                        ),
                        const Text(
                          'Namn',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              userNameController.text,
                              style: const TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              userLastnameController.text,
                              style: const TextStyle(
                                letterSpacing: 2.0,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'Beskrivning',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                                child: Text(
                                  userDescriptionController.text,
                                  style: const TextStyle(
                                    //: 2.0,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                        /*const SizedBox(
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
                        ),*/
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
