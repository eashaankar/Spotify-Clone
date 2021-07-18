import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/player.dart';
import 'package:we_slide/we_slide.dart';
import 'globals.dart' as globals;
import 'package:http/http.dart' as http;

void main() async {
  String url = "assets/musiclist.json";
  final response = await http.get(Uri.parse(url));
  print(response.body);
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    final WeSlideController _controller = WeSlideController();
    final size = MediaQuery
        .of(context)
        .size;
    final colorTheme = Theme
        .of(context)
        .colorScheme;
    return Scaffold(
        appBar: AppBar(
          title: Text('Music Player'),
        ),
        body: Column(
          children: [
            Card(
              child: new InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Player(onTap: _controller.show)),
                  );
                  globals.isPause = false;
                  globals.audioCache.play('THYKIER - Shimmer.mp3');
                  globals.flag = 1;
                  print("tapped");
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/shimmer.jpg'), // no matter how big it is, it won't overflow
                      ),
                      title: Text('THYKIER'),
                      subtitle: Text('Shimmer'),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}