import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {

  final double? width;
  final double? height;
  final Color placeHolder;
  final String url;



  const ImageContainer({Key? key, this.width, this.height, this.placeHolder = const Color(0xFFEEDDEE),
  required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height:  height,
      decoration: BoxDecoration(
        color: placeHolder,
        image: url.contains('http') ? DecorationImage(image:NetworkImage(url),
        fit: BoxFit.fill) : null
      ),
    );
  }
}