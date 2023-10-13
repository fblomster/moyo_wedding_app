import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:moyo/screens/update_record.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FetchData extends StatefulWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {

  Query dbRef = FirebaseDatabase.instance.ref().child('Guests');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Guests');

  Widget listItem({required Map guest}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 80,
      color: Colors.black12,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                guest['name'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                guest['lastname'],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => UpdateRecord(guestKey: guest['key'])));
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  reference.child(guest['key']).remove();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red[700],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/wood-plank-texture-background.jpg'),
            ),
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            //backgroundColor: Colors.transparent,
            title: Text(AppLocalizations.of(context)!.guestList),
          ),
          body: SizedBox(
            height: double.infinity,
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {

                Map guest = snapshot.value as Map;
                guest['key'] = snapshot.key;

                return listItem(guest: guest);

              },
            ),
          )
      ),
    );
  }
}