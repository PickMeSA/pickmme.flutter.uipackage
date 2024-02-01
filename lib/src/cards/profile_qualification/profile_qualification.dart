
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/colors.dart';
import '../../divider/divider.dart';
import '../../constants/widgets.dart';

enum AppQualificationType{ award, education, experience}

String toPresent = "Present";

abstract class QualificationContract{
  final AppQualificationType qualificationType;
  final String name;
  final String institutionName;
  final String? educationType;
  final String? period;
  final DateTime? issuedOn;
  final DateTime? dateStarted;
  final DateTime? dateEnded;


  QualificationContract({
    required this.name,
    required this.qualificationType,
    required this.institutionName,
    this.educationType,
    this.period,
    this.issuedOn,
    this.dateStarted,
    this.dateEnded,

  }):assert(
  (qualificationType == AppQualificationType.award && issuedOn != null) ||
  (qualificationType == AppQualificationType.education && educationType != null && issuedOn != null) ||
  (qualificationType == AppQualificationType.experience && (dateStarted != null || period!=null))
  );
}
class AppProfileQualification extends StatelessWidget{
  final QualificationContract qualification;
  Function? onEdit;
   AppProfileQualification({
    super.key,
    required this.qualification,
    this.onEdit
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    IconData icon = Iconsax.briefcase;
    if(qualification.qualificationType == AppQualificationType.education){
      icon = Iconsax.teacher;
    }else if(qualification.qualificationType == AppQualificationType.award){
      icon = Iconsax.award;
    }
    return SizedBox(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSquareImageAvatar.medium(icon: icon, color: secondaryColor,),
              rowLargeSpacing,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(qualification.name, style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600
                        ),),
                        if(onEdit != null)
                        Spacer(),
                        if(onEdit != null)
                        InkWell(
                          onTap: ()=> onEdit!(),
                          child: Icon(Iconsax.edit,),
                        )

                      ],
                    ),
                    if(qualification.educationType!=null)
                      Text(qualification.educationType!, style: theme.textTheme.bodySmall,),
                    Text(qualification.institutionName, style: theme.textTheme.bodySmall,),
                    if(qualification.issuedOn!=null) Text(
                      qualification.issuedOn!.toMonthYearString(),
                      style: theme.textTheme.bodySmall!.copyWith(color: neutrals500Color),
                    ),if(qualification.period!=null) Text(
                      qualification.period!,
                      style: theme.textTheme.bodySmall!.copyWith(color: neutrals500Color),
                    ),
                    if(qualification.dateStarted != null)
                    Text(
                    "${qualification.dateStarted!.toMonthYearStringNoDash()} - "
                    "${qualification.dateEnded?.toMonthYearStringNoDash() ?? toPresent} ",
                    style: theme.textTheme.bodySmall!.copyWith(color: neutrals500Color),
                    )
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