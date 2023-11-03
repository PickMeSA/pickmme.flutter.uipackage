import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import '../../extensions/numbers.dart';
import '../../extensions/date.dart';
import '../../constants/enums.dart';
import '../../avatars/image_avatar.dart';
import 'package:iconsax/iconsax.dart';

class AppJobAdvertCard extends StatelessWidget{
  final String jobName;
  final String employerName;
  final String locationName;
  final String? matchingText;
  final DateTime dateTime;
  final VoidCallback onNext;
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
    required this.dateTime,
    required this.onNext,
    this.matchingText,
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
    required DateTime dateTime,
    required VoidCallback onNext,
    String matchingText = "Your profile matches this job",
  }){
    return AppJobAdvertCard(
      jobName: jobName,
      employerName: employerName,
      locationName: locationName,
      dateTime: dateTime,
      onNext: onNext,
      matchingText: matchingText,
    );
  }

  factory AppJobAdvertCard.applicationsAndMatches({
    required String jobName,
    required String employerName,
    required String locationName,
    required DateTime dateTime,
    required VoidCallback onNext,
    String? matchingText,
    int totalApplications = 0,
    String applicationsString = "applications",
    int totalMatches = 0,
    String matchesString = "possible matches",
  }){
    return AppJobAdvertCard(
      jobName: jobName,
      employerName: employerName,
      locationName: locationName,
      dateTime: dateTime,
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppImageAvatar(),
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
                      4.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Iconsax.location, size: 18, color: color,),
                                8.width,
                                Expanded(child: Text(locationName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,),)),
                              ],
                            ),
                            8.height,
                            Row(
                              children: [
                                Icon(Iconsax.calendar, size: 18, color: color,),
                                8.width,
                                Expanded(child: Text(dateTime.toAppDateString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,))),
                              ],
                            ),
                            if(matchingText!=null)16.height,
                            if(matchingText!=null)Row(
                              children: [
                                Icon(Icons.account_circle, color: color, size: 16,),
                                12.width,
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
                              child: Column(
                                children: [
                                  AppDivider(),
                                  Row(
                                    children: [
                                      Icon(Iconsax.profile_2user),
                                      if(totalApplications! > 0)Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Center(
                                          child: NotificationBadge.small(),
                                        ),
                                      ),
                                      Text("$totalApplications $applicationsString")
                                    ],
                                  )
                                ],
                              ),
                            ),
                            if(totalMatches !=null)Container(
                              child: Column(
                                children: [
                                  AppDivider(),
                                  Row(
                                    children: [
                                      Icon(Iconsax.verify),
                                      if(totalMatches! > 0)Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Center(
                                          child: NotificationBadge.small(),
                                        ),
                                      ),
                                      Text("$totalMatches $matchesString")
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
    );
  }

}