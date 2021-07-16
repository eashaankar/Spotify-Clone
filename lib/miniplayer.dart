import 'package:flutter/material.dart';
import 'package:music_player/player.dart';
import 'package:we_slide/we_slide.dart';
import 'globals.dart' as globals;

class MiniPlayer extends StatefulWidget {
  MiniPlayer({Key? key, required this.onTap}) : super(key: key);
  final Function onTap;
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
                  //onTap: () => widget.onTap(),
                   onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Player(onTap: _controller.show)),
                     );
                     print('Tapped');
                   },
                  child: Container(
                    width: 70,
                    height: 70,
                    child: Image.asset("assets/images/shimmer.jpg",
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Wurkit (Original Mix)',
                          style: TextStyle(color: Colors.green),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      SizedBox(width: 8, height: 8),
                      Text('Kyle Watson',
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
                    setState(() {
                      if(globals.isPause){
                        globals.isPause = false;
                        globals.audioCache.play('THYKIER - Shimmer.mp3');
                      }else{
                        globals.isPause = true;
                        globals.advancedPlayer.pause();
                      }
                    });
                  },
                  child: Icon(globals.isPause ? Icons.play_arrow : Icons.pause,
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
