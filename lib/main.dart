import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'moyo Wedding App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, background: const Color(0xffD8CFB9)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'moyo Wedding App'),
    );
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
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Colors.transparent,//const Color(0xffE0C9A6), //Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,
        style: const TextStyle(
          fontFamily: 'Literata',
          fontSize: 32.0,
        )),
        centerTitle: true,
      ),
     drawer: Drawer(
       child: ListView(
         children: <Widget>[
           const DrawerHeader(
             decoration: BoxDecoration(color: Colors.green),
             child: Text(
               "Hello Andy!!",
               textAlign: TextAlign.justify,
               textScaleFactor: 2.0,
             ),
           ),
           ListTile(
             title: const Text("First"),
             onTap: () {
               Navigator.pop(context);
             },
           ),
           ListTile(
             title: const Text("Second"),
             onTap: () {
               Navigator.pop(context);
             },
           )
         ],
       ),
     ),
     /*   body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: const <Widget>[],
              title: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: const TabBarView(
              children: [
                Icon(Icons.directions_car,size: 50.0,),
                Icon(Icons.directions_transit,size: 50.0,),
                Icon(Icons.directions_bike,size: 50.0,),
              ],
            ),
          ),
        ),*/
      body: //Center(
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
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(),
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                margin: const EdgeInsets.all(20.0),
                child: Image.asset('assets/kiss1.jpg'),
              ),
              const Icon(
                Icons.airport_shuttle,
                size: 50,
              ),
              ElevatedButton(
                onPressed: (){
                  print('Clicked!');
                },
                child: const Text('Click me'),
              ),
            ],
        ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: menu(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget menu() {
  return Container(
    color: const Color(0xFF3F5AA6),
    child: const TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.all(5.0),
      indicatorColor: Colors.blue,
      tabs: [
        Tab(
          text: "Transactions",
          icon: Icon(Icons.euro_symbol),
        ),
        Tab(
          text: "Bills",
          icon: Icon(Icons.assignment),
        ),
        Tab(
          text: "Balance",
          icon: Icon(Icons.account_balance_wallet),
        ),
        Tab(
          text: "Options",
          icon: Icon(Icons.settings),
        ),
      ],
    ),
  );
}