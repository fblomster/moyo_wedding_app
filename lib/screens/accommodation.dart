import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Accommodation extends StatefulWidget {
  const Accommodation({Key? key}) : super(key: key);

  @override
  State<Accommodation> createState() => _AccommodationState();
}

class _AccommodationState extends State<Accommodation> {

  final Uri _url = Uri.parse('https://silverskar.ax');
  final Uri _email = Uri.parse('mailto:info@silverskar.ax?subject=News&body=New%20plugin');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Boende',
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Övernatta på Silverskär',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white,
                  margin: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/view_silverskar.jpg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "Silverskär ligger i Ålands norra skärgård och består av fyra öar; Silverskär, Klobben, Sviskär och Champagne Island."
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _launchUrl,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('Bekanta dig med Silverskär',
                    style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                    "Med tanke på att vi har valt att fira vår bröllopsdag på en avlägsen plats hoppas vi att de flesta av er väljer att övernatta på ön tillsammans med oss."),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                    "På Silverskär kan upp till 52 personer övernatta, utöver det kan upp till 40 personer övernatta i charmiga stugor på Klobben."
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                    "Bröllopsfestligheterna avrundas på söndagen med en gemensam skärgårdsbrunch."
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Boka övernattning på Silverskär genom att maila dem direkt.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _launchEmail,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('info@silverskar.ax',
                    style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Övrigt boende',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "Om det är någon som vill bo på fasta Åland eller kanske kommer någon dag innan bröllopet så finns flera trevliga hotell i Mariehamn."
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _launchUrl,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('Strandnäs Hotell',
                    style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _launchUrl,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text('Kvarnbo Pensionat',
                    style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchEmail() async {
    if (!await launchUrl(_email)) {
      throw Exception('Could not launch $_email');
    }
  }
}
