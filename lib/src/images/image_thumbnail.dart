import 'package:flutter/material.dart';
class ImageThumbnail extends StatelessWidget {
  final String? imagePath;

  const ImageThumbnail({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: imagePath != null
          ? Image.network(
        imagePath!,
        fit: BoxFit.cover,
      )
          : Center(
        child: Icon(Icons.image),
      ),
    );
  }
}