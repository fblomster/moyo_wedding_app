
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moyo/screens/notifications.dart';
import 'package:moyo/services/api/firebase_api.dart';
import 'package:moyo/services/auth/auth_gate.dart';
import 'package:moyo/services/auth/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:moyo/provider/locale_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future handleMessage (RemoteMessage message) async {
  // if the message is null, do nothing
  if (message.notification != null) {
    print('some notification received');//return;
  }

  //navigate to new screen when message is received and user taps notification
  navigatorKey.currentState!.pushNamed(
      '/notification_page',
      arguments: message);
}

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print('Background notification tapped');
      navigatorKey.currentState!.pushNamed(
          '/notification_page',
          arguments: message);
    }
  });

  FirebaseApi().initNotifications();
  FirebaseMessaging.onBackgroundMessage(handleMessage);
  //await FirebaseMessaging.instance.setAutoInitEnabled(true);
  //final fcmToken = await FirebaseMessaging.instance.getToken();
  // log("FCMToken $fcmToken");
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<LocaleProvider>(
            create: (context) => LocaleProvider(),
          ),
          ChangeNotifierProvider<AuthService>(
            create: (context) => AuthService() ,
          ),
        ],
        child: const MyApp(),
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
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            //title: 'moyo Wedding App',
            locale: Provider.of<LocaleProvider>(context).locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              fontFamily: 'Literata',
              // This is the theme of your application.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent, onPrimary: Colors.greenAccent,
                  background: const Color(0xffD8CFB9)),
              useMaterial3: true,
            ),
            home: const AuthGate(),
            routes: {
              '/notification_page': (context) => const NotificationPage(),
            },//const MyHomePage(title: 'moyo Wedding App'),
          );
        });
  }
}