// @dart=2.9

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/audio_file.dart';
import 'package:we_slide/we_slide.dart';

//typedef void OnError(Exception exception);

class Player extends StatefulWidget {

  final Function onTap;
  final songsData;
  final int index;
  Player({this.onTap, this.songsData, this.index});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {

  AudioPlayer advancedPlayer;

  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override

  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cardSize = MediaQuery.of(context).size;
    return Material(
      child: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
              color: Color(0xFF57D780),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0B1220).withOpacity(0.0),
                    Color(0xFF0B1220).withOpacity(0.9)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    //height: MediaQuery.of(context).size.height - 150,
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                                height: MediaQuery.of(context).padding.top),
                            // Header
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    //onPressed: () => widget.onTap(),
                                    onPressed: (){
                                      setState(() {
                                        advancedPlayer.stop();
                                        Navigator.pop(context);
                                      });
                                    },
                                    iconSize: 32,
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Expanded(
                              child: Container(
                                //height: cardSize(),
                                //width: cardSize,
                                margin: EdgeInsets.all(30),
                                child:
                                Image.asset(this.widget.songsData[this.widget.index]["img"], fit: BoxFit.fitWidth),
                              ),
                            ),
                            // Music info
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          this.widget.songsData[this.widget.index]["name"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.headline5.apply(
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          this.widget.songsData[this.widget.index]["artist"],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textTheme.headline6.apply(
                                              color: Colors.white
                                                  .withOpacity(0.5)),
                                        ),
                                        SizedBox(height: 20),
                                        AudioFile(advancedPlayer: advancedPlayer, audioPath: this.widget.songsData[this.widget.index]["audio"],),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
