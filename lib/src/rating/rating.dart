import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppStarRating extends StatelessWidget {
  final int rating;
  final double size;
  final Color color;
  final IconData filledStar;
  final IconData unfilledStar;
  final ValueChanged<int>? onChanged;

  const AppStarRating({super.key,
    this.rating = 0,
    this.color = Colors.amber,
    this.size = 20,
    this.filledStar = Iconsax.star,
    this.unfilledStar = Iconsax.star,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => onChanged?.call(index),
          icon: Builder(
            builder: (context) {
              if(index < rating){
                return Icon(
                  Iconsax.star,
                  color: Colors.amber,
                  size: size,
                  fill: 1,
                );
              }
              return Icon(
                Iconsax.star,
                color: const Color(0xFF9CA2AE),
                size: size,

              );
            }
          ),
        );
      }),
    );
  }
}