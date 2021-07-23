// @dart=2.9
import 'package:flutter/material.dart';
import 'package:music_player/musicpage.dart';
import 'theme.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    themeMode: ThemeMode.dark,
    theme: AppTheme.lightThemeData,
    darkTheme: AppTheme.darkThemeData,
    home: MusicPage(),
  ));
}




