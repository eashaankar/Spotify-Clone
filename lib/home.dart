// @dart=2.9
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/player.dart';
import 'package:we_slide/we_slide.dart';

class Home extends StatefulWidget {

  final Function onTap;

  Home({Key key, this.onTap}) : super(key: key);

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Hi Eashaankar 👋",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontWeight: FontWeight.w900, color: Colors.white, ),
                ),
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 20.0),
              Expanded(
                    child: ListView.builder(
                      itemCount: songs == null ? 0 : songs.length,
                      itemBuilder: (_, i) {
                        return InkWell(
                          highlightColor: Colors.lightGreen,
                          splashColor: Colors.green,
                          onTap: () {
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
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(songs[i]["img"]),
                              ),
                            title: Text(songs[i]["name"],
                                style: TextStyle(
                                  fontSize: 20,
                                ),),
                            subtitle: Text(songs[i]["artist"],
                              style: TextStyle(
                                fontSize: 15,
                              ),),),
                          );
                      }),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
