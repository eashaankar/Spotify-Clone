// @dart=2.9
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/player.dart';
import 'package:we_slide/we_slide.dart';
import 'custom_card.dart';

class Home extends StatefulWidget {
  final Function onTap;

  Home({Key key, this.onTap}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = ScrollController();
  ValueNotifier<double> _opacity = ValueNotifier<double>(1.0);
  List songs = [];

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/songs.json")
        .then((s) {
      setState(() {
        songs = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_opacity.value == 1.0 && _controller.offset > 20) {
        _opacity.value = 0.0;
      } else if (_opacity.value == 0.0 && _controller.offset < 20) {
        _opacity.value = 1.0;
      }
    });
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    final WeSlideController _controller = WeSlideController();
    final size = MediaQuery.of(context).size;
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Hi Eashaankar 👋",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    CustomCard(
                      title: "Album",
                      icon: Icon(Icons.album),
                      colorbegin: Colors.redAccent,
                      colorend: Colors.pinkAccent,
                      //ontap: onTap,
                    ),
                    CustomCard(
                      title: "Playlist",
                      icon: Icon(Icons.playlist_play_rounded),
                      colorbegin: Colors.lightBlueAccent,
                      colorend: Colors.yellowAccent,
                      //ontap: onTap,
                    ),
                    CustomCard(
                      title: "Favourite",
                      icon: Icon(Icons.favorite),
                      colorbegin: Colors.orangeAccent,
                      colorend: Colors.purpleAccent,
                      //ontap: onTap,
                    ),
                    CustomCard(
                      title: "My Library",
                      icon: Icon(Icons.library_music),
                      colorbegin: Colors.blueGrey,
                      colorend: Colors.lightBlue,
                      //ontap: onTap,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                    shrinkWrap: true,
                    //scrollDirection: Axis.vertical,
                    itemCount: songs == null ? 0 : songs.length,
                    itemBuilder: (_, i) {
                      return InkWell(
                        highlightColor: Colors.lightGreen,
                        splashColor: Colors.green,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Player(
                                    onTap: _controller.show,
                                    songsData: songs,
                                    index: i)),
                          );
                        },
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(songs[i]["img"]),
                          ),
                          title: Text(
                            songs[i]["name"],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            songs[i]["artist"],
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF57D780),
              Color(0xFF141b2d),
            ]),
      ),
    );
  }
}
