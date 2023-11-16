import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/colors.dart';
import '../../avatars/square_image_avatar.dart';
import '../../constants/numbers.dart';
import '../../constants/widgets.dart';

class AppCandidateProfileTile extends StatelessWidget{
  final String fullName;
  final String jobTitle;
  final int rating;
  final String hourlyRate;
  final Widget? image;
  final Widget? nextButton;
  final ValueChanged<int>? onRatingChanged;

  const AppCandidateProfileTile({
    super.key,
    required this.fullName,
    required this.jobTitle,
    required this.rating,
    required this.hourlyRate,
    this.image,
    this.nextButton,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSquareImageAvatar(image: image, color: neutrals200Color,),
        columnSmallSpacing,
        Text(fullName, style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600
        ),),
        Text(jobTitle, style: theme.textTheme.bodySmall,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.star_rounded,
              color: Colors.amber,
              size: ratingIconSize,
            ),
            Expanded(child: Text(" ${rating.toDouble()}"))
          ],
        ),
        columnRegularSpacing,
        Text(hourlyRate, style: theme.textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w600
        ),),
      ],
    );
  }

}