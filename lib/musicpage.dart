import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';
import 'package:music_player/player.dart';
import 'package:music_player/miniplayer.dart';
import 'package:music_player/home.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'globals.dart' as globals;


class MusicPage extends StatefulWidget{
  @override
  _MusicPage createState() => _MusicPage();
}

class _MusicPage extends State<MusicPage>{

  @override

  void initState(){
    super.initState();
    initPlayer();
  }

  void initPlayer(){
    globals.advancedPlayer = new AudioPlayer();
    globals.audioCache = new AudioCache(fixedPlayer: globals.advancedPlayer);

    globals.advancedPlayer.durationHandler = (d) => setState(() {
      globals.duration = d;
    });

    globals.advancedPlayer.positionHandler = (p) => setState(() {
      globals.position = p;
    });
  }

  late String localFilePath;

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
    );

  }
}