import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:flutter_ui_components/src/constants/strings.dart';
import 'package:iconsax/iconsax.dart';

class AppEmployeeJobCard extends StatelessWidget{
  final String jobName;
  final String employeeName;
  final String locationName;
  final DateTime dateTime;
  final bool selected;
  final VoidCallback onNext;
  final JobStatus status;
  final Color grey = const Color(0xFF9CA2AE);

  const AppEmployeeJobCard({
    super.key,
    required this.jobName,
    required this.employeeName,
    required this.locationName,
    required this.dateTime,
    required this.onNext,
    this.selected = false,
    this.status = JobStatus.newJob
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
            const AppImageAvatar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(employeeName, style: Theme.of(context).textTheme.headlineSmall,),
                      Text(jobName, style: Theme.of(context).textTheme.bodyLarge,),
                      8.height,
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Iconsax.location, size: 18, color: grey,),
                                8.width,
                                Expanded(child: Text(locationName, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: grey,),)),
                              ],
                            ),
                            8.height,
                            Row(
                              children: [
                                Icon(Iconsax.calendar, size: 18, color: grey,),
                                8.width,
                                Expanded(child: Text(dateTime.toAppDateString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: grey,))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      16.height,
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
                          }
                          return StatusBadge.danger(cancelledStatus);
                        }
                      )
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