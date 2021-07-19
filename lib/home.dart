import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/miniplayer.dart';
import 'package:music_player/player.dart';
import 'package:we_slide/we_slide.dart';

class Home extends StatefulWidget {


  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List songs = [];

  ReadData() async{
    await DefaultAssetBundle.of(context).loadString("json/songs.json").then((s) {
      setState(() {
        songs = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    final WeSlideController _controller = WeSlideController();
    final size = MediaQuery.of(context).size;
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: ListView.builder(
          itemCount: songs == null ? 0 : songs.length,
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () {
                MiniPlayer(onTap: _controller.show, songsData: songs, index: i);
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Player(onTap: _controller.show,songsData: songs,index: i)),
                );
                //globals.isPause = false;
                //globals.advancedPlayer.play(songs[i]["audio"]);
                //globals.advancedPlayer.play(globals.path);
               // globals.flag = 1;
                //print("tapped");
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(songs[i]["img"]), // no matter how big it is, it won't overflow
                ),
                title: Text(songs[i]["name"]),
                subtitle: Text(songs[i]["artist"]),
              ),
            );
          }),
    );
  }
}
