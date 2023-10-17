import 'package:flutter/material.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {

  final  userNameController = TextEditingController();
  final  userLastnameController= TextEditingController();
  final  userEmailController =TextEditingController();
  final  userPhoneController =TextEditingController();

  playSong() async {
    var res = await SpotifySdk.connectToSpotifyRemote(
        clientId: "28e25b413e3645598c775497a6940f0d",
        redirectUrl: "moyo://spotify/callback",
        scope:
        "app-remote-control,user-modify-playback-state,playlist-read-private");
    print(res);
    var trackId ="0ct6r3EGTcMLPtrXHDvVjc";
    SpotifySdk.play(spotifyUri: "spotify:track:$trackId");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Musik'),
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
        child: const Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              'Spotify',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: playSong,
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
