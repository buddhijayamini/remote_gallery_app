import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:remote_photo_app/pages/gallery.dart';

class AddGallery extends StatefulWidget {
  const AddGallery({Key? key}) : super(key: key);

  @override
  _AddGalleryState createState() => _AddGalleryState();
}

class _AddGalleryState extends State<AddGallery> {
  File? _image;

  Future senData() async {
    const baseURL = "localhost:8000/api/v1";
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
      'Charset': 'utf-8',
    };

    final response = await http.post(
      Uri.parse("$baseURL/gallery"),
      headers: headers,
      body: {"url": _image},
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (BuildContext context) => GalleryScreen(),
        ),
        (Route route) => false,
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.white.withOpacity(0.8),
              title: const Text("Error....",
                  style: TextStyle(color: Colors.deepPurple, fontSize: 25)),
              content: const Text(" Failed",
                  style: TextStyle(color: Colors.red, fontSize: 23)),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  color: Colors.redAccent,
                  child: const Text("Close",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          elevation: 10,
          toolbarHeight: 80,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          bottomOpacity: 10,
          title: const Text(
            "Add Gallery",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(children: [
              Center(
                child: ElevatedButton(
                  child: const Text('Select An Image'),
                  onPressed: _openImagePicker,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300,
                color: Colors.grey[300],
                child: _image != null
                    ? Image.file(_image!, fit: BoxFit.cover)
                    : const Text('Please select an image'),
              )
            ]),
          ),
        ));
  }
}
