
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moyo/models/language_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moyo/screens/bridal_party.dart';
import 'package:moyo/screens/contact.dart';
import 'package:moyo/screens/contact_details.dart';
import 'package:moyo/screens/dinner_menu.dart';
import 'package:moyo/screens/faq_page.dart';
import 'package:moyo/screens/location.dart';
import 'package:moyo/screens/notifications.dart';
import 'package:moyo/screens/registry.dart';
import 'package:moyo/screens/schedule.dart';
import 'package:moyo/screens/seating.dart';
import 'package:moyo/screens/speech_form.dart';
import 'package:moyo/screens/transport.dart';
import 'package:moyo/utils.dart';
import 'package:provider/provider.dart';
import 'package:moyo/provider/locale_provider.dart';
import 'package:moyo/rsvp_form.dart';
import 'package:moyo/screens/wedding_day.dart';
import 'package:moyo/screens/accommodation.dart';
import 'package:moyo/screens/music_player.dart';
import 'package:moyo/screens/fetch_data.dart';
import '../services/auth/auth_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LanguageModel? _chosenValue;
  final List<LanguageModel> _languages = List.empty(growable: true);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  final currentUser = FirebaseAuth.instance.currentUser!;

  Uint8List? _image;

  //bool isVisible = false;

  //sign user out
  void signOut() {
    //get auth service
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }

  @override
  void initState() {
    super.initState();
    _languages.add(LanguageModel(code: 'sv', name: 'SV'));
    _languages.add(LanguageModel(code: 'en', name: 'EN'));
    _languages.add(LanguageModel(code: 'fi', name: 'FI'));
  }

  Future<void> selectImage () async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });

  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String selectedValue = "SV";
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        fontFamily: 'Nexa'),
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              //const Color(0xffE0C9A6), //Theme.of(context).colorScheme.inversePrimary,
              elevation: 0.0,
              actions: [
                Row(
                  children: <Widget>[
                    const Icon(Icons.language),
                    const SizedBox(width: 8.0,),
                    DropdownButton<LanguageModel>(
                      //decoration: const InputDecoration(
                      //prefixIcon: Icon(Icons.language)
                      //),
                      dropdownColor: Colors.white,
                      iconEnabledColor: Colors.white,
                      items: _languages
                          .map<DropdownMenuItem<LanguageModel>>((
                          LanguageModel value) {
                        return DropdownMenuItem<LanguageModel>(
                          value: value,
                          child: Text(
                            value.name!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        AppLocalizations.of(context)!.chooseLanguage,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      onChanged: (LanguageModel? newValue) {
                        setState(() {
                          _chosenValue = newValue!;
                          Provider.of<LocaleProvider>(context, listen: false)
                              .setLocale(
                              Locale(newValue.code!));
                        });
                      },
                    ),
                    //sign out button
                    IconButton(
                        onPressed: signOut, icon: const Icon(Icons.logout)),
                  ],
                ),
              ],
            ),
            drawer: /*FutureBuilder<Map<String, dynamic>>(
                future: _fetchUserData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    //loading indicatior while Future builds
                    return const Drawer(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    //display error message if Future has errors
                    return Drawer(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  else {
                    Map<String, dynamic>? userData = snapshot.data;
                    return*/ SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.75,
              child: Drawer(
                //backgroundColor: Colors.white,
                child: Container(
                  color: Color(0xffd6eadf),//Color(0xfff9dcc5),//const Color(0xffB4C3BE), //Colors.black26,//(0xffc2fedc),
                  child: ListView(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(
                            color: Colors.black),
                        accountName: const Text('',
                          textAlign: TextAlign.justify,
                          textScaleFactor: 1.3,),
                        accountEmail: Text(currentUser.email!,
                          textAlign: TextAlign.justify,
                          textScaleFactor: 1.0,),
                        currentAccountPicture:
                        Stack(
                          children: [
                            _image != null ?
                                CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                ) :
                             const CircleAvatar(
                              radius: 64,
                              backgroundImage: AssetImage(
                                  'assets/no-profile-picture.png'),
                            ),
                        Positioned(
                          bottom: -10,
                          left: 40,
                          child: IconButton(onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo,
                        color: Color(0xffd6eadf),)),
                      ),
                          ],
                        ),
                      ),
                      /*Container(
                        //color: Colors.red,
                        child: ListTile(
                          title: Text(AppLocalizations.of(context)!.weddingDay),
                          leading: const Icon(
                              Icons.favorite_border_outlined),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (
                                    context) => const WeddingDay()));
                          },
                        ),
                      ),*/
                      ListTile(
                        title: const Text('I N B J U D A N'),
                        leading: const Icon(Icons.favorite_border_outlined),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (
                                  context) => const WeddingDay()));
                        },
                      ),
               ExpansionTile(
                          title: const Text('V I K T I G  I N F O'),
                        leading: const Icon(Icons.info_outline),
                        children: [
                          Column(
                            children: [
                              /*ListTile(
                                title: Text(AppLocalizations.of(context)!.weddingDay),
                                leading: const Icon(
                                    Icons.favorite_border_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const WeddingDay()));
                                },
                              ),*/
                              ListTile(
                                title: const Text("Brudföljet"),
                                leading: const Icon(Icons.people_alt_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const BridalParty()));
                                },
                              ),
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!
                                        .accommodation),
                                leading: const Icon(Icons.hotel_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const Accommodation()));
                                },
                              ),
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.transport),
                                leading: const Icon(Icons.bus_alert_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const Transport()));
                                },
                              ),
                              ListTile(
                                title: const Text("K A R T A"),
                                leading: const Icon(Icons.map_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const Location()));
                                },
                              ),
                            ],
                          ),
                        ],),
             ExpansionTile(
               title: const Text('M I D D A G  &  F E S T'),
                        leading: const Icon(Icons.dinner_dining_outlined),
                        children: [
                          Column(
                            children: [
                              ListTile(
                                title: const Text('S C H E M A'),
                                leading: const Icon(Icons.schedule_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const Schedule()));
                                },
                              ),

              //if _fireStore.collection('users').doc(user!.uid).collection.get() data['role'] != 'guest' ?
              ListTile(
                                title: const Text("Meny - TBA"),
                                leading: const Icon(Icons.menu_book_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const DinnerMenu()));
                                },
                              ), //: Container(),
                              ListTile(
                                title: const Text("Bordsplacering - TBA"),
                                leading: const Icon(Icons.table_bar_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const Seating()));
                                },
                              ),
                              ListTile(
                                title: const Text("Quiz - TBA"),
                                leading: const Icon(Icons.quiz_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const Accommodation()));
                                },
                              ),
                            ],
                          ),
                        ],),
                /*const ExpansionTile(title: Text('V I G S E L'),
                    leading: Icon(Icons.favorite_border_outlined),
                    children: [
                    Column(
                    ),
                    ],),*/
                /*ListTileTheme(
                  tileColor: Colors.greenAccent,
                  iconColor: Colors.black87,
                  textColor: Colors.black87,
                  child: Theme(
                    data: ThemeData(
                      colorScheme: ColorScheme.fromSeed(
                        primary: Colors.white,
                        seedColor: Colors.white,
                      ),
                    ),
                    child:*/ ExpansionTile(title: const Text('Ö V R I G T'),
                        leading: const Icon(Icons.question_answer_outlined),
                        children: [
                          Column(
                            children: [
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.guestList),
                                leading: const Icon(
                                    Icons.people_outline_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const FetchData()));
                                },
                              ),
                              ListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.registry),
                                leading: const Icon(Icons.list_alt_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const Registry()));
                                },
                              ),
                              ListTile(
                                title: const Text('Notiser'),
                                leading: const Icon(Icons.chat_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const NotificationPage()));
                                },
                              ),
                              ListTile(
                                title: const Text("FAQ"),
                                leading: const Icon(Icons.info_outline),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const FaqPage()));
                                },
                              ),
                              ListTile(
                                title: const Text("Musik"),
                                leading: const Icon(Icons.music_note_outlined),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (
                                          context) => const MusicPlayer()));
                                },
                              ),
                            ],
                          ),
                        ],),
                      ListTile(
                        title: const Text("O S A"),
                        leading: const Icon(Icons.mail_lock_outlined),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (
                                  context) => const RSVPInsertData()));
                        },
                      ),
                      ExpansionTile(
                          iconColor: Colors.white,
                          title: const Text('K O N T A K T'),
                          leading: const Icon(Icons.phone_outlined),
                          children: [
                            Column(
                              children: [
                                ListTile(
                                title: const Text("C H A T T A  med oss"),
                                leading: const Icon(Icons.chat_bubble_outline),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (
                                              context) => const Contact()));
                                },
                              ),
                                ListTile(
                                  title: const Text("K O N T A K T U P P G I F T E R"),
                                  leading: const Icon(Icons.email_outlined),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (
                                                context) => const ContactDetails()));
                                  },
                                ),
                                ListTile(
                                  title: const Text("T A L",),
                                  leading: const Icon(Icons.list_outlined),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(
                                            builder: (
                                                context) => const SpeechForm()));
                                  },
                                ),
                              ],
                            ),
                          ],),
                      const Divider(
                        height: 80,
                        color: Colors.black54,
                      ),
              ListTile(
                          title: const Text("L O G G A  U T",
                          style: TextStyle(
                              //fontWeight: FontWeight.bold
                          ),
                          ),
                          leading: const Icon(Icons.logout),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (
                                    context) => const Accommodation()));
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ),

            body:
            TabBarView(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'assets/wood-plank-texture-background.jpg'),
                      ),
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'Frida & Jonas',
                            style: TextStyle(
                              fontSize: 26,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.weddingDate,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            color: Colors.white,
                            margin: const EdgeInsets.all(20.0),
                            child: Image.asset(
                                'assets/kiss_filtered_blurred3.jpg'),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (
                                      context) => const WeddingDay()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffadd5bf),//const Color(0xfff3c3b0),//(0xffbbad2b8), //Colors.greenAccent,
                            ),
                            child: Text(AppLocalizations.of(context)!
                                .weddingDay,
                                style: const TextStyle(color: Colors.black)),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                  ),
                  const WeddingDay(),
                  const Accommodation(),
                  const RSVPInsertData(),
                ]),
            bottomNavigationBar: menu(),
          ),
        )
    );
  }

  Future<Map<String, dynamic>> _fetchUserData() async {
    User? user = _firebaseAuth.currentUser;

    if (user != null) {
      try {
        // Fetch additional user data from Firestore
        DocumentSnapshot userDocument = await FirebaseFirestore.instance
            .collection(
            'Guests')
            .doc(user.uid)
            .get();

        if (userDocument.exists) {
          // Map the user data to a Map<String, dynamic>
          Map<String, dynamic> userData = userDocument.data() as Map<
              String,
              dynamic>;
          return userData;
        } else {
          // Return default values if the document doesn't exist
          return {'name': 'Unknown', 'email': 'Unknown'};
        }
      } catch (e) {
        // Handle any errors that might occur during the data fetching process
        print('Error fetching user data: $e');
        return {'name': 'Unknown', 'email': 'Unknown'};
      }
    } else {
      // User is not signed in
      return {'name': 'Guest', 'email': 'guest@example.com'};
    }
  }

  Widget menu() {
    return Container(
      color: Colors.black87, // const Color(0xFF3F5AA6),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: const EdgeInsets.all(5.0),
        indicatorColor: Color(0xff84c1a0),//Color(0xffdb6551),//Color(0xffbbad2b8),
        tabs: [
          const Tab(
            text: "Hem",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: AppLocalizations.of(context)!.inviteButton,
            icon: const Icon(Icons.insert_invitation_outlined),
          ),
          Tab(
            text: AppLocalizations.of(context)!.accommodation,
            icon: const Icon(Icons.hotel),
          ),
          Tab(
            text: AppLocalizations.of(context)!.rsvp,
            icon: const Icon(Icons.mail),
          ),
        ],
      ),
    );
  }
}