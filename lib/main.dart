import 'package:remote_photo_app/pages/gallery.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery APP',
    theme:  ThemeData(     
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
     ),
     home:  const GalleryScreen(),
    );
  }
}



