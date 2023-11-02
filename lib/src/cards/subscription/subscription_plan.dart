import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 200,
      child: Card(
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
          padding: const EdgeInsets.all(16.0),
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
                  ),),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: includedItems.map((e) => ListTile(
                        dense:true,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                        titleAlignment: ListTileTitleAlignment.titleHeight,
                        leading: const Icon(Iconsax.tick_square),
                        title: Text (e)
                    )).toList(),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }

}