
import 'package:flutter/material.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/colors.dart';
import '../../divider/divider.dart';
import '../../constants/widgets.dart';

enum AppQualificationType{ award, education, experience}

abstract class QualificationContract{
  final AppQualificationType qualificationType;
  final String name;
  final String institutionName;
  final String? educationType;
  final DateTime? issuedOn;
  final DateTime? dateStarted;
  final DateTime? dateEnded;

  QualificationContract({
    required this.name,
    required this.qualificationType,
    required this.institutionName,
    this.educationType,
    this.issuedOn,
    this.dateStarted,
    this.dateEnded,
  }):assert(
  (qualificationType == AppQualificationType.award && issuedOn != null) ||
  (qualificationType == AppQualificationType.education && educationType != null && issuedOn != null) ||
  (qualificationType == AppQualificationType.experience && dateStarted != null)
  );
}
class AppProfileQualification extends StatelessWidget{
  final QualificationContract qualification;

  const AppProfileQualification({
    super.key,
    required this.qualification,
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
                    Text(qualification.name, style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600
                    ),),
                    if(qualification.educationType!=null)Text(qualification.educationType!, style: theme.textTheme.bodySmall,),
                    Text(qualification.institutionName, style: theme.textTheme.bodySmall,),
                    if(qualification.issuedOn!=null) Text(
                      qualification.issuedOn!.toMonthYearString(),
                      style: theme.textTheme.bodySmall!.copyWith(color: neutrals500Color),
                    ),
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