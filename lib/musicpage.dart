// @dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'package:music_player/player.dart';
import 'package:music_player/miniplayer.dart';
import 'package:music_player/home.dart';

class MusicPage extends StatefulWidget{
  @override
  _MusicPage createState() => _MusicPage();
}

class _MusicPage extends State<MusicPage>{


  List songs = [];

  ReadData() async{
    await DefaultAssetBundle.of(context).loadString("json/songs.json").then((s) {
      setState(() {
        songs = json.decode(s);
      });
    });
  }

  @override

  void initState(){
    super.initState();
    ReadData();
  }


  Widget build(BuildContext context) {
    final WeSlideController _controller = WeSlideController();
    final double _panelMinSize = 127.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.builder(
        itemCount: songs == null ? 0 : songs.length,
        itemBuilder: (_, i) {
          return WeSlide(
            controller: _controller,
            panelMinSize: _panelMinSize,
            panelMaxSize: _panelMaxSize,
            overlayOpacity: 0.9,
            overlay: true,
            body: Home(),
            panelHeader: MiniPlayer(onTap: _controller.show, songsData: songs, index: i),
            panel: Player(onTap: _controller.hide, songsData: songs, index: i),
            //footer: BottomBar(),
          );
        }),
    );

  }
}