import 'package:flutter/material.dart';
import 'package:musicplayer/artistpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      home: ArtistPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
