import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/extensions/string.dart';
import '../../avatars/image_avatar.dart';
import '../../badges/notification_badge.dart';
import '../../divider/divider.dart';
import '../../extensions/date.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/enums.dart';
import '../../constants/widgets.dart';

class AppJobAdvertCard extends StatelessWidget{
  final String jobName;
  final String employerName;
  final String locationName;
  final String? matchingText;
  final ImageProvider? image;
  final DateTime? dateTime;
  final String? time;
  final VoidCallback? onNext;
  final JobStatus status;
  final Color color = const Color(0xFF9CA2AE);
  final int? totalApplications;
  final String? applicationsString;
  final int? totalMatches;
  final String? matchesString;
  const AppJobAdvertCard({
    super.key,
    required this.jobName,
    required this.employerName,
    required this.locationName,
    this.dateTime,
    this.time,
    required this.onNext,
    this.matchingText,
    this.image,
    this.status = JobStatus.newJob,
    this.totalApplications,
    this.applicationsString,
    this.totalMatches,
    this.matchesString,
  });

  factory AppJobAdvertCard.matching({
    required String jobName,
    required String employerName,
    required String locationName,
    DateTime? dateTime,
    String? time,
    required VoidCallback onNext,
    ImageProvider? image,
    String matchingText = "Your profile matches this job",
  }){
    return AppJobAdvertCard(
      jobName: jobName,
      employerName: employerName,
      locationName: locationName,
      image: image,
      dateTime: dateTime,
      time: time,
      onNext: onNext,
      matchingText: matchingText,
    );
  }

  factory AppJobAdvertCard.applicationsAndMatches({
    required String jobName,
    required String employerName,
    required String locationName,
    DateTime? dateTime,
    String? time,
    required VoidCallback onNext,
    ImageProvider? image,
    String? matchingText,
    int totalApplications = 0,
    String applicationsString = "applications",
    int totalMatches = 0,
    String matchesString = "possible matches",
  }){
    return AppJobAdvertCard(
      jobName: jobName,
      image: image,
      employerName: employerName,
      locationName: locationName,
      dateTime: dateTime,
      time: time,
      onNext: onNext,
      matchingText: matchingText,
      totalApplications: totalApplications,
      totalMatches: totalMatches,
      applicationsString: applicationsString,
      matchesString: matchesString,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: GestureDetector(
        onTap: onNext,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImageAvatar(image: image,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jobName,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(employerName, style: Theme.of(context).textTheme.bodySmall,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Iconsax.location, size: 18, color: color,),
                                  rowRegularSpacing,
                                  Expanded(child: Text(locationName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,fontSize: 14),)),
                                ],
                              ),
                              columnRegularSpacing,
                              Row(
                                children: [
                                  Icon(Iconsax.calendar, size: 18, color: color,),
                                  rowRegularSpacing,
                                  Expanded(child: Text(dateTime!=null?"${dateTime?.toAppDateAndTimeString(timeAvailable: !time.isEmptyOrNull)} ${time}":"Flexible time", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,fontSize: 14))),
                                ],
                              ),
                              if(matchingText!=null)columnRegularSpacing,
                              if(matchingText!=null)Row(
                                children: [
                                  Icon(Iconsax.frame_1, color: color, size: 16,),
                                  rowRegularSpacing,
                                  Expanded(
                                      child: Text(
                                          matchingText!,
                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                            color: const Color(0xFF23A8B3),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          )
                                      )
                                  ),
                                ],
                              ),
                              if(totalApplications!=null)Container(
                                padding: const EdgeInsets.only(top:8),
                                child: Column(
                                  children: [
                                    const AppDivider(),
                                    Row(
                                      children: [
                                        const Icon(Iconsax.profile_2user),
                                        if(totalApplications! > 0)Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Center(
                                            child: NotificationBadge.small(),
                                          ),
                                        ),
                                        if(totalApplications == 0) rowRegularSpacing,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Text("$totalApplications $applicationsString"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              if(totalMatches !=null)Container(
                                child: Column(
                                  children: [
                                    const AppDivider(),
                                    Row(
                                      children: [
                                        const Icon(Iconsax.verify),
                                        if(totalMatches! > 0)Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Center(
                                            child: NotificationBadge.small(),
                                          ),
                                        ),
                                        if(totalMatches == 0) rowRegularSpacing,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Text("$totalMatches $matchesString"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Icon(Iconsax.arrow_right_1)
            ],
          ),
        ),
      ),
    );
  }

}