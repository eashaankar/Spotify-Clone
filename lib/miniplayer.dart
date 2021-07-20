import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:music_player/home.dart';
import 'package:music_player/player.dart';
import 'package:we_slide/we_slide.dart';

class MiniPlayer extends StatefulWidget {

  final Function onTap;
  final songsData;
  final int index;

  MiniPlayer({Key? key, required this.onTap, required this.songsData, required this.index}) : super(key: key);

  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {

  
  @override
  Widget build(BuildContext context) {
    final WeSlideController _controller = WeSlideController();
    final colorTheme = Theme.of(context).colorScheme;
    return Container(
      color: Colors.white60,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: 71.0,
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => widget.onTap(),
                   /*onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Player(onTap: _controller.show,songsData: songs,index: i)),
                     );
                     print('Tapped');
                   },*/
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Image.asset(this.widget.songsData[this.widget.index]["img"],
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(this.widget.songsData[this.widget.index]["name"],
                          style: TextStyle(color: Colors.green),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(width: 8, height: 8),
                      Text(this.widget.songsData[this.widget.index]["artist"],
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                   /* setState(() {
                      if(globals.isPause){
                        globals.isPause = false;
                        //globals.audioCache.play(this.widget.songsData[this.widget.index]["audio"]);
                        globals.advancedPlayer.play(globals.path);
                      }else{
                        globals.isPause = true;
                        globals.advancedPlayer.pause();
                      }
                    });*/
                  },
                  child: Icon(Icons.play_arrow,
                      color: Colors.black, size: 30),
                ),
                SizedBox(width: 20),
              ],
            ),
            Divider(color: Colors.black, height: 1),
          ],
        ),
      ),
    );
  }
}
