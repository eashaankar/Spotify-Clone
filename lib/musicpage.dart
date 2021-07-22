// @dart=2.9
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/bottombar.dart';
import 'package:we_slide/we_slide.dart';
import 'package:music_player/player.dart';
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
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: songs == null ? 0 : songs.length,
        itemBuilder: (_, i) {
          return WeSlide(
            controller: _controller,
            parallax: true,
            transformScale: true,
            bodyBorderRadiusBegin: 0.0,
            bodyBorderRadiusEnd: 12.0,
            panelBorderRadiusBegin: 0.0,
            panelBorderRadiusEnd: 12.0,
            transformScaleEnd: 0.85,
            panelMinSize: 0,
            panelMaxSize: _size.height * .90,
            footerHeight: 60.0,
            body: Home(onTap: _controller.show),
            panel: Player(onTap: _controller.hide, songsData: songs, index: i),
            footer: BottomBar(),
          );
        }),
    );

  }
}