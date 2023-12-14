import 'package:flutter/material.dart';
import 'package:flutter_ui_components/src/constants/colors.dart';

class ChipOption{
  final String label;
  final int id;

  ChipOption({required this.label, required this.id});
}
class ChipGroup extends StatelessWidget{
  final List<ChipOption> inputs;

  /// Function for on deleted like
  ///   onDeleted: () {
  ///     setState(() {
  ///       inputs = inputs - 1;
  ///     });
  ///   }
  ///
  final Function(int)? onDeleted;

  const ChipGroup({
    super.key,
    required this.inputs,
    this.onDeleted,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 5.0,
          children: [
            for(int i=0; i<inputs.length; i++)
              SizedBox(
                height: 46,
                child: Builder(
                    builder: (context) {
                      if(onDeleted != null) {
                        return InputChip(
                          deleteIconColor: secondaryColor,
                          label: Text(inputs[i].label),
                          // selected: selectedIndex == index,
                          onDeleted: () => onDeleted!.call(i),
                        );
                      }
                      return ActionChip(
                        label: Text(inputs[i].label),
                        onPressed: (){},
                      );
                    }
                ),
              )
          ],
        ),

      ],
    );
  }

}