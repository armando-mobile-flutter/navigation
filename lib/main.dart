import 'package:flutter/material.dart';
import 'package:navigation/utils/art_util.dart';
import 'art_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navigation',
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: ArtRoute(art: ArtUtils.IMG_VANGOGH),
      );
}
