import 'package:flutter/material.dart';

class ImageView extends StatefulWidget {
  final List<dynamic> imageList;

  ImageView(this.imageList);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              _selectedImage = index;
            });
          },
          children: [
            for (var i = 0; i < widget.imageList.length; i++)
              Container(
                child: Image.network(widget.imageList[i], fit: BoxFit.cover),
              )
          ],
        ),
        Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < widget.imageList.length; i++)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    height: 9,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    width: _selectedImage == i ? 32 : 9,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(9)),
                  )
              ],
            ))
      ],
    );
  }
}
