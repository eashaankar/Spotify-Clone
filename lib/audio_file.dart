// @dart=2.9
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  final String audioPath;
  const AudioFile({Key key, this.advancedPlayer, this.audioPath}) : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  //final String path = "https://filesamples.com/samples/audio/mp3/sample2.mp3";
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.white;

  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    this.widget.advancedPlayer.setUrl(this.widget.audioPath);
    this.widget.advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if(isRepeat==true){
          isPlaying=true;
        }else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      color: Colors.white,
      //textColor: Color(0xFF0B1220),
      //onPressed: () => audioCache.play('THYKIER - Shimmer.mp3'),
      onPressed: () {
        if (isPlaying == false) {
          print('tapped');
          this.widget.advancedPlayer.play(this.widget.audioPath);
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          this.widget.advancedPlayer.pause();
          setState(() {
            isPlaying = false;
          });
        }
      },
      icon: isPlaying == false ? Icon(Icons.play_arrow) : Icon(Icons.pause),
    );
  }

  Widget btnFast(){
    return IconButton(
        icon: Icon(Icons.fast_forward,
          color: color,),
        onPressed: (){
          this.widget.advancedPlayer.setPlaybackRate(playbackRate: 1.5);
    },
    );
  }


  Widget btnRepeat(){
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () {
        print('started loop');
        if(isRepeat == false){
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            print('inititated loop');
            color= Colors.green;
            isRepeat = true;
          });
        }else if(isRepeat==true){
          color= Colors.white;
          this.widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);
          isRepeat = false;
        }
      },
      icon: Icon(
        Icons.repeat,
        //color: Colors.white.withOpacity(0.4),
        color: color,
      ),
    );
  }

  Widget btnShuffle(){
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () {},
      icon: Icon(
        Icons.shuffle,
        color: color,
        /*color: Colors.white.withOpacity(
            0.4),*/ //Theme.of(context).accentColor.withOpacity(0.4),
      ),
    );
  }
  Widget btnSlow(){
    return IconButton(
        icon: Icon(Icons.fast_rewind,
          color: color,),
      onPressed: (){
        this.widget.advancedPlayer.setPlaybackRate(playbackRate: 0.5);
      },
    );
  }

  Widget slider(){
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 3,
        thumbShape:
        RoundSliderThumbShape(enabledThumbRadius: 6),
      ),
      child: Slider(
        inactiveColor: Colors.white.withOpacity(0.1),
        activeColor: Colors.white,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          changeToSecond(value.toInt());
          value= value;
        },
      ),
    );
  }

  void changeToSecond(int second){
    Duration newDuration = Duration(seconds:second);
    this.widget.advancedPlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              btnShuffle(),
              btnSlow(),
          btnStart(),
              btnFast(),
              btnRepeat(),
        ]));
  }

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_position.toString().split(".")[0], style: TextStyle(fontSize: 16),),
                  Text(_duration.toString().split(".")[0], style: TextStyle(fontSize: 16),)
                ],
              )),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
