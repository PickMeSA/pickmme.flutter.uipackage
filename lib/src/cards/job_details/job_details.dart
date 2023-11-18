import 'package:flutter/material.dart';
import '../../avatars/image_avatar.dart';
import '../../extensions/date.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/enums.dart';
import '../../constants/widgets.dart';

class AppJobDetailCard extends StatelessWidget{
  final String jobName;
  final String employerName;
  final String locationName;
  final String estimatedTime;
  final String rate;
  final String? matchingText;
  final DateTime dateTime;
  final VoidCallback onNext;
  final JobStatus status;
  final Color color = const Color(0xFF9CA2AE);
  const AppJobDetailCard({
    super.key,
    required this.jobName,
    required this.employerName,
    required this.locationName,
    required this.dateTime,
    required this.onNext,
    this.matchingText,
    this.status = JobStatus.newJob,
    required this.estimatedTime, required this.rate,
  });


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
            AppImageAvatar.small(),
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
                            columnSmallSpacing,
                            Row(
                              children: [
                                Icon(Iconsax.location, size: 18, color: color,),
                                rowRegularSpacing,
                                Expanded(child: Text(locationName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,),)),
                              ],
                            ),
                            columnSmallSpacing,
                            Row(
                              children: [
                                Icon(Iconsax.calendar, size: 18, color: color,),
                                rowRegularSpacing,
                                Expanded(child: Text(dateTime.toAppDateString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,))),
                              ],
                            ),
                            columnSmallSpacing,
                            Row(
                              children: [
                                Icon(Iconsax.clock, size: 18, color: color,),
                                rowRegularSpacing,
                                Expanded(child: Text(estimatedTime, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,))),
                              ],
                            ),
                            columnSmallSpacing,
                            Row(
                              children: [
                                Icon(Iconsax.wallet_money, size: 18, color: color,),
                                rowRegularSpacing,
                                Expanded(child: Text(rate, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}