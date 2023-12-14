import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/colors.dart';
class ImageThumbnail extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onRemove;

  const ImageThumbnail({super.key, required this.imagePath, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(color: neutrals200Color),
      ),
      child: Stack(
        children: [ClipRect(
      child: Container(
      width: double.infinity,
        height: double.infinity,
        child: imagePath != null
            ? Image.network(
          imagePath!,
          fit: BoxFit.cover,
        )
            : Center(
          child: Icon(Icons.image),
        ),
      ),
    ),
          if (onRemove != null)
            Positioned(
              top: 0.0,
              right: 0.0,
              child: IconButton.filled(
                icon: Icon(Icons.delete_forever),
                onPressed: onRemove,
                color: whiteColor,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor.withOpacity(0.3))
                ),
              ),
            ),
        ],
      ),
    );
  }
}