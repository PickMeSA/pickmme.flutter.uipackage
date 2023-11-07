import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/colors.dart';
import '../../divider/divider.dart';
import '../../constants/widgets.dart';
import '../../avatars/image_avatar.dart';

class AppChatTile extends StatelessWidget{
  final String firstName;
  final String lastName;
  final String jobTitle;
  final int rating;
  final String hourlyRate;
  final Widget? image;
  final bool lastChatFromMe;
  final ValueChanged<int>? onRatingChanged;

  const AppChatTile({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.rating,
    required this.hourlyRate,
    required this.lastChatFromMe,
    this.image,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppImageAvatar(image: image,),
        rowLargeSpacing,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$firstName $lastName", style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600
              ),),
              columnSmallSpacing,
              Text(jobTitle, style: theme.textTheme.bodySmall!.copyWith(
                color: neutrals500Color
              ),),
              columnRegularSpacing,
              Text(jobTitle, style: theme.textTheme.bodySmall,),
              columnExtraLargeSpacing,
              const AppDivider(),
            ],
          ),
        )
      ],
    );
  }

}