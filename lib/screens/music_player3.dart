import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  final List<String> topGenres = ['Rock', 'Pop', 'Hip-Hop', 'Indie'];
  final List<String> browseAll = [
    'Podcasts',
    'New Releases',
    'Charts',
    'Mood',
    'Workout',
    'Decades',
    'Country',
    'Focus'
  ];
  final List<Color> colors = [
    const Color(0xffF19821),
    const Color(0xff99BACB),
    const Color(0xff498D7C),
    const Color(0xff4E97F2),
    const Color(0xffEFB958),
    const Color(0xffB196C4),
    const Color(0xffF49824),
    const Color(0xffF95F35),
  ];

  SearchTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: const Text("Search",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      )),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).canvasColor,
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                      ),
                    ),
                  )),
            ),
          ];
        },
        body: Container(
          color: Theme.of(context).canvasColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Column(
              children: <Widget>[
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
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_voice,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Your top genres',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio:
                          (MediaQuery.of(context).size.width / (2 * 100)),
                          children: List.generate(4, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      shape: BoxShape.rectangle,
                                      color: colors[index]
                                    // gradient: new LinearGradient(
                                    //   colors: [
                                    //     Colors.blueAccent,
                                    //     Colors.red,
                                    //   ],
                                    //   begin: FractionalOffset.topLeft,
                                    //   end: FractionalOffset.bottomRight,
                                    // ),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(16, 16, 0, 0),
                                    child: Text(
                                      topGenres[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            );
                          }),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Browse all',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio:
                          (MediaQuery.of(context).size.width / (2 * 100)),
                          children: List.generate(browseAll.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      shape: BoxShape.rectangle,
                                      color: colors[index]
                                    // gradient: new LinearGradient(
                                    //   colors: [
                                    //     Colors.blueAccent,
                                    //     Colors.red,
                                    //   ],
                                    //   begin: FractionalOffset.topLeft,
                                    //   end: FractionalOffset.bottomRight,
                                    // ),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(16, 16, 0, 0),
                                    child: Text(
                                      browseAll[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}