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
  final String? hourlyRate;
  final ImageProvider? image;
  final VoidCallback? viewProfileFunction;
  final VoidCallback? seeReviewsFunction;
  final ValueChanged<int>? onRatingChanged;

  const AppCandidateProfile({
    super.key,
    required this.fullName,
    required this.jobTitle,
    required this.rating,
    required this.hourlyRate,
    this.image,
    this.viewProfileFunction,
    this.seeReviewsFunction,
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
                        AppStarRating(onChanged: onRatingChanged, rating: rating, size: 18,),
                        Text(rating.toDouble().toString()),
                        if(seeReviewsFunction!=null)
                          Expanded(child:
                          TextButton(onPressed: viewProfileFunction,
                              child: Text("See reviews",
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: neutrals500Color,
                                    decoration: TextDecoration.underline,
                                    fontVariations: [
                                      const FontVariation('wght', 500),
                                    ]
                                ),
                              )
                          )
                          ),
                      ],
                    ),
                    columnRegularSpacing,
                    Row(
                      children: [
                        if(hourlyRate!=null)Expanded(
                          child: Text(hourlyRate!, style: theme.textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w600
                          ),),
                        ),
                        if(viewProfileFunction!=null)TextButton(onPressed: viewProfileFunction, child: Row(children: [
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