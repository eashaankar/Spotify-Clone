library music_player.globals;
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

bool isPause = true;

Duration duration = new Duration();
Duration position = new Duration();

late AudioPlayer advancedPlayer;
late AudioCache audioCache;

void seekToSecond(int second){
  Duration newDuration = Duration(seconds: second);

  advancedPlayer.seek(newDuration);
}

var flag;

void songchoice(int value) {

}

