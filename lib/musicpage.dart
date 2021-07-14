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
  @override

  Widget build(BuildContext context) {
    final WeSlideController _controller = WeSlideController();
    final double _panelMinSize = 127.0;
    final double _panelMaxSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: WeSlide(
        controller: _controller,
        panelMinSize: _panelMinSize,
        panelMaxSize: _panelMaxSize,
        overlayOpacity: 0.9,
        overlay: true,
        body: Home(),
        panelHeader: MiniPlayer(onTap: _controller.show),
        panel: Player(onTap: _controller.hide),
        //footer: BottomBar(),
      ),
      appBar: AppBar(
        title: Text('Music Player'),
      ),
    );

  }
}