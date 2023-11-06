import 'package:flutter/material.dart';
import '../../constants/widgets.dart';
import '../../avatars/image_avatar.dart';
import '../../rating/rating.dart';

class AppCandidateProfile extends StatelessWidget{
  final String fullName;
  final String jobTitle;
  final int rating;
  final String hourlyRate;
  final Widget? image;
  final Widget? nextButton;

  const AppCandidateProfile({
    super.key,
    required this.fullName,
    required this.jobTitle,
    required this.rating,
    required this.hourlyRate,
    this.image,
    this.nextButton,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      height: 130,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImageAvatar(image: image,),
          rowSpacing,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fullName, style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w600
                ),),
                Text(jobTitle, style: theme.textTheme.bodySmall,),
                AppStarRating(onChanged: (int val){}, rating: rating??0),
                columnLargeSpacing,
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
              ],
            ),
          )
        ],
      ),
    );
  }

}