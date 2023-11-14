import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:moyo/screens/registry.dart';
import 'package:moyo/screens/schedule.dart';
import 'package:moyo/screens/seating.dart';
import 'package:moyo/screens/toastmadame.dart';
import 'package:moyo/screens/transport.dart';
import 'package:moyo/screens/wedding_day.dart';

import '../rsvp_form.dart';
import 'accommodation.dart';
import 'contact.dart';
import 'dinner_menu.dart';
import 'faq_page.dart';
import 'fetch_data.dart';
import 'location.dart';
import 'music_player.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xffc2fedc),
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                  color: Colors.black87),
              accountName: Text(currentUser.displayName!,
                textAlign: TextAlign.justify,
                textScaleFactor: 1.3,),
              accountEmail: Text(currentUser.email!,
                textAlign: TextAlign.justify,
                textScaleFactor: 1.0,),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/jenny.jpg'),
              ),
            ),
            ListTile(
              title: Text(
                  AppLocalizations.of(context)!.weddingDay),
              leading: const Icon(
                  Icons.favorite_border_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        context) => const WeddingDay()));
              },
            ),
            ListTile(
              title: const Text('Schema'),
              leading: const Icon(Icons.schedule_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (
                            context) => const Schedule()));
              },
            ),
            ListTile(
              title: const Text("Brudföljet"),
              leading: const Icon(Icons.people_alt_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        context) => const Toastmadame()));
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
              title: const Text("OSA"),
              leading: const Icon(Icons.mail_lock_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        context) => const RSVPInsertData()));
              },
            ),
            ListTile(
              title: const Text("Karta"),
              leading: const Icon(Icons.map_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (
                            context) => const Location()));
              },
            ),
            ListTile(
              title: const Text("Chatta med oss"),
              leading: const Icon(Icons.chat_bubble_outline),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (
                            context) => const Contact()));
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
              title: const Text("Musik - Spotify"),
              leading: const Icon(Icons.music_note_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        context) => const MusicPlayer()));
              },
            ),
            ListTile(
              title: const Text("Meny - TBA"),
              leading: const Icon(Icons.menu_book_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (
                        context) => const DinnerMenu()));
              },
            ),
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
            /* ListTile(
                     leading: const Icon(Icons.language),
                     title: Text(AppLocalizations.of(context)!.chooseLanguage),
                     onTap: () {
                       Navigator.pop(context);
                     },
                 )*/
          ],
        ),
      ),
    );
  }
}