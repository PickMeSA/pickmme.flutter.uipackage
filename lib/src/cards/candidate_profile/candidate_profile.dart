import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:flutter_ui_components/src/extensions/numbers.dart';
import 'package:iconsax/iconsax.dart';
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
  final VoidCallback? viewProfileFunction;
  final ValueChanged<int>? onRatingChanged;

  const AppCandidateProfile({
    super.key,
    required this.fullName,
    required this.jobTitle,
    required this.rating,
    required this.hourlyRate,
    this.image,
    this.viewProfileFunction,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Row(
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
                    Text(jobTitle, style: theme.textTheme.bodySmall,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppStarRating(onChanged: onRatingChanged, rating: rating),
                        Expanded(child: Text(rating.toDouble().toString()))
                      ],
                    ),
                    columnRegularSpacing,
                    if(viewProfileFunction!=null)Row(
                      children: [
                        Expanded(
                          child: Text(hourlyRate, style: theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                        TextButton(onPressed: viewProfileFunction, child: Row(children: [
                          Text("View profile", style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: neutrals500Color,
                            fontVariations: [
                              const FontVariation('wght', 500),
                            ]
                          ),),
                          10.width,
                          const Icon(Iconsax.arrow_right_1, color: neutrals500Color,)
                        ],)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          columnRegularSpacing,
          const AppDivider(),
        ],
      ),
    );
  }

}