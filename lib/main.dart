import 'package:flutter/material.dart';
import 'package:moyo/l10n/supported_locale.dart';
import 'package:moyo/model/language_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:moyo/provider/locale_provider.dart';
import 'package:moyo/rsvp_form.dart';
import 'package:moyo/rsvp_form2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:moyo/screens/insert_data.dart';
import 'package:moyo/screens/fetch_data.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider<LocaleProvider>(
          create: (context) => LocaleProvider(),
  child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
        builder: (context, appState, child){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'moyo Wedding App',
        locale: Provider.of<LocaleProvider>(context).locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          // This is the theme of your application.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent,
              background: const Color(0xffD8CFB9)),
          useMaterial3: true,
        ),
        /*localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.support,*/
        home: const MyHomePage(title: 'moyo Wedding App'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  LanguageModel? _chosenValue;
  List<LanguageModel> _languages = List.empty(growable: true);

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState(){
    super.initState();
    _languages.add(LanguageModel(code: 'sv', name: 'SV'));
    _languages.add(LanguageModel(code: 'en', name: 'EN'));
    _languages.add(LanguageModel(code: 'fi', name: 'FI'));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    String selectedValue = "SV";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          extendBodyBehindAppBar: true,
      appBar: AppBar(
        //leading: const Icon(Icons.language),
        //title: const Text('Välj språk'),
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,//const Color(0xffE0C9A6), //Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        elevation: 0.0,
        actions: [
          Row(
            children: <Widget>[
              Icon(Icons.language),
              const SizedBox(width: 8.0,),
              DropdownButton<LanguageModel>(
                //decoration: const InputDecoration(
                  //prefixIcon: Icon(Icons.language)
                //),
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  items: _languages
                  .map<DropdownMenuItem<LanguageModel>>((LanguageModel value) {
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
                      Provider.of<LocaleProvider>(context, listen: false).setLocale(
                          Locale(newValue.code!));
                    });
                },
        ),
            ],
          ),
      ],
      ),
     drawer: Drawer(
       child: ListView(
         children: <Widget>[
           const DrawerHeader(
             decoration: BoxDecoration(color: Colors.greenAccent),
             child: Text(
               "Hej vänner!!",
               textAlign: TextAlign.justify,
               textScaleFactor: 2.0,
             ),
           ),
           ListTile(
             title: Text(AppLocalizations.of(context)!.accommodation),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: Text(AppLocalizations.of(context)!.transport),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: Text(AppLocalizations.of(context)!.guestList),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: Text(AppLocalizations.of(context)!.registry),
             onTap: () {
               Navigator.pop(context);
             },
           ),
             ListTile(
               leading: const Icon(Icons.language),
               title: Text(AppLocalizations.of(context)!.chooseLanguage),
               onTap: () {
                 Navigator.pop(context);
               },
           )
         ],
       ),
     ),
      body: TabBarView(
    children: [//Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        //child:
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/wood-plank-texture-background.jpg'),
            ),
            ),
            child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            //
            // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
            // action in the IDE, or press "p" in the console), to see the
            // wireframe for each widget.
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Frida & Jonas',
                style: TextStyle(
                  fontFamily: 'Literata',
                  fontSize: 26,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.weddingDate,
                style: TextStyle(
                  fontFamily: 'Literata',
                  fontSize: 18,
                ),
              ),
            /*  Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),*/
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                margin: const EdgeInsets.all(20.0),
                child: Image.asset('assets/kiss_filtered_blurred3.jpg'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: (){
                  print('Clicked!');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: Text(AppLocalizations.of(context)!.inviteButton,
                style: const TextStyle(color: Colors.black)),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InsertData()));
                },
                child: const Text('OSA'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FetchData()));
                },
                child: const Text('Gästlista'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
        ),
          ),
      Icon(Icons.directions_bike),
      const MyRSVPForm(),
      const RSVPInsertData(),
    ]),

   /*   floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
          bottomNavigationBar:   menu(),
      // This trailing comma makes auto-formatting nicer for build methods.
    ),
    ),
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

/*List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Svenska", child: Text("Svenska")),
    const DropdownMenuItem(value: "English", child: Text("English")),
  ];
  return menuItems;
}*/
