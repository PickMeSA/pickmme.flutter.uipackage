import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import '../../constants/colors.dart';
import '../../divider/divider.dart';
import '../../constants/widgets.dart';
import '../../avatars/image_avatar.dart';
import '../../rating/rating.dart';

class AppProfileReview extends StatelessWidget{
  final String fullName;
  final String relationship;
  final String? review;
  final int rating;
  final ImageProvider? image;
  final DateTime reviewDate;

  const AppProfileReview({
    super.key,
    required this.fullName,
    required this.relationship,
    this.review,
    required this.rating,
    this.image,
    required this.reviewDate,
  }):assert(
  rating>0 && rating<=5
  );

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
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
                    Row(
                      children: [
                        Expanded(
                          child: Text(fullName, style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                        const Icon(Icons.star_rounded, color: yellowColor,),
                        rowSmallSpacing,
                        Text(rating.toDouble().toString()),
                      ],
                    ),
                    Text(relationship, style: theme.textTheme.bodySmall,),
                    Text(
                      reviewDate.toDateMonthYearString(),
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: neutrals500Color,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        if(review!=null)columnRegularSpacing,
        if(review!=null)Text(review!),
      ],
    );
  }

}