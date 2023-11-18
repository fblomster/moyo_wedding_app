import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:moyo/models/music.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final player = AudioPlayer();
  Music music = Music(trackId: '7MXVkk9YMctZqd1Srtv4MB');

  playSong() async {
    /*var res = await SpotifySdk.connectToSpotifyRemote(
        clientId: "28e25b413e3645598c775497a6940f0d",
        redirectUrl: "moyo://callback",
        scope:
        "app-remote-control,user-modify-playback-state,playlist-read-private");
    print(res);*/
    var trackId1 = "0ct6r3EGTcMLPtrXHDvVjc";
    SpotifySdk.play(spotifyUri: "spotify:track:$trackId1");
  }

  @override
  void initState() {
    var res = SpotifySdk.connectToSpotifyRemote(
        clientId: "28e25b413e3645598c775497a6940f0d",
        redirectUrl: "moyo://callback",
        scope:
        "app-remote-control,user-modify-playback-state,playlist-read-private");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.white
        ),
        title: const Text('Musik',
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
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.close, color: Colors.transparent),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Playing Now',
                            style: textTheme.bodyMedium
                                ?.copyWith(color: const Color(0xFF1BB751)),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: music.artistImage != null
                                    ? NetworkImage(music.artistImage!)
                                    : null,
                                radius: 10,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                music.artistName ?? '-',
                                style: textTheme.bodyLarge
                                    ?.copyWith(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                      const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ],
                  ),
                 /* Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                            'image'), //ArtWorkImage(image: music.songImage),
                      )),*/
                  Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    music.songName ?? '',
                                    style: textTheme.titleLarge
                                        ?.copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    music.artistName ?? '-',
                                    style: textTheme.titleMedium
                                        ?.copyWith(color: Colors.white60),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Color(0xFF1BB751),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          StreamBuilder(
                              stream: player.onPositionChanged,
                              builder: (context, data) {
                                return ProgressBar(
                                  progress: data.data ?? const Duration(seconds: 30),
                                  total: music.duration ?? const Duration(
                                      minutes: 4),
                                  bufferedBarColor: Colors.white38,
                                  baseBarColor: Colors.white10,
                                  thumbColor: Colors.white,
                                  timeLabelTextStyle:
                                  const TextStyle(color: Colors.white),
                                  progressBarColor: Colors.white,
                                  onSeek: (duration) {
                                    player.seek(duration);
                                  },
                                );
                              }),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    /*Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LyricsPage(music: music, player: player,)));*/
                                  },
                                  icon: const Icon(Icons.lyrics_outlined,
                                      color: Colors.white)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.skip_previous,
                                      color: Colors.white, size: 36)),
                              IconButton(
                                  onPressed: () async {
                                    if (playSong().state == PlayerState.playing) {
                                      await player.pause();
                                    } else {
                                      await player.resume();
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    player.state == PlayerState.playing
                                        ? Icons.pause
                                        : Icons.play_circle,
                                    color: Colors.white,
                                    size: 60,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.skip_next,
                                      color: Colors.white, size: 36)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.loop,
                                      color: Color(0xFF1BB751))),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.white,
                                    ),
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                          EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
                                          child: Icon(Icons.search),
                                        ),
                                        Text('Artists,Songs or Podcasts',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  )
                ],
              ),
            ),
          ),

      /*floatingActionButton: FloatingActionButton(
        onPressed: playSong,
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ),*/
    );
  }
}
      /*body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/wood-plank-texture-background.jpg'),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFe63946), Colors.black.withOpacity(0.6)],
                    stops: [0.0, 0.4],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    tileMode: TileMode.repeated)),
            child: const CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  title: Text(
                    'My Awesome Playlist',
                  ),
                  centerTitle: true,
                ),
              ],
            ),
          ),
        ),*/
        /*const Column(
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
}*/
