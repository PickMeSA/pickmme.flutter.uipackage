import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/widgets.dart';
import 'package:iconsax/iconsax.dart';
import '../../extensions/string.dart';
import '../../divider/divider.dart';
enum EntityType{ business, individual}
class AppSubscriptionPlan extends StatelessWidget{
  final String price;
  final String subscriptionType;
  final EntityType entityType;
  final List<String> includedItems;
  final Color? color;
  final bool selected;

  const AppSubscriptionPlan({
    super.key,
    required this.price,
    required this.subscriptionType,
    required this.entityType,
    required this.includedItems,
    this.color,
    this.selected = false
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          width: 2,
          color: selected?(color??(entityType==EntityType.individual?
          const Color(0xFF3EB62B):
          const Color(0xFF23A8B3))):
          Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(price, style: Theme.of(context).textTheme.headlineMedium,),
                Expanded(child: Text(" / $subscriptionType", style: Theme.of(context).textTheme.bodyLarge,))
              ],
            ),
            const AppDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(entityType.name.capitalizeFirstLetter(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: color??(entityType==EntityType.individual?
                  const Color(0xFF3EB62B):
                  const Color(0xFF23A8B3)),
                  fontWeight: FontWeight.w400
                ),),
            ),
            Column(
              children: includedItems.map((e) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    const Icon(Iconsax.tick_square, size: 16,),
                    rowRegularSpacing,
                    Text (e, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      // fontWeight: FontWeight.w300,
                    ),)
                  ],
                ),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

}