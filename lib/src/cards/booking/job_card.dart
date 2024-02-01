import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../extensions/numbers.dart';
import '../../extensions/date.dart';
import '../../constants/enums.dart';
import '../../badges/status_badge.dart';
import '../../avatars/image_avatar.dart';
import '../../constants/strings.dart';
import '../../constants/widgets.dart';

class AppJobCard extends StatelessWidget{
  final String jobName;
  final String employerName;
  final String locationName;
  final DateTime? dateTime;
  final bool selected;
  final VoidCallback? onNext;
  final VoidCallback? onClick;
  final JobStatus status;
  final Color color = const Color(0xFF9CA2AE);
  final ImageProvider? image;

  const AppJobCard({
    super.key,
    required this.jobName,
    required this.employerName,
    required this.locationName,
    this.dateTime,
    this.onNext,
    this.onClick,
    this.image,
    this.selected = false,
    this.status = JobStatus.newJob
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3.0,
            spreadRadius: 1.0,
            offset: Offset(0, 4),
          ),
        ],
        border: selected
            ? Border.all(
          color: Theme.of(context).primaryColor,
          width: 2.0,
        )
            : null,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: GestureDetector(
      onTap: onNext??onClick,
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
                      2.height,
                      Text(employerName, style: Theme.of(context).textTheme.bodySmall,),
                      4.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Iconsax.location, size: 18, color: color,),
                                rowRegularSpacing,
                                Expanded(child: Text(locationName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,),)),
                              ],
                            ),
                            8.height,
                            Row(
                              children: [
                                Icon(Iconsax.calendar, size: 18, color: color,),
                                rowRegularSpacing,
                                Expanded(child: Text(dateTime?.toAppDateString()??"no date specified", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color,))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      8.height,
                      Builder(
                          builder: (context) {
                            if(status == JobStatus.newJob){
                              return const SizedBox();
                            }else if(status == JobStatus.applied){
                              return StatusBadge.info(appliedForJobStatus);
                            }else if(status == JobStatus.requestedReschedule){
                              return StatusBadge.warning(rescheduleRequestedStatus);
                            }else if(status == JobStatus.rescheduled){
                              return StatusBadge.success(rescheduledStatus);
                            }else if(status == JobStatus.inactive){
                              return StatusBadge.danger(inactiveStatus);
                            }else if(status == JobStatus.active){
                              return StatusBadge.info(activeStatus);
                            }else if(status == JobStatus.booked){
                              return StatusBadge.info(booked);
                            }else if(status == JobStatus.alternativeProposed){
                              return StatusBadge.info(alternativeProposed);
                            }
                            return StatusBadge.danger(cancelledStatus);
                          }
                      )
                    ],
                  ),
                ),
              ),
            ),
            if(onNext!=null)const Icon(Iconsax.arrow_right_1)
          ],
        ),
      ),
    ),

    );
  }

}