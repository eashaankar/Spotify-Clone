// @dart=2.9
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({Key key,this.advancedPlayer}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {

  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String path = "https://cf-media.sndcdn.com/VilSBQJpBrmc.128.mp3?Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiKjovL2NmLW1lZGlhLnNuZGNkbi5jb20vVmlsU0JRSnBCcm1jLjEyOC5tcDMiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2MjY2OTMxMjd9fX1dfQ__&Signature=QNoXyVcC9IHmpO4yZhlRDF1~CqumV0dcdFEg20bj54S7FjwtkxibU54Bzki50ooikxdpQ-Lly7A7VIdDtcjMaxjuj7nyZ93OrA6b6vkvDTFqYSojjBkNKDsHIUBNiW1QbW2S7XIPEnUrcs2cfmz2o63p46iiOqp5ky2mZ-UuVC2u684FcuD5sV8uKByfe4o6jVqtIU8Waj2nzaxKkkQKhw8WY-rqZXvLYLRg-jj6DIFrOokAV9mgIDfkGTKKgkZ0OHCfKuCH11RrykG-SYZtRNO9HMg2xkasPN94oS35I6~VM7QWFSPFnA8zdkUwCvUPKqVwaFfliqkoHf0Ul6nkfA__&Key-Pair-Id=APKAI6TU7MMXM5DG6EPQ";
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;

  @override

  void initState(){
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {setState(() {
      _duration = d;
    }); });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {setState(() {
      _position = p;
    });});

    this.widget.advancedPlayer.setUrl(path);
  }

  Widget btnStart() {
    return IconButton(
        color: Colors.white,
        //textColor: Color(0xFF0B1220),
        //onPressed: () => audioCache.play('THYKIER - Shimmer.mp3'),
        onPressed: (){
          print('tapped');
          print(this.widget.advancedPlayer.play(path));
          this.widget.advancedPlayer.play(path);
        },
        icon: Icon(Icons.play_arrow,
        ));
  }

  Widget loadAsset() {
    return
      Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btnStart(),
          ]
        )
      );
  }


  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              
            ],
          )),
          
          loadAsset(),
        ],
      ),
    );
  }
}





