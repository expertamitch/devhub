import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomImage extends StatefulWidget {
  String image;

  ZoomImage(this.image);

  @override
  _ZoomImageState createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          PhotoView(
            imageProvider: AssetImage(widget.image),
          ),
        ],
      ),
    );
  }
}
