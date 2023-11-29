import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RSVPInsertData extends StatefulWidget {
  const RSVPInsertData({Key? key}) : super(key: key);

  @override
  State<RSVPInsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<RSVPInsertData> {

  final _formKey = GlobalKey<FormState>();

  final  userNameController = TextEditingController();
  final  userLastnameController= TextEditingController();
  final  userEmailController =TextEditingController();
  final  userPhoneController =TextEditingController();
  final  userAllergyController =TextEditingController();
  final userCommentController = TextEditingController();
  final descriptionController = TextEditingController();

  late DatabaseReference dbRef;

  bool _checked = false;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Guests');
  }

  void clearText() {
    userNameController.clear();
    userLastnameController.clear();
    userEmailController.clear();
    userPhoneController.clear();
    userAllergyController.clear();
    userCommentController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
// Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
              color: Colors.white
          ),
          title: const Text('OSA',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
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
                        height: 8,
                      ),
                      const Text(
                        'Vi ber om att ta emot ditt svar senast den XX XX 2024.',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      /*TextFormField(
// The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ditt för- och efternamn',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),*/
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: userNameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Förnamn',
                          hintText: 'Skriv ditt förnamn',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
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
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: userEmailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-post',
                          hintText: 'Fyll i din e-postadress',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
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
                      TextFormField(
                        controller: userAllergyController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ev. allergier',
                          hintText: 'Ange önskemål om specialkost',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: userCommentController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Övriga kommentarer (ange här om spädbarn medföljer)',
                          hintText: 'Annat viktigt att informera oss om',
                        ),
                        maxLines: 3,
                        minLines: 1,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Beskrivning',
                          hintText: 'Berätta kort (eller långt) om din relation till brudparet',
                        ),
                        maxLines: 3,
                        minLines: 1,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CheckboxListTile(
                        checkColor: Colors.black,
                            activeColor: Colors.white38,
                            title: const Text('Jag godkänner att mitt namn och beskrivning av hur jag känner brudparet får synas på gästlistan i denna app efter att jag har tackat ja till inbjudan.'),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _checked,
                            onChanged:(bool? value) {
                              setState(() {
                                _checked = value!;
                              });
                            },
                          ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                          ),
                          onPressed: () {


// Validate returns true if the form is valid, or false otherwise.
                           // if (_formKey.currentState!.validate()) {
// If the form is valid, display a snackbar. In the real world,
// you'd often call a server or save the information in a database.
                            if (_formKey.currentState!.validate()) {
                              Map<String, String> guests = {
                                'name': userNameController.text,
                                'lastname': userLastnameController.text,
                                'email': userEmailController.text,
                                'phone': userPhoneController.text,
                                'allergy': userAllergyController.text,
                                'comment': userCommentController.text,
                                'description': descriptionController.text,
                                'guestlist_approved': _checked.toString(),
                              };

                              dbRef.push().set(guests);
// If the form is valid, display a snackbar. In the real world,
// you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Tack för ditt svar! Vi ser fram emot att ses i juni!')),
                              );
                            }
                            clearText();
                          },
                            child: const Text('Skicka',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
