import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int value;
  final double size;
  final Color color;
  final IconData filledStar;
  final IconData unfilledStar;
  final ValueChanged<int>? onChanged;

  const StarRating({super.key,
    this.value = 0,
    this.color = Colors.amber,
    this.size = 35,
    this.filledStar = Icons.star_rounded,
    this.unfilledStar = Icons.star_border_rounded,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () => onChanged?.call(index),
          icon: Icon(
            index < value ? filledStar : unfilledStar,
            color: color,
            size: size,
          ),
        );
      }),
    );
  }
}