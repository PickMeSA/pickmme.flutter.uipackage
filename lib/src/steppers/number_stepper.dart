import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class NumberStepper extends StatelessWidget{
  final int number;
  final double? width;
  final VoidCallback? incrementFunction;
  final VoidCallback? subtractFunction;
  final Color subtractColor;
  // final MaterialStateProperty<OutlinedBorder?>? shape
  const NumberStepper({
    super.key,
    required this.number,
    required this.incrementFunction,
    required this.subtractFunction,
    this.width = 155,
    this.subtractColor = secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(
            color: neutrals200Color,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(60))
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 20, right: 20),
        child: Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: OutlinedButton(
                  onPressed: subtractFunction,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                    side: MaterialStateProperty.all(const BorderSide(
                        style: BorderStyle.solid,
                        width: 1.2)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            // <-- this doesn't work at all in shape.
                          )),
                  ),
                  child: Icon(Icons.remove, size: 16, color: Theme.of(context).colorScheme.secondary,)
              ),
            ),
            Expanded(child: Center(child: Text(number.toString(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),))),
            SizedBox(
              width: 20,
              height: 20,
              child: OutlinedButton(
                  onPressed: subtractFunction,
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                      side: MaterialStateProperty.all(const BorderSide(
                          style: BorderStyle.solid,
                          color: primaryColor,
                          width: 1.2)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        )),
                  ),
                  child: const Icon(Icons.add, size: 16, color: primaryColor,),

              ),
            ),
          ],
        ),
      ),
    );
  }

}