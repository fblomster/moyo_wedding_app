
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/text_fields.dart';

class SpeechForm extends StatefulWidget {
  const SpeechForm({Key? key}) : super(key: key);

  @override
  State<SpeechForm> createState() => _SpeechFormState();
}

class _SpeechFormState extends State<SpeechForm> {

  final _formKey = GlobalKey<FormState>();

  /*final  userNameController = TextEditingController();
  final  userLastnameController= TextEditingController();
  final  userEmailController =TextEditingController();
  final  userPhoneController =TextEditingController();
  final  speechCategoryController =TextEditingController();
  final propsController = TextEditingController();
  final timeController = TextEditingController();
  final relationController = TextEditingController();*/

  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  late DatabaseReference dbRef;

  bool _enableBtn = false;
  final bool _checked = false;

  final Uri _email = Uri.parse('mailto:jenny@');

  /*@override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Guests');
  }*/

  /*void clearText() {
    userNameController.clear();
    userLastnameController.clear();
    userEmailController.clear();
    userPhoneController.clear();
    speechCategoryController.clear();
    propsController.clear();
    timeController.clear();
    relationController.clear();
  }*/

  @override
  Widget build(BuildContext context) {
// Build a Form widget using the _formKey created above.
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
              color: Colors.white
          ),
          title: const Text('Tal',
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Om du vill hålla tal, uppträda eller spexa får du gärna anmäla det nedan. Vi ser inte anmälan utan informationen skickas direkt till vår toastmadame Jenny.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Vi har många härliga vänner och familjemedlemmar som är duktiga talare. Vi vill såklart höra alla så tänk på att hålla er relativt kort. 5 minuter brukar vara lagom.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Har du frågor om tal och spex kan du mejla eller ringa vår toastmadame.',
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Jenny Hedlöf',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                '070-1234567',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: _launchEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: const Text('jenny@',
                  style: TextStyle(color: Colors.black),),
              ),
              const SizedBox(
                height: 30,
              ),
              /*Form(
                key: _formKey,
                  child: Column(
                    children: [
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
                        controller: speechCategoryController,
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
                        controller: propsController,
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
                                'allergy': speechCategoryController.text,
                                'comment': propsController.text,
                              };

                              dbRef.push().set(guests);
// If the form is valid, display a snackbar. In the real world,
// you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Tack, ditt meddelande har skickats!')),
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
                ),*/
              Form(
                key: _formKey,
                onChanged: (() {
                  setState(() {
                    _enableBtn = _formKey.currentState!.validate();
                  });
                }),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFields(
                          controller: subjectController,
                          name: "Subject",
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          })),
                      TextFields(
                          controller: emailController,
                          name: "Email",
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          })),
                      TextFields(
                          controller: messageController,
                          name: "Message",
                          validator: ((value) {
                            if (value!.isEmpty) {
                              setState(() {
                                _enableBtn = true;
                              });
                              return 'Message is required';
                            }
                            return null;
                          }),
                          maxLines: null,
                          type: TextInputType.multiline),
                      Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.pressed)) {
                                      return Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.5);
                                    } else if (states.contains(MaterialState.disabled))
                                      return Colors.grey;
                                    return Colors.blue; // Use the component's default.
                                  },
                                ),
                                shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0),
                                    ))),
                            onPressed: _enableBtn
                                ? (() async {
                              final Email email = Email(
                                body: messageController.text,
                                subject: subjectController.text,
                                recipients: [emailController.text],
                                isHTML: false,
                              );
                              await FlutterEmailSender.send(email);
                            })
                                : null,
                            child: const Text('Submit'),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ),
      );
  }

  Future<void> _launchEmail() async {
    if (!await launchUrl(_email)) {
      throw Exception('Could not launch $_email');
    }
  }
}
