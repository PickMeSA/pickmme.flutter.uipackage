import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../divider/divider.dart';
import '../../constants/widgets.dart';
import '../../avatars/image_avatar.dart';

class AppChatTile extends StatelessWidget{
  final String firstName;
  final String lastName;
  final String jobTitle;
  final ImageProvider? image;
  final bool lastChatFromMe;
  final bool active;
  final int notificationCount;
  final VoidCallback? onPressed;
  final String? lastMessage;

  const AppChatTile({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.jobTitle,
    required this.lastChatFromMe,
    required this.lastMessage,
    this.image,
    this.onPressed,
    this.active = false,
    this.notificationCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String lastChatMessage = newChatStarted;
    if(lastMessage!=null){
      int length = min(25, lastMessage!.length);
      String message = lastMessage!.substring(0,length);
      lastChatMessage = lastChatFromMe?
      "You: $message":"$firstName: $message";
    }
    return SizedBox(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImageAvatar.small(image: image, active: active),
              rowLargeSpacing,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text("$firstName $lastName", style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600
                          ),),
                        ),
                        if(notificationCount>0)NotificationBadge(count: notificationCount,)
                      ],
                    ),
                    columnSmallSpacing,
                    Text(jobTitle, style: theme.textTheme.bodySmall!.copyWith(
                      color: neutrals500Color
                    ),),
                    columnRegularSpacing,
                    Text(lastChatMessage, style: theme.textTheme.bodySmall,),
                  ],
                ),
              )
            ],
          ),
          columnExtraLargeSpacing,
          const AppDivider(),
        ],
      ),
    );
  }

}