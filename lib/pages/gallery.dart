import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:remote_photo_app/pages/add_gallery.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
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
            "Remote Gallery",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            RaisedButton(
              padding: const EdgeInsets.only(right: 5, left: 5),
              color: Colors.indigo[900],
              shape: const CircleBorder(),
              onPressed: () {},
              child: IconButton(
                icon: const Icon(Icons.add_a_photo),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddGallery()),
                  );
                },
              ),
            ),
          ],
        ),
        body: Center(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(13.0),
                color: Colors.tealAccent,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                      crossAxisCount: 3,
                    ),
                    itemCount: 18,
                    itemBuilder: (context, index) {
                      return Card(
                          child: InkResponse(
                        child: Image.network(
                            'https://img.freepik.com/premium-vector/young-man-programmer-working-computer-with-code-screen-student-programming-vector-concept_53562-4999.jpg?w=2000'),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return const FullScreenScreen();
                          }));
                        },
                      ));
                    }))));
  }
}

class FullScreenScreen extends StatelessWidget {
  const FullScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
            child: Hero(
          tag: 'imageHero',
          child: Image.network(
              'https://img.freepik.com/premium-vector/young-man-programmer-working-computer-with-code-screen-student-programming-vector-concept_53562-4999.jpg?w=2000'),
        )),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
