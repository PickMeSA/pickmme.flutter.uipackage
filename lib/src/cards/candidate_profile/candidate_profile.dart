import 'package:flutter/material.dart';
import '../../divider/divider.dart';
import '../../constants/widgets.dart';
import '../../avatars/image_avatar.dart';
import '../../rating/rating.dart';

class AppCandidateProfile extends StatelessWidget{
  final String fullName;
  final String jobTitle;
  final int rating;
  final String hourlyRate;
  final ImageProvider? image;
  final Widget? nextButton;
  final ValueChanged<int>? onRatingChanged;

  const AppCandidateProfile({
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
    return SizedBox(
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageAvatar(image: image,),
          rowLargeSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName, style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600
                ),),
                columnSmallSpacing,
                Text(jobTitle, style: theme.textTheme.bodySmall,),
                // columnSmallSpacing,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppStarRating(onChanged: onRatingChanged, rating: rating),
                    Expanded(child: Text(rating.toDouble().toString()))
                  ],
                ),
                columnRegularSpacing,
                Row(
                  children: [
                    Expanded(
                      child: Text(hourlyRate, style: theme.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600
                      ),),
                    ),
                    if(nextButton!=null)nextButton!,
                  ],
                ),
                columnRegularSpacing,
                const AppDivider(),
              ],
            ),
          )
        ],
      ),
    );
  }

}