import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      body:Column(
        children: [
          Card(
            child: new InkWell(
              onTap: () {
                print("tapped");
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.album),
                    title: Text('<Song name>'),
                    subtitle: Text('<Artist Name>'),
                  )
                ],
              ),
            ),

          )
        ],
      )
    );
  }
}
