import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Full extends StatefulWidget {
  String imgPath;
  Full(this.imgPath);

  @override
  _FullState createState() => _FullState();
}

class _FullState extends State<Full> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Hero(
          tag: widget.imgPath,
          child: PhotoView(
            imageProvider: NetworkImage(
              widget.imgPath,
            ),
          ),
        )),
      ),
    );
  }
}

quize() async {
  const url = 'https://1310.win.qureka.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
