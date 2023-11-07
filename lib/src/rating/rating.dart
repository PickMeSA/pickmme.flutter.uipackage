import 'package:flutter/material.dart';

import '../constants/numbers.dart';

class AppStarRating extends StatefulWidget {
  final int rating;
  final double size;
  final Color color;
  final IconData filledStar;
  final IconData unfilledStar;
  final ValueChanged<int>? onChanged;

  const AppStarRating({super.key,
    this.rating = 0,
    this.color = Colors.amber,
    this.size = ratingIconSize,
    this.filledStar = Icons.star_rounded,
    this.unfilledStar = Icons.star_border_rounded,
    this.onChanged,
  });

  @override
  State<AppStarRating> createState() => _AppStarRatingState();
}

class _AppStarRatingState extends State<AppStarRating> {
  late int rating;
  @override
  void initState() {
    rating = widget.rating;
    super.initState();
  }
  updateRating(int newRating){
    if(widget.onChanged != null){
      setState(() {
        rating = newRating+1;
      });
      widget.onChanged!.call(newRating+1);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return SizedBox(
          height: widget.size,
          width: widget.size,
          child: IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            onPressed: () => updateRating(index),
            icon: Builder(
              builder: (context) {
                if(index < rating){
                  return Icon(
                    widget.filledStar,
                    color: Colors.amber,
                    size: widget.size,
                  );
                }
                return Icon(
                  widget.unfilledStar,
                  color: const Color(0xFF9CA2AE),
                  size: widget.size,

                );
              }
            ),
          ),
        );
      }),
    );
  }
}